import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/services/api_service.dart';
import '../core/models/leave_request.dart';
import '../core/models/leave_balance.dart';
import '../core/models/leave_statistics.dart';
import '../core/models/create_leave_request_dto.dart';
import '../core/models/leave_type.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final leaveTypesProvider = FutureProvider<List<LeaveType>>((ref) async {
  // Stubbed for now. Ideally, you would fetch this via the apiService.
  return [
    LeaveType(id: '1', name: 'Annual Leave', defaultDays: 20, colorCode: '0xFF4CAF50', requiresApproval: true, isPaid: true, description: '', maxConsecutiveDays: 14, isActive: true),
    LeaveType(id: '2', name: 'Sick Leave', defaultDays: 10, colorCode: '0xFFF44336', requiresApproval: true, isPaid: true, description: '', maxConsecutiveDays: 5, isActive: true),
  ];
});

final leaveRequestsProvider = FutureProvider.family<List<LeaveRequest>, String?>((ref, status) async {
  final api = ref.watch(apiServiceProvider);
  return api.getLeaveRequests(status: status);
});

final leaveBalancesProvider = FutureProvider<List<LeaveBalance>>((ref) async {
  // TODO: Replace with real API call once backend is connected:
  // final api = ref.watch(apiServiceProvider);
  // return api.getLeaveBalances();

  // --- MOCK DATA ---
  await Future.delayed(const Duration(milliseconds: 300));
  return [
    LeaveBalance(
      leaveTypeId: '1',
      leaveTypeName: 'Annual Leave',
      totalDays: 20,
      usedDays: 5,
      pendingDays: 0,
    ),
    LeaveBalance(
      leaveTypeId: '2',
      leaveTypeName: 'Sick Leave',
      totalDays: 10,
      usedDays: 8,
      pendingDays: 0,
    ),
    LeaveBalance(
      leaveTypeId: '3',
      leaveTypeName: 'Casual Leave',
      totalDays: 7,
      usedDays: 3,
      pendingDays: 1,
    ),
  ];
});

class LeaveRequestNotifier extends AsyncNotifier<List<LeaveRequest>> {
  @override
  Future<List<LeaveRequest>> build() async {
    // TODO: Replace with real API call once backend is connected:
    // final api = ref.watch(apiServiceProvider);
    // return api.getLeaveRequests();

    // --- MOCK DATA (for development / no backend) ---
    await Future.delayed(const Duration(milliseconds: 400)); // simulate network
    final now = DateTime.now();
    return [
      LeaveRequest(
        id: '1',
        employeeId: 'emp-001',
        leaveTypeId: '1',
        leaveTypeName: 'Annual Leave',
        startDate: now.add(const Duration(days: 3)),
        endDate: now.add(const Duration(days: 7)),
        totalDays: 5,
        reason: 'Family vacation',
        status: LeaveStatus.pending,
        requestDate: now.subtract(const Duration(days: 1)),
      ),
      LeaveRequest(
        id: '2',
        employeeId: 'emp-001',
        leaveTypeId: '2',
        leaveTypeName: 'Sick Leave',
        startDate: now.subtract(const Duration(days: 10)),
        endDate: now.subtract(const Duration(days: 9)),
        totalDays: 2,
        reason: 'Flu',
        status: LeaveStatus.approved,
        requestDate: now.subtract(const Duration(days: 12)),
        approvedDate: now.subtract(const Duration(days: 11)),
        approvedBy: 'Manager',
      ),
      LeaveRequest(
        id: '3',
        employeeId: 'emp-001',
        leaveTypeId: '1',
        leaveTypeName: 'Annual Leave',
        startDate: now.subtract(const Duration(days: 30)),
        endDate: now.subtract(const Duration(days: 28)),
        totalDays: 3,
        reason: 'Personal errands',
        status: LeaveStatus.rejected,
        requestDate: now.subtract(const Duration(days: 35)),
        rejectionReason: 'Insufficient leave balance',
      ),
    ];
  }

  Future<void> createLeaveRequest(CreateLeaveRequestDto request) async {
    state = const AsyncLoading();
    try {
      final api = ref.watch(apiServiceProvider);
      final newRequest = await api.createLeaveRequest(request);
      
      final currentRequests = state.value ?? [];
      state = AsyncData([newRequest, ...currentRequests]);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> approveRequest(String id, bool isApproved, String? reason) async {
    final currentState = state.value;
    if (currentState == null) return;

    try {
      final api = ref.watch(apiServiceProvider);
      final updatedRequest = await api.approveLeaveRequest(id, isApproved, reason);
      
      state = AsyncData([
        for (final request in currentState)
          if (request.id == id) updatedRequest else request
      ]);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> cancelRequest(String id) async {
    final currentState = state.value;
    if (currentState == null) return;

    try {
      final api = ref.watch(apiServiceProvider);
      await api.cancelLeaveRequest(id);
      
      state = AsyncData([
        for (final request in currentState)
          if (request.id == id) 
            request.copyWith(status: LeaveStatus.cancelled) 
          else request
      ]);
    } catch (e) {
      rethrow;
    }
  }
}

final leaveRequestNotifierProvider = AsyncNotifierProvider<LeaveRequestNotifier, List<LeaveRequest>>(
  LeaveRequestNotifier.new,
);

final leaveStatisticsProvider = FutureProvider.family<LeaveStatistics, int>((ref, year) async {
  final api = ref.watch(apiServiceProvider);
  return api.getLeaveStatistics(year);
});
