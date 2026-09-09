// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaveRequest {

 String get id; String get employeeId; String get leaveTypeId; String get leaveTypeName; DateTime get startDate; DateTime get endDate; int get totalDays; String get reason;@JsonKey(unknownEnumValue: LeaveStatus.pending) LeaveStatus get status; DateTime get requestDate; DateTime? get approvedDate; String? get approvedBy; String? get rejectionReason; bool get isHalfDay; String? get attachmentUrl; Employee? get employee; Employee? get approver;
/// Create a copy of LeaveRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaveRequestCopyWith<LeaveRequest> get copyWith => _$LeaveRequestCopyWithImpl<LeaveRequest>(this as LeaveRequest, _$identity);

  /// Serializes this LeaveRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaveRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.leaveTypeId, leaveTypeId) || other.leaveTypeId == leaveTypeId)&&(identical(other.leaveTypeName, leaveTypeName) || other.leaveTypeName == leaveTypeName)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.status, status) || other.status == status)&&(identical(other.requestDate, requestDate) || other.requestDate == requestDate)&&(identical(other.approvedDate, approvedDate) || other.approvedDate == approvedDate)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.isHalfDay, isHalfDay) || other.isHalfDay == isHalfDay)&&(identical(other.attachmentUrl, attachmentUrl) || other.attachmentUrl == attachmentUrl)&&(identical(other.employee, employee) || other.employee == employee)&&(identical(other.approver, approver) || other.approver == approver));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,employeeId,leaveTypeId,leaveTypeName,startDate,endDate,totalDays,reason,status,requestDate,approvedDate,approvedBy,rejectionReason,isHalfDay,attachmentUrl,employee,approver);

@override
String toString() {
  return 'LeaveRequest(id: $id, employeeId: $employeeId, leaveTypeId: $leaveTypeId, leaveTypeName: $leaveTypeName, startDate: $startDate, endDate: $endDate, totalDays: $totalDays, reason: $reason, status: $status, requestDate: $requestDate, approvedDate: $approvedDate, approvedBy: $approvedBy, rejectionReason: $rejectionReason, isHalfDay: $isHalfDay, attachmentUrl: $attachmentUrl, employee: $employee, approver: $approver)';
}


}

/// @nodoc
abstract mixin class $LeaveRequestCopyWith<$Res>  {
  factory $LeaveRequestCopyWith(LeaveRequest value, $Res Function(LeaveRequest) _then) = _$LeaveRequestCopyWithImpl;
@useResult
$Res call({
 String id, String employeeId, String leaveTypeId, String leaveTypeName, DateTime startDate, DateTime endDate, int totalDays, String reason,@JsonKey(unknownEnumValue: LeaveStatus.pending) LeaveStatus status, DateTime requestDate, DateTime? approvedDate, String? approvedBy, String? rejectionReason, bool isHalfDay, String? attachmentUrl, Employee? employee, Employee? approver
});




}
/// @nodoc
class _$LeaveRequestCopyWithImpl<$Res>
    implements $LeaveRequestCopyWith<$Res> {
  _$LeaveRequestCopyWithImpl(this._self, this._then);

  final LeaveRequest _self;
  final $Res Function(LeaveRequest) _then;

/// Create a copy of LeaveRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? employeeId = null,Object? leaveTypeId = null,Object? leaveTypeName = null,Object? startDate = null,Object? endDate = null,Object? totalDays = null,Object? reason = null,Object? status = null,Object? requestDate = null,Object? approvedDate = freezed,Object? approvedBy = freezed,Object? rejectionReason = freezed,Object? isHalfDay = null,Object? attachmentUrl = freezed,Object? employee = freezed,Object? approver = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,leaveTypeId: null == leaveTypeId ? _self.leaveTypeId : leaveTypeId // ignore: cast_nullable_to_non_nullable
as String,leaveTypeName: null == leaveTypeName ? _self.leaveTypeName : leaveTypeName // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,totalDays: null == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LeaveStatus,requestDate: null == requestDate ? _self.requestDate : requestDate // ignore: cast_nullable_to_non_nullable
as DateTime,approvedDate: freezed == approvedDate ? _self.approvedDate : approvedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,isHalfDay: null == isHalfDay ? _self.isHalfDay : isHalfDay // ignore: cast_nullable_to_non_nullable
as bool,attachmentUrl: freezed == attachmentUrl ? _self.attachmentUrl : attachmentUrl // ignore: cast_nullable_to_non_nullable
as String?,employee: freezed == employee ? _self.employee : employee // ignore: cast_nullable_to_non_nullable
as Employee?,approver: freezed == approver ? _self.approver : approver // ignore: cast_nullable_to_non_nullable
as Employee?,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaveRequest].
extension LeaveRequestPatterns on LeaveRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaveRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaveRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaveRequest value)  $default,){
final _that = this;
switch (_that) {
case _LeaveRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaveRequest value)?  $default,){
final _that = this;
switch (_that) {
case _LeaveRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String employeeId,  String leaveTypeId,  String leaveTypeName,  DateTime startDate,  DateTime endDate,  int totalDays,  String reason, @JsonKey(unknownEnumValue: LeaveStatus.pending)  LeaveStatus status,  DateTime requestDate,  DateTime? approvedDate,  String? approvedBy,  String? rejectionReason,  bool isHalfDay,  String? attachmentUrl,  Employee? employee,  Employee? approver)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaveRequest() when $default != null:
return $default(_that.id,_that.employeeId,_that.leaveTypeId,_that.leaveTypeName,_that.startDate,_that.endDate,_that.totalDays,_that.reason,_that.status,_that.requestDate,_that.approvedDate,_that.approvedBy,_that.rejectionReason,_that.isHalfDay,_that.attachmentUrl,_that.employee,_that.approver);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String employeeId,  String leaveTypeId,  String leaveTypeName,  DateTime startDate,  DateTime endDate,  int totalDays,  String reason, @JsonKey(unknownEnumValue: LeaveStatus.pending)  LeaveStatus status,  DateTime requestDate,  DateTime? approvedDate,  String? approvedBy,  String? rejectionReason,  bool isHalfDay,  String? attachmentUrl,  Employee? employee,  Employee? approver)  $default,) {final _that = this;
switch (_that) {
case _LeaveRequest():
return $default(_that.id,_that.employeeId,_that.leaveTypeId,_that.leaveTypeName,_that.startDate,_that.endDate,_that.totalDays,_that.reason,_that.status,_that.requestDate,_that.approvedDate,_that.approvedBy,_that.rejectionReason,_that.isHalfDay,_that.attachmentUrl,_that.employee,_that.approver);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String employeeId,  String leaveTypeId,  String leaveTypeName,  DateTime startDate,  DateTime endDate,  int totalDays,  String reason, @JsonKey(unknownEnumValue: LeaveStatus.pending)  LeaveStatus status,  DateTime requestDate,  DateTime? approvedDate,  String? approvedBy,  String? rejectionReason,  bool isHalfDay,  String? attachmentUrl,  Employee? employee,  Employee? approver)?  $default,) {final _that = this;
switch (_that) {
case _LeaveRequest() when $default != null:
return $default(_that.id,_that.employeeId,_that.leaveTypeId,_that.leaveTypeName,_that.startDate,_that.endDate,_that.totalDays,_that.reason,_that.status,_that.requestDate,_that.approvedDate,_that.approvedBy,_that.rejectionReason,_that.isHalfDay,_that.attachmentUrl,_that.employee,_that.approver);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _LeaveRequest extends LeaveRequest {
   _LeaveRequest({required this.id, required this.employeeId, required this.leaveTypeId, required this.leaveTypeName, required this.startDate, required this.endDate, required this.totalDays, required this.reason, @JsonKey(unknownEnumValue: LeaveStatus.pending) required this.status, required this.requestDate, this.approvedDate, this.approvedBy, this.rejectionReason, this.isHalfDay = false, this.attachmentUrl, this.employee, this.approver}): super._();
  factory _LeaveRequest.fromJson(Map<String, dynamic> json) => _$LeaveRequestFromJson(json);

@override final  String id;
@override final  String employeeId;
@override final  String leaveTypeId;
@override final  String leaveTypeName;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  int totalDays;
@override final  String reason;
@override@JsonKey(unknownEnumValue: LeaveStatus.pending) final  LeaveStatus status;
@override final  DateTime requestDate;
@override final  DateTime? approvedDate;
@override final  String? approvedBy;
@override final  String? rejectionReason;
@override@JsonKey() final  bool isHalfDay;
@override final  String? attachmentUrl;
@override final  Employee? employee;
@override final  Employee? approver;

/// Create a copy of LeaveRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaveRequestCopyWith<_LeaveRequest> get copyWith => __$LeaveRequestCopyWithImpl<_LeaveRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaveRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaveRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.leaveTypeId, leaveTypeId) || other.leaveTypeId == leaveTypeId)&&(identical(other.leaveTypeName, leaveTypeName) || other.leaveTypeName == leaveTypeName)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.status, status) || other.status == status)&&(identical(other.requestDate, requestDate) || other.requestDate == requestDate)&&(identical(other.approvedDate, approvedDate) || other.approvedDate == approvedDate)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.isHalfDay, isHalfDay) || other.isHalfDay == isHalfDay)&&(identical(other.attachmentUrl, attachmentUrl) || other.attachmentUrl == attachmentUrl)&&(identical(other.employee, employee) || other.employee == employee)&&(identical(other.approver, approver) || other.approver == approver));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,employeeId,leaveTypeId,leaveTypeName,startDate,endDate,totalDays,reason,status,requestDate,approvedDate,approvedBy,rejectionReason,isHalfDay,attachmentUrl,employee,approver);

@override
String toString() {
  return 'LeaveRequest(id: $id, employeeId: $employeeId, leaveTypeId: $leaveTypeId, leaveTypeName: $leaveTypeName, startDate: $startDate, endDate: $endDate, totalDays: $totalDays, reason: $reason, status: $status, requestDate: $requestDate, approvedDate: $approvedDate, approvedBy: $approvedBy, rejectionReason: $rejectionReason, isHalfDay: $isHalfDay, attachmentUrl: $attachmentUrl, employee: $employee, approver: $approver)';
}


}

/// @nodoc
abstract mixin class _$LeaveRequestCopyWith<$Res> implements $LeaveRequestCopyWith<$Res> {
  factory _$LeaveRequestCopyWith(_LeaveRequest value, $Res Function(_LeaveRequest) _then) = __$LeaveRequestCopyWithImpl;
@override @useResult
$Res call({
 String id, String employeeId, String leaveTypeId, String leaveTypeName, DateTime startDate, DateTime endDate, int totalDays, String reason,@JsonKey(unknownEnumValue: LeaveStatus.pending) LeaveStatus status, DateTime requestDate, DateTime? approvedDate, String? approvedBy, String? rejectionReason, bool isHalfDay, String? attachmentUrl, Employee? employee, Employee? approver
});




}
/// @nodoc
class __$LeaveRequestCopyWithImpl<$Res>
    implements _$LeaveRequestCopyWith<$Res> {
  __$LeaveRequestCopyWithImpl(this._self, this._then);

  final _LeaveRequest _self;
  final $Res Function(_LeaveRequest) _then;

/// Create a copy of LeaveRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? employeeId = null,Object? leaveTypeId = null,Object? leaveTypeName = null,Object? startDate = null,Object? endDate = null,Object? totalDays = null,Object? reason = null,Object? status = null,Object? requestDate = null,Object? approvedDate = freezed,Object? approvedBy = freezed,Object? rejectionReason = freezed,Object? isHalfDay = null,Object? attachmentUrl = freezed,Object? employee = freezed,Object? approver = freezed,}) {
  return _then(_LeaveRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,leaveTypeId: null == leaveTypeId ? _self.leaveTypeId : leaveTypeId // ignore: cast_nullable_to_non_nullable
as String,leaveTypeName: null == leaveTypeName ? _self.leaveTypeName : leaveTypeName // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,totalDays: null == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LeaveStatus,requestDate: null == requestDate ? _self.requestDate : requestDate // ignore: cast_nullable_to_non_nullable
as DateTime,approvedDate: freezed == approvedDate ? _self.approvedDate : approvedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,isHalfDay: null == isHalfDay ? _self.isHalfDay : isHalfDay // ignore: cast_nullable_to_non_nullable
as bool,attachmentUrl: freezed == attachmentUrl ? _self.attachmentUrl : attachmentUrl // ignore: cast_nullable_to_non_nullable
as String?,employee: freezed == employee ? _self.employee : employee // ignore: cast_nullable_to_non_nullable
as Employee?,approver: freezed == approver ? _self.approver : approver // ignore: cast_nullable_to_non_nullable
as Employee?,
  ));
}


}

// dart format on
