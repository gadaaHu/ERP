// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Attendance {

 String get id; String get userId; String get employeeName; DateTime get date; DateTime? get clockInTime; DateTime? get clockOutTime; double? get totalHours; double? get overtimeHours;@JsonKey(unknownEnumValue: AttendanceStatus.present) AttendanceStatus get status;@JsonKey(unknownEnumValue: AttendanceType.regular) AttendanceType get type; String? get clockInLocation; String? get clockOutLocation; String? get notes; bool get isApproved; String? get approvedBy;
/// Create a copy of Attendance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceCopyWith<Attendance> get copyWith => _$AttendanceCopyWithImpl<Attendance>(this as Attendance, _$identity);

  /// Serializes this Attendance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Attendance&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.employeeName, employeeName) || other.employeeName == employeeName)&&(identical(other.date, date) || other.date == date)&&(identical(other.clockInTime, clockInTime) || other.clockInTime == clockInTime)&&(identical(other.clockOutTime, clockOutTime) || other.clockOutTime == clockOutTime)&&(identical(other.totalHours, totalHours) || other.totalHours == totalHours)&&(identical(other.overtimeHours, overtimeHours) || other.overtimeHours == overtimeHours)&&(identical(other.status, status) || other.status == status)&&(identical(other.type, type) || other.type == type)&&(identical(other.clockInLocation, clockInLocation) || other.clockInLocation == clockInLocation)&&(identical(other.clockOutLocation, clockOutLocation) || other.clockOutLocation == clockOutLocation)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isApproved, isApproved) || other.isApproved == isApproved)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,employeeName,date,clockInTime,clockOutTime,totalHours,overtimeHours,status,type,clockInLocation,clockOutLocation,notes,isApproved,approvedBy);

@override
String toString() {
  return 'Attendance(id: $id, userId: $userId, employeeName: $employeeName, date: $date, clockInTime: $clockInTime, clockOutTime: $clockOutTime, totalHours: $totalHours, overtimeHours: $overtimeHours, status: $status, type: $type, clockInLocation: $clockInLocation, clockOutLocation: $clockOutLocation, notes: $notes, isApproved: $isApproved, approvedBy: $approvedBy)';
}


}

/// @nodoc
abstract mixin class $AttendanceCopyWith<$Res>  {
  factory $AttendanceCopyWith(Attendance value, $Res Function(Attendance) _then) = _$AttendanceCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String employeeName, DateTime date, DateTime? clockInTime, DateTime? clockOutTime, double? totalHours, double? overtimeHours,@JsonKey(unknownEnumValue: AttendanceStatus.present) AttendanceStatus status,@JsonKey(unknownEnumValue: AttendanceType.regular) AttendanceType type, String? clockInLocation, String? clockOutLocation, String? notes, bool isApproved, String? approvedBy
});




}
/// @nodoc
class _$AttendanceCopyWithImpl<$Res>
    implements $AttendanceCopyWith<$Res> {
  _$AttendanceCopyWithImpl(this._self, this._then);

  final Attendance _self;
  final $Res Function(Attendance) _then;

/// Create a copy of Attendance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? employeeName = null,Object? date = null,Object? clockInTime = freezed,Object? clockOutTime = freezed,Object? totalHours = freezed,Object? overtimeHours = freezed,Object? status = null,Object? type = null,Object? clockInLocation = freezed,Object? clockOutLocation = freezed,Object? notes = freezed,Object? isApproved = null,Object? approvedBy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,employeeName: null == employeeName ? _self.employeeName : employeeName // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,clockInTime: freezed == clockInTime ? _self.clockInTime : clockInTime // ignore: cast_nullable_to_non_nullable
as DateTime?,clockOutTime: freezed == clockOutTime ? _self.clockOutTime : clockOutTime // ignore: cast_nullable_to_non_nullable
as DateTime?,totalHours: freezed == totalHours ? _self.totalHours : totalHours // ignore: cast_nullable_to_non_nullable
as double?,overtimeHours: freezed == overtimeHours ? _self.overtimeHours : overtimeHours // ignore: cast_nullable_to_non_nullable
as double?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AttendanceStatus,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AttendanceType,clockInLocation: freezed == clockInLocation ? _self.clockInLocation : clockInLocation // ignore: cast_nullable_to_non_nullable
as String?,clockOutLocation: freezed == clockOutLocation ? _self.clockOutLocation : clockOutLocation // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isApproved: null == isApproved ? _self.isApproved : isApproved // ignore: cast_nullable_to_non_nullable
as bool,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Attendance].
extension AttendancePatterns on Attendance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Attendance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Attendance() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Attendance value)  $default,){
final _that = this;
switch (_that) {
case _Attendance():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Attendance value)?  $default,){
final _that = this;
switch (_that) {
case _Attendance() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String employeeName,  DateTime date,  DateTime? clockInTime,  DateTime? clockOutTime,  double? totalHours,  double? overtimeHours, @JsonKey(unknownEnumValue: AttendanceStatus.present)  AttendanceStatus status, @JsonKey(unknownEnumValue: AttendanceType.regular)  AttendanceType type,  String? clockInLocation,  String? clockOutLocation,  String? notes,  bool isApproved,  String? approvedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Attendance() when $default != null:
return $default(_that.id,_that.userId,_that.employeeName,_that.date,_that.clockInTime,_that.clockOutTime,_that.totalHours,_that.overtimeHours,_that.status,_that.type,_that.clockInLocation,_that.clockOutLocation,_that.notes,_that.isApproved,_that.approvedBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String employeeName,  DateTime date,  DateTime? clockInTime,  DateTime? clockOutTime,  double? totalHours,  double? overtimeHours, @JsonKey(unknownEnumValue: AttendanceStatus.present)  AttendanceStatus status, @JsonKey(unknownEnumValue: AttendanceType.regular)  AttendanceType type,  String? clockInLocation,  String? clockOutLocation,  String? notes,  bool isApproved,  String? approvedBy)  $default,) {final _that = this;
switch (_that) {
case _Attendance():
return $default(_that.id,_that.userId,_that.employeeName,_that.date,_that.clockInTime,_that.clockOutTime,_that.totalHours,_that.overtimeHours,_that.status,_that.type,_that.clockInLocation,_that.clockOutLocation,_that.notes,_that.isApproved,_that.approvedBy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String employeeName,  DateTime date,  DateTime? clockInTime,  DateTime? clockOutTime,  double? totalHours,  double? overtimeHours, @JsonKey(unknownEnumValue: AttendanceStatus.present)  AttendanceStatus status, @JsonKey(unknownEnumValue: AttendanceType.regular)  AttendanceType type,  String? clockInLocation,  String? clockOutLocation,  String? notes,  bool isApproved,  String? approvedBy)?  $default,) {final _that = this;
switch (_that) {
case _Attendance() when $default != null:
return $default(_that.id,_that.userId,_that.employeeName,_that.date,_that.clockInTime,_that.clockOutTime,_that.totalHours,_that.overtimeHours,_that.status,_that.type,_that.clockInLocation,_that.clockOutLocation,_that.notes,_that.isApproved,_that.approvedBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Attendance extends Attendance {
   _Attendance({required this.id, required this.userId, required this.employeeName, required this.date, this.clockInTime, this.clockOutTime, this.totalHours, this.overtimeHours, @JsonKey(unknownEnumValue: AttendanceStatus.present) required this.status, @JsonKey(unknownEnumValue: AttendanceType.regular) required this.type, this.clockInLocation, this.clockOutLocation, this.notes, required this.isApproved, this.approvedBy}): super._();
  factory _Attendance.fromJson(Map<String, dynamic> json) => _$AttendanceFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String employeeName;
@override final  DateTime date;
@override final  DateTime? clockInTime;
@override final  DateTime? clockOutTime;
@override final  double? totalHours;
@override final  double? overtimeHours;
@override@JsonKey(unknownEnumValue: AttendanceStatus.present) final  AttendanceStatus status;
@override@JsonKey(unknownEnumValue: AttendanceType.regular) final  AttendanceType type;
@override final  String? clockInLocation;
@override final  String? clockOutLocation;
@override final  String? notes;
@override final  bool isApproved;
@override final  String? approvedBy;

/// Create a copy of Attendance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceCopyWith<_Attendance> get copyWith => __$AttendanceCopyWithImpl<_Attendance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Attendance&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.employeeName, employeeName) || other.employeeName == employeeName)&&(identical(other.date, date) || other.date == date)&&(identical(other.clockInTime, clockInTime) || other.clockInTime == clockInTime)&&(identical(other.clockOutTime, clockOutTime) || other.clockOutTime == clockOutTime)&&(identical(other.totalHours, totalHours) || other.totalHours == totalHours)&&(identical(other.overtimeHours, overtimeHours) || other.overtimeHours == overtimeHours)&&(identical(other.status, status) || other.status == status)&&(identical(other.type, type) || other.type == type)&&(identical(other.clockInLocation, clockInLocation) || other.clockInLocation == clockInLocation)&&(identical(other.clockOutLocation, clockOutLocation) || other.clockOutLocation == clockOutLocation)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isApproved, isApproved) || other.isApproved == isApproved)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,employeeName,date,clockInTime,clockOutTime,totalHours,overtimeHours,status,type,clockInLocation,clockOutLocation,notes,isApproved,approvedBy);

@override
String toString() {
  return 'Attendance(id: $id, userId: $userId, employeeName: $employeeName, date: $date, clockInTime: $clockInTime, clockOutTime: $clockOutTime, totalHours: $totalHours, overtimeHours: $overtimeHours, status: $status, type: $type, clockInLocation: $clockInLocation, clockOutLocation: $clockOutLocation, notes: $notes, isApproved: $isApproved, approvedBy: $approvedBy)';
}


}

/// @nodoc
abstract mixin class _$AttendanceCopyWith<$Res> implements $AttendanceCopyWith<$Res> {
  factory _$AttendanceCopyWith(_Attendance value, $Res Function(_Attendance) _then) = __$AttendanceCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String employeeName, DateTime date, DateTime? clockInTime, DateTime? clockOutTime, double? totalHours, double? overtimeHours,@JsonKey(unknownEnumValue: AttendanceStatus.present) AttendanceStatus status,@JsonKey(unknownEnumValue: AttendanceType.regular) AttendanceType type, String? clockInLocation, String? clockOutLocation, String? notes, bool isApproved, String? approvedBy
});




}
/// @nodoc
class __$AttendanceCopyWithImpl<$Res>
    implements _$AttendanceCopyWith<$Res> {
  __$AttendanceCopyWithImpl(this._self, this._then);

  final _Attendance _self;
  final $Res Function(_Attendance) _then;

/// Create a copy of Attendance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? employeeName = null,Object? date = null,Object? clockInTime = freezed,Object? clockOutTime = freezed,Object? totalHours = freezed,Object? overtimeHours = freezed,Object? status = null,Object? type = null,Object? clockInLocation = freezed,Object? clockOutLocation = freezed,Object? notes = freezed,Object? isApproved = null,Object? approvedBy = freezed,}) {
  return _then(_Attendance(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,employeeName: null == employeeName ? _self.employeeName : employeeName // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,clockInTime: freezed == clockInTime ? _self.clockInTime : clockInTime // ignore: cast_nullable_to_non_nullable
as DateTime?,clockOutTime: freezed == clockOutTime ? _self.clockOutTime : clockOutTime // ignore: cast_nullable_to_non_nullable
as DateTime?,totalHours: freezed == totalHours ? _self.totalHours : totalHours // ignore: cast_nullable_to_non_nullable
as double?,overtimeHours: freezed == overtimeHours ? _self.overtimeHours : overtimeHours // ignore: cast_nullable_to_non_nullable
as double?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AttendanceStatus,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AttendanceType,clockInLocation: freezed == clockInLocation ? _self.clockInLocation : clockInLocation // ignore: cast_nullable_to_non_nullable
as String?,clockOutLocation: freezed == clockOutLocation ? _self.clockOutLocation : clockOutLocation // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isApproved: null == isApproved ? _self.isApproved : isApproved // ignore: cast_nullable_to_non_nullable
as bool,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AttendanceStatistics {

 int get totalDays; int get presentDays; int get absentDays; int get lateDays; int get halfDays; int get leaveDays; int get holidayDays; int get workFromHomeDays; int get businessTripDays; double get averageHours; double get totalOvertime; double get attendancePercentage; Map<String, int> get monthlyBreakdown; Map<String, double> get weeklyHours;
/// Create a copy of AttendanceStatistics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceStatisticsCopyWith<AttendanceStatistics> get copyWith => _$AttendanceStatisticsCopyWithImpl<AttendanceStatistics>(this as AttendanceStatistics, _$identity);

  /// Serializes this AttendanceStatistics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceStatistics&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays)&&(identical(other.presentDays, presentDays) || other.presentDays == presentDays)&&(identical(other.absentDays, absentDays) || other.absentDays == absentDays)&&(identical(other.lateDays, lateDays) || other.lateDays == lateDays)&&(identical(other.halfDays, halfDays) || other.halfDays == halfDays)&&(identical(other.leaveDays, leaveDays) || other.leaveDays == leaveDays)&&(identical(other.holidayDays, holidayDays) || other.holidayDays == holidayDays)&&(identical(other.workFromHomeDays, workFromHomeDays) || other.workFromHomeDays == workFromHomeDays)&&(identical(other.businessTripDays, businessTripDays) || other.businessTripDays == businessTripDays)&&(identical(other.averageHours, averageHours) || other.averageHours == averageHours)&&(identical(other.totalOvertime, totalOvertime) || other.totalOvertime == totalOvertime)&&(identical(other.attendancePercentage, attendancePercentage) || other.attendancePercentage == attendancePercentage)&&const DeepCollectionEquality().equals(other.monthlyBreakdown, monthlyBreakdown)&&const DeepCollectionEquality().equals(other.weeklyHours, weeklyHours));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalDays,presentDays,absentDays,lateDays,halfDays,leaveDays,holidayDays,workFromHomeDays,businessTripDays,averageHours,totalOvertime,attendancePercentage,const DeepCollectionEquality().hash(monthlyBreakdown),const DeepCollectionEquality().hash(weeklyHours));

@override
String toString() {
  return 'AttendanceStatistics(totalDays: $totalDays, presentDays: $presentDays, absentDays: $absentDays, lateDays: $lateDays, halfDays: $halfDays, leaveDays: $leaveDays, holidayDays: $holidayDays, workFromHomeDays: $workFromHomeDays, businessTripDays: $businessTripDays, averageHours: $averageHours, totalOvertime: $totalOvertime, attendancePercentage: $attendancePercentage, monthlyBreakdown: $monthlyBreakdown, weeklyHours: $weeklyHours)';
}


}

/// @nodoc
abstract mixin class $AttendanceStatisticsCopyWith<$Res>  {
  factory $AttendanceStatisticsCopyWith(AttendanceStatistics value, $Res Function(AttendanceStatistics) _then) = _$AttendanceStatisticsCopyWithImpl;
@useResult
$Res call({
 int totalDays, int presentDays, int absentDays, int lateDays, int halfDays, int leaveDays, int holidayDays, int workFromHomeDays, int businessTripDays, double averageHours, double totalOvertime, double attendancePercentage, Map<String, int> monthlyBreakdown, Map<String, double> weeklyHours
});




}
/// @nodoc
class _$AttendanceStatisticsCopyWithImpl<$Res>
    implements $AttendanceStatisticsCopyWith<$Res> {
  _$AttendanceStatisticsCopyWithImpl(this._self, this._then);

  final AttendanceStatistics _self;
  final $Res Function(AttendanceStatistics) _then;

/// Create a copy of AttendanceStatistics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalDays = null,Object? presentDays = null,Object? absentDays = null,Object? lateDays = null,Object? halfDays = null,Object? leaveDays = null,Object? holidayDays = null,Object? workFromHomeDays = null,Object? businessTripDays = null,Object? averageHours = null,Object? totalOvertime = null,Object? attendancePercentage = null,Object? monthlyBreakdown = null,Object? weeklyHours = null,}) {
  return _then(_self.copyWith(
totalDays: null == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int,presentDays: null == presentDays ? _self.presentDays : presentDays // ignore: cast_nullable_to_non_nullable
as int,absentDays: null == absentDays ? _self.absentDays : absentDays // ignore: cast_nullable_to_non_nullable
as int,lateDays: null == lateDays ? _self.lateDays : lateDays // ignore: cast_nullable_to_non_nullable
as int,halfDays: null == halfDays ? _self.halfDays : halfDays // ignore: cast_nullable_to_non_nullable
as int,leaveDays: null == leaveDays ? _self.leaveDays : leaveDays // ignore: cast_nullable_to_non_nullable
as int,holidayDays: null == holidayDays ? _self.holidayDays : holidayDays // ignore: cast_nullable_to_non_nullable
as int,workFromHomeDays: null == workFromHomeDays ? _self.workFromHomeDays : workFromHomeDays // ignore: cast_nullable_to_non_nullable
as int,businessTripDays: null == businessTripDays ? _self.businessTripDays : businessTripDays // ignore: cast_nullable_to_non_nullable
as int,averageHours: null == averageHours ? _self.averageHours : averageHours // ignore: cast_nullable_to_non_nullable
as double,totalOvertime: null == totalOvertime ? _self.totalOvertime : totalOvertime // ignore: cast_nullable_to_non_nullable
as double,attendancePercentage: null == attendancePercentage ? _self.attendancePercentage : attendancePercentage // ignore: cast_nullable_to_non_nullable
as double,monthlyBreakdown: null == monthlyBreakdown ? _self.monthlyBreakdown : monthlyBreakdown // ignore: cast_nullable_to_non_nullable
as Map<String, int>,weeklyHours: null == weeklyHours ? _self.weeklyHours : weeklyHours // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceStatistics].
extension AttendanceStatisticsPatterns on AttendanceStatistics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceStatistics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceStatistics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceStatistics value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceStatistics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceStatistics value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceStatistics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalDays,  int presentDays,  int absentDays,  int lateDays,  int halfDays,  int leaveDays,  int holidayDays,  int workFromHomeDays,  int businessTripDays,  double averageHours,  double totalOvertime,  double attendancePercentage,  Map<String, int> monthlyBreakdown,  Map<String, double> weeklyHours)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceStatistics() when $default != null:
return $default(_that.totalDays,_that.presentDays,_that.absentDays,_that.lateDays,_that.halfDays,_that.leaveDays,_that.holidayDays,_that.workFromHomeDays,_that.businessTripDays,_that.averageHours,_that.totalOvertime,_that.attendancePercentage,_that.monthlyBreakdown,_that.weeklyHours);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalDays,  int presentDays,  int absentDays,  int lateDays,  int halfDays,  int leaveDays,  int holidayDays,  int workFromHomeDays,  int businessTripDays,  double averageHours,  double totalOvertime,  double attendancePercentage,  Map<String, int> monthlyBreakdown,  Map<String, double> weeklyHours)  $default,) {final _that = this;
switch (_that) {
case _AttendanceStatistics():
return $default(_that.totalDays,_that.presentDays,_that.absentDays,_that.lateDays,_that.halfDays,_that.leaveDays,_that.holidayDays,_that.workFromHomeDays,_that.businessTripDays,_that.averageHours,_that.totalOvertime,_that.attendancePercentage,_that.monthlyBreakdown,_that.weeklyHours);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalDays,  int presentDays,  int absentDays,  int lateDays,  int halfDays,  int leaveDays,  int holidayDays,  int workFromHomeDays,  int businessTripDays,  double averageHours,  double totalOvertime,  double attendancePercentage,  Map<String, int> monthlyBreakdown,  Map<String, double> weeklyHours)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceStatistics() when $default != null:
return $default(_that.totalDays,_that.presentDays,_that.absentDays,_that.lateDays,_that.halfDays,_that.leaveDays,_that.holidayDays,_that.workFromHomeDays,_that.businessTripDays,_that.averageHours,_that.totalOvertime,_that.attendancePercentage,_that.monthlyBreakdown,_that.weeklyHours);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceStatistics extends AttendanceStatistics {
   _AttendanceStatistics({required this.totalDays, required this.presentDays, required this.absentDays, required this.lateDays, required this.halfDays, required this.leaveDays, required this.holidayDays, required this.workFromHomeDays, required this.businessTripDays, required this.averageHours, required this.totalOvertime, required this.attendancePercentage, required final  Map<String, int> monthlyBreakdown, required final  Map<String, double> weeklyHours}): _monthlyBreakdown = monthlyBreakdown,_weeklyHours = weeklyHours,super._();
  factory _AttendanceStatistics.fromJson(Map<String, dynamic> json) => _$AttendanceStatisticsFromJson(json);

@override final  int totalDays;
@override final  int presentDays;
@override final  int absentDays;
@override final  int lateDays;
@override final  int halfDays;
@override final  int leaveDays;
@override final  int holidayDays;
@override final  int workFromHomeDays;
@override final  int businessTripDays;
@override final  double averageHours;
@override final  double totalOvertime;
@override final  double attendancePercentage;
 final  Map<String, int> _monthlyBreakdown;
@override Map<String, int> get monthlyBreakdown {
  if (_monthlyBreakdown is EqualUnmodifiableMapView) return _monthlyBreakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_monthlyBreakdown);
}

 final  Map<String, double> _weeklyHours;
@override Map<String, double> get weeklyHours {
  if (_weeklyHours is EqualUnmodifiableMapView) return _weeklyHours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_weeklyHours);
}


/// Create a copy of AttendanceStatistics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceStatisticsCopyWith<_AttendanceStatistics> get copyWith => __$AttendanceStatisticsCopyWithImpl<_AttendanceStatistics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceStatisticsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceStatistics&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays)&&(identical(other.presentDays, presentDays) || other.presentDays == presentDays)&&(identical(other.absentDays, absentDays) || other.absentDays == absentDays)&&(identical(other.lateDays, lateDays) || other.lateDays == lateDays)&&(identical(other.halfDays, halfDays) || other.halfDays == halfDays)&&(identical(other.leaveDays, leaveDays) || other.leaveDays == leaveDays)&&(identical(other.holidayDays, holidayDays) || other.holidayDays == holidayDays)&&(identical(other.workFromHomeDays, workFromHomeDays) || other.workFromHomeDays == workFromHomeDays)&&(identical(other.businessTripDays, businessTripDays) || other.businessTripDays == businessTripDays)&&(identical(other.averageHours, averageHours) || other.averageHours == averageHours)&&(identical(other.totalOvertime, totalOvertime) || other.totalOvertime == totalOvertime)&&(identical(other.attendancePercentage, attendancePercentage) || other.attendancePercentage == attendancePercentage)&&const DeepCollectionEquality().equals(other._monthlyBreakdown, _monthlyBreakdown)&&const DeepCollectionEquality().equals(other._weeklyHours, _weeklyHours));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalDays,presentDays,absentDays,lateDays,halfDays,leaveDays,holidayDays,workFromHomeDays,businessTripDays,averageHours,totalOvertime,attendancePercentage,const DeepCollectionEquality().hash(_monthlyBreakdown),const DeepCollectionEquality().hash(_weeklyHours));

@override
String toString() {
  return 'AttendanceStatistics(totalDays: $totalDays, presentDays: $presentDays, absentDays: $absentDays, lateDays: $lateDays, halfDays: $halfDays, leaveDays: $leaveDays, holidayDays: $holidayDays, workFromHomeDays: $workFromHomeDays, businessTripDays: $businessTripDays, averageHours: $averageHours, totalOvertime: $totalOvertime, attendancePercentage: $attendancePercentage, monthlyBreakdown: $monthlyBreakdown, weeklyHours: $weeklyHours)';
}


}

/// @nodoc
abstract mixin class _$AttendanceStatisticsCopyWith<$Res> implements $AttendanceStatisticsCopyWith<$Res> {
  factory _$AttendanceStatisticsCopyWith(_AttendanceStatistics value, $Res Function(_AttendanceStatistics) _then) = __$AttendanceStatisticsCopyWithImpl;
@override @useResult
$Res call({
 int totalDays, int presentDays, int absentDays, int lateDays, int halfDays, int leaveDays, int holidayDays, int workFromHomeDays, int businessTripDays, double averageHours, double totalOvertime, double attendancePercentage, Map<String, int> monthlyBreakdown, Map<String, double> weeklyHours
});




}
/// @nodoc
class __$AttendanceStatisticsCopyWithImpl<$Res>
    implements _$AttendanceStatisticsCopyWith<$Res> {
  __$AttendanceStatisticsCopyWithImpl(this._self, this._then);

  final _AttendanceStatistics _self;
  final $Res Function(_AttendanceStatistics) _then;

/// Create a copy of AttendanceStatistics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalDays = null,Object? presentDays = null,Object? absentDays = null,Object? lateDays = null,Object? halfDays = null,Object? leaveDays = null,Object? holidayDays = null,Object? workFromHomeDays = null,Object? businessTripDays = null,Object? averageHours = null,Object? totalOvertime = null,Object? attendancePercentage = null,Object? monthlyBreakdown = null,Object? weeklyHours = null,}) {
  return _then(_AttendanceStatistics(
totalDays: null == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int,presentDays: null == presentDays ? _self.presentDays : presentDays // ignore: cast_nullable_to_non_nullable
as int,absentDays: null == absentDays ? _self.absentDays : absentDays // ignore: cast_nullable_to_non_nullable
as int,lateDays: null == lateDays ? _self.lateDays : lateDays // ignore: cast_nullable_to_non_nullable
as int,halfDays: null == halfDays ? _self.halfDays : halfDays // ignore: cast_nullable_to_non_nullable
as int,leaveDays: null == leaveDays ? _self.leaveDays : leaveDays // ignore: cast_nullable_to_non_nullable
as int,holidayDays: null == holidayDays ? _self.holidayDays : holidayDays // ignore: cast_nullable_to_non_nullable
as int,workFromHomeDays: null == workFromHomeDays ? _self.workFromHomeDays : workFromHomeDays // ignore: cast_nullable_to_non_nullable
as int,businessTripDays: null == businessTripDays ? _self.businessTripDays : businessTripDays // ignore: cast_nullable_to_non_nullable
as int,averageHours: null == averageHours ? _self.averageHours : averageHours // ignore: cast_nullable_to_non_nullable
as double,totalOvertime: null == totalOvertime ? _self.totalOvertime : totalOvertime // ignore: cast_nullable_to_non_nullable
as double,attendancePercentage: null == attendancePercentage ? _self.attendancePercentage : attendancePercentage // ignore: cast_nullable_to_non_nullable
as double,monthlyBreakdown: null == monthlyBreakdown ? _self._monthlyBreakdown : monthlyBreakdown // ignore: cast_nullable_to_non_nullable
as Map<String, int>,weeklyHours: null == weeklyHours ? _self._weeklyHours : weeklyHours // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}


}


/// @nodoc
mixin _$AttendanceSummary {

 DateTime get date; String get dayOfWeek; String get status; String get clockIn; String get clockOut; double get hours; String? get notes;
/// Create a copy of AttendanceSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceSummaryCopyWith<AttendanceSummary> get copyWith => _$AttendanceSummaryCopyWithImpl<AttendanceSummary>(this as AttendanceSummary, _$identity);

  /// Serializes this AttendanceSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceSummary&&(identical(other.date, date) || other.date == date)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.status, status) || other.status == status)&&(identical(other.clockIn, clockIn) || other.clockIn == clockIn)&&(identical(other.clockOut, clockOut) || other.clockOut == clockOut)&&(identical(other.hours, hours) || other.hours == hours)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,dayOfWeek,status,clockIn,clockOut,hours,notes);

@override
String toString() {
  return 'AttendanceSummary(date: $date, dayOfWeek: $dayOfWeek, status: $status, clockIn: $clockIn, clockOut: $clockOut, hours: $hours, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $AttendanceSummaryCopyWith<$Res>  {
  factory $AttendanceSummaryCopyWith(AttendanceSummary value, $Res Function(AttendanceSummary) _then) = _$AttendanceSummaryCopyWithImpl;
@useResult
$Res call({
 DateTime date, String dayOfWeek, String status, String clockIn, String clockOut, double hours, String? notes
});




}
/// @nodoc
class _$AttendanceSummaryCopyWithImpl<$Res>
    implements $AttendanceSummaryCopyWith<$Res> {
  _$AttendanceSummaryCopyWithImpl(this._self, this._then);

  final AttendanceSummary _self;
  final $Res Function(AttendanceSummary) _then;

/// Create a copy of AttendanceSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? dayOfWeek = null,Object? status = null,Object? clockIn = null,Object? clockOut = null,Object? hours = null,Object? notes = freezed,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,clockIn: null == clockIn ? _self.clockIn : clockIn // ignore: cast_nullable_to_non_nullable
as String,clockOut: null == clockOut ? _self.clockOut : clockOut // ignore: cast_nullable_to_non_nullable
as String,hours: null == hours ? _self.hours : hours // ignore: cast_nullable_to_non_nullable
as double,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceSummary].
extension AttendanceSummaryPatterns on AttendanceSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceSummary value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceSummary value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  String dayOfWeek,  String status,  String clockIn,  String clockOut,  double hours,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceSummary() when $default != null:
return $default(_that.date,_that.dayOfWeek,_that.status,_that.clockIn,_that.clockOut,_that.hours,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  String dayOfWeek,  String status,  String clockIn,  String clockOut,  double hours,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _AttendanceSummary():
return $default(_that.date,_that.dayOfWeek,_that.status,_that.clockIn,_that.clockOut,_that.hours,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  String dayOfWeek,  String status,  String clockIn,  String clockOut,  double hours,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceSummary() when $default != null:
return $default(_that.date,_that.dayOfWeek,_that.status,_that.clockIn,_that.clockOut,_that.hours,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceSummary implements AttendanceSummary {
   _AttendanceSummary({required this.date, required this.dayOfWeek, required this.status, required this.clockIn, required this.clockOut, required this.hours, this.notes});
  factory _AttendanceSummary.fromJson(Map<String, dynamic> json) => _$AttendanceSummaryFromJson(json);

@override final  DateTime date;
@override final  String dayOfWeek;
@override final  String status;
@override final  String clockIn;
@override final  String clockOut;
@override final  double hours;
@override final  String? notes;

/// Create a copy of AttendanceSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceSummaryCopyWith<_AttendanceSummary> get copyWith => __$AttendanceSummaryCopyWithImpl<_AttendanceSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceSummary&&(identical(other.date, date) || other.date == date)&&(identical(other.dayOfWeek, dayOfWeek) || other.dayOfWeek == dayOfWeek)&&(identical(other.status, status) || other.status == status)&&(identical(other.clockIn, clockIn) || other.clockIn == clockIn)&&(identical(other.clockOut, clockOut) || other.clockOut == clockOut)&&(identical(other.hours, hours) || other.hours == hours)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,dayOfWeek,status,clockIn,clockOut,hours,notes);

@override
String toString() {
  return 'AttendanceSummary(date: $date, dayOfWeek: $dayOfWeek, status: $status, clockIn: $clockIn, clockOut: $clockOut, hours: $hours, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$AttendanceSummaryCopyWith<$Res> implements $AttendanceSummaryCopyWith<$Res> {
  factory _$AttendanceSummaryCopyWith(_AttendanceSummary value, $Res Function(_AttendanceSummary) _then) = __$AttendanceSummaryCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, String dayOfWeek, String status, String clockIn, String clockOut, double hours, String? notes
});




}
/// @nodoc
class __$AttendanceSummaryCopyWithImpl<$Res>
    implements _$AttendanceSummaryCopyWith<$Res> {
  __$AttendanceSummaryCopyWithImpl(this._self, this._then);

  final _AttendanceSummary _self;
  final $Res Function(_AttendanceSummary) _then;

/// Create a copy of AttendanceSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? dayOfWeek = null,Object? status = null,Object? clockIn = null,Object? clockOut = null,Object? hours = null,Object? notes = freezed,}) {
  return _then(_AttendanceSummary(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,dayOfWeek: null == dayOfWeek ? _self.dayOfWeek : dayOfWeek // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,clockIn: null == clockIn ? _self.clockIn : clockIn // ignore: cast_nullable_to_non_nullable
as String,clockOut: null == clockOut ? _self.clockOut : clockOut // ignore: cast_nullable_to_non_nullable
as String,hours: null == hours ? _self.hours : hours // ignore: cast_nullable_to_non_nullable
as double,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Holiday {

 String get id; String get name; String? get description; DateTime get date; bool get isRecurring; int? get recurringYear; HolidayType get type; bool get isActive; String? get region;
/// Create a copy of Holiday
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HolidayCopyWith<Holiday> get copyWith => _$HolidayCopyWithImpl<Holiday>(this as Holiday, _$identity);

  /// Serializes this Holiday to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Holiday&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.isRecurring, isRecurring) || other.isRecurring == isRecurring)&&(identical(other.recurringYear, recurringYear) || other.recurringYear == recurringYear)&&(identical(other.type, type) || other.type == type)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.region, region) || other.region == region));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,date,isRecurring,recurringYear,type,isActive,region);

@override
String toString() {
  return 'Holiday(id: $id, name: $name, description: $description, date: $date, isRecurring: $isRecurring, recurringYear: $recurringYear, type: $type, isActive: $isActive, region: $region)';
}


}

/// @nodoc
abstract mixin class $HolidayCopyWith<$Res>  {
  factory $HolidayCopyWith(Holiday value, $Res Function(Holiday) _then) = _$HolidayCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, DateTime date, bool isRecurring, int? recurringYear, HolidayType type, bool isActive, String? region
});




}
/// @nodoc
class _$HolidayCopyWithImpl<$Res>
    implements $HolidayCopyWith<$Res> {
  _$HolidayCopyWithImpl(this._self, this._then);

  final Holiday _self;
  final $Res Function(Holiday) _then;

/// Create a copy of Holiday
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? date = null,Object? isRecurring = null,Object? recurringYear = freezed,Object? type = null,Object? isActive = null,Object? region = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,isRecurring: null == isRecurring ? _self.isRecurring : isRecurring // ignore: cast_nullable_to_non_nullable
as bool,recurringYear: freezed == recurringYear ? _self.recurringYear : recurringYear // ignore: cast_nullable_to_non_nullable
as int?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as HolidayType,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Holiday].
extension HolidayPatterns on Holiday {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Holiday value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Holiday() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Holiday value)  $default,){
final _that = this;
switch (_that) {
case _Holiday():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Holiday value)?  $default,){
final _that = this;
switch (_that) {
case _Holiday() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  DateTime date,  bool isRecurring,  int? recurringYear,  HolidayType type,  bool isActive,  String? region)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Holiday() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.date,_that.isRecurring,_that.recurringYear,_that.type,_that.isActive,_that.region);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  DateTime date,  bool isRecurring,  int? recurringYear,  HolidayType type,  bool isActive,  String? region)  $default,) {final _that = this;
switch (_that) {
case _Holiday():
return $default(_that.id,_that.name,_that.description,_that.date,_that.isRecurring,_that.recurringYear,_that.type,_that.isActive,_that.region);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  DateTime date,  bool isRecurring,  int? recurringYear,  HolidayType type,  bool isActive,  String? region)?  $default,) {final _that = this;
switch (_that) {
case _Holiday() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.date,_that.isRecurring,_that.recurringYear,_that.type,_that.isActive,_that.region);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Holiday implements Holiday {
   _Holiday({required this.id, required this.name, this.description, required this.date, required this.isRecurring, this.recurringYear, required this.type, required this.isActive, this.region});
  factory _Holiday.fromJson(Map<String, dynamic> json) => _$HolidayFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  DateTime date;
@override final  bool isRecurring;
@override final  int? recurringYear;
@override final  HolidayType type;
@override final  bool isActive;
@override final  String? region;

/// Create a copy of Holiday
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HolidayCopyWith<_Holiday> get copyWith => __$HolidayCopyWithImpl<_Holiday>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HolidayToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Holiday&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.isRecurring, isRecurring) || other.isRecurring == isRecurring)&&(identical(other.recurringYear, recurringYear) || other.recurringYear == recurringYear)&&(identical(other.type, type) || other.type == type)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.region, region) || other.region == region));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,date,isRecurring,recurringYear,type,isActive,region);

@override
String toString() {
  return 'Holiday(id: $id, name: $name, description: $description, date: $date, isRecurring: $isRecurring, recurringYear: $recurringYear, type: $type, isActive: $isActive, region: $region)';
}


}

/// @nodoc
abstract mixin class _$HolidayCopyWith<$Res> implements $HolidayCopyWith<$Res> {
  factory _$HolidayCopyWith(_Holiday value, $Res Function(_Holiday) _then) = __$HolidayCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, DateTime date, bool isRecurring, int? recurringYear, HolidayType type, bool isActive, String? region
});




}
/// @nodoc
class __$HolidayCopyWithImpl<$Res>
    implements _$HolidayCopyWith<$Res> {
  __$HolidayCopyWithImpl(this._self, this._then);

  final _Holiday _self;
  final $Res Function(_Holiday) _then;

/// Create a copy of Holiday
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? date = null,Object? isRecurring = null,Object? recurringYear = freezed,Object? type = null,Object? isActive = null,Object? region = freezed,}) {
  return _then(_Holiday(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,isRecurring: null == isRecurring ? _self.isRecurring : isRecurring // ignore: cast_nullable_to_non_nullable
as bool,recurringYear: freezed == recurringYear ? _self.recurringYear : recurringYear // ignore: cast_nullable_to_non_nullable
as int?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as HolidayType,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
