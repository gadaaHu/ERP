// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttendanceDto {

 String get id; String get userId; String get employeeName; DateTime get date; DateTime? get clockInTime; DateTime? get clockOutTime; double? get totalHours; double? get overtimeHours; String get status; String get type; String? get clockInLocation; String? get clockOutLocation; String? get notes; bool get isApproved; String? get approvedBy; String? get formattedDate; String? get formattedClockIn; String? get formattedClockOut;
/// Create a copy of AttendanceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceDtoCopyWith<AttendanceDto> get copyWith => _$AttendanceDtoCopyWithImpl<AttendanceDto>(this as AttendanceDto, _$identity);

  /// Serializes this AttendanceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceDto&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.employeeName, employeeName) || other.employeeName == employeeName)&&(identical(other.date, date) || other.date == date)&&(identical(other.clockInTime, clockInTime) || other.clockInTime == clockInTime)&&(identical(other.clockOutTime, clockOutTime) || other.clockOutTime == clockOutTime)&&(identical(other.totalHours, totalHours) || other.totalHours == totalHours)&&(identical(other.overtimeHours, overtimeHours) || other.overtimeHours == overtimeHours)&&(identical(other.status, status) || other.status == status)&&(identical(other.type, type) || other.type == type)&&(identical(other.clockInLocation, clockInLocation) || other.clockInLocation == clockInLocation)&&(identical(other.clockOutLocation, clockOutLocation) || other.clockOutLocation == clockOutLocation)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isApproved, isApproved) || other.isApproved == isApproved)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy)&&(identical(other.formattedDate, formattedDate) || other.formattedDate == formattedDate)&&(identical(other.formattedClockIn, formattedClockIn) || other.formattedClockIn == formattedClockIn)&&(identical(other.formattedClockOut, formattedClockOut) || other.formattedClockOut == formattedClockOut));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,employeeName,date,clockInTime,clockOutTime,totalHours,overtimeHours,status,type,clockInLocation,clockOutLocation,notes,isApproved,approvedBy,formattedDate,formattedClockIn,formattedClockOut);

@override
String toString() {
  return 'AttendanceDto(id: $id, userId: $userId, employeeName: $employeeName, date: $date, clockInTime: $clockInTime, clockOutTime: $clockOutTime, totalHours: $totalHours, overtimeHours: $overtimeHours, status: $status, type: $type, clockInLocation: $clockInLocation, clockOutLocation: $clockOutLocation, notes: $notes, isApproved: $isApproved, approvedBy: $approvedBy, formattedDate: $formattedDate, formattedClockIn: $formattedClockIn, formattedClockOut: $formattedClockOut)';
}


}

/// @nodoc
abstract mixin class $AttendanceDtoCopyWith<$Res>  {
  factory $AttendanceDtoCopyWith(AttendanceDto value, $Res Function(AttendanceDto) _then) = _$AttendanceDtoCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String employeeName, DateTime date, DateTime? clockInTime, DateTime? clockOutTime, double? totalHours, double? overtimeHours, String status, String type, String? clockInLocation, String? clockOutLocation, String? notes, bool isApproved, String? approvedBy, String? formattedDate, String? formattedClockIn, String? formattedClockOut
});




}
/// @nodoc
class _$AttendanceDtoCopyWithImpl<$Res>
    implements $AttendanceDtoCopyWith<$Res> {
  _$AttendanceDtoCopyWithImpl(this._self, this._then);

  final AttendanceDto _self;
  final $Res Function(AttendanceDto) _then;

/// Create a copy of AttendanceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? employeeName = null,Object? date = null,Object? clockInTime = freezed,Object? clockOutTime = freezed,Object? totalHours = freezed,Object? overtimeHours = freezed,Object? status = null,Object? type = null,Object? clockInLocation = freezed,Object? clockOutLocation = freezed,Object? notes = freezed,Object? isApproved = null,Object? approvedBy = freezed,Object? formattedDate = freezed,Object? formattedClockIn = freezed,Object? formattedClockOut = freezed,}) {
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
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,clockInLocation: freezed == clockInLocation ? _self.clockInLocation : clockInLocation // ignore: cast_nullable_to_non_nullable
as String?,clockOutLocation: freezed == clockOutLocation ? _self.clockOutLocation : clockOutLocation // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isApproved: null == isApproved ? _self.isApproved : isApproved // ignore: cast_nullable_to_non_nullable
as bool,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,formattedDate: freezed == formattedDate ? _self.formattedDate : formattedDate // ignore: cast_nullable_to_non_nullable
as String?,formattedClockIn: freezed == formattedClockIn ? _self.formattedClockIn : formattedClockIn // ignore: cast_nullable_to_non_nullable
as String?,formattedClockOut: freezed == formattedClockOut ? _self.formattedClockOut : formattedClockOut // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceDto].
extension AttendanceDtoPatterns on AttendanceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceDto value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceDto value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String employeeName,  DateTime date,  DateTime? clockInTime,  DateTime? clockOutTime,  double? totalHours,  double? overtimeHours,  String status,  String type,  String? clockInLocation,  String? clockOutLocation,  String? notes,  bool isApproved,  String? approvedBy,  String? formattedDate,  String? formattedClockIn,  String? formattedClockOut)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceDto() when $default != null:
return $default(_that.id,_that.userId,_that.employeeName,_that.date,_that.clockInTime,_that.clockOutTime,_that.totalHours,_that.overtimeHours,_that.status,_that.type,_that.clockInLocation,_that.clockOutLocation,_that.notes,_that.isApproved,_that.approvedBy,_that.formattedDate,_that.formattedClockIn,_that.formattedClockOut);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String employeeName,  DateTime date,  DateTime? clockInTime,  DateTime? clockOutTime,  double? totalHours,  double? overtimeHours,  String status,  String type,  String? clockInLocation,  String? clockOutLocation,  String? notes,  bool isApproved,  String? approvedBy,  String? formattedDate,  String? formattedClockIn,  String? formattedClockOut)  $default,) {final _that = this;
switch (_that) {
case _AttendanceDto():
return $default(_that.id,_that.userId,_that.employeeName,_that.date,_that.clockInTime,_that.clockOutTime,_that.totalHours,_that.overtimeHours,_that.status,_that.type,_that.clockInLocation,_that.clockOutLocation,_that.notes,_that.isApproved,_that.approvedBy,_that.formattedDate,_that.formattedClockIn,_that.formattedClockOut);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String employeeName,  DateTime date,  DateTime? clockInTime,  DateTime? clockOutTime,  double? totalHours,  double? overtimeHours,  String status,  String type,  String? clockInLocation,  String? clockOutLocation,  String? notes,  bool isApproved,  String? approvedBy,  String? formattedDate,  String? formattedClockIn,  String? formattedClockOut)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceDto() when $default != null:
return $default(_that.id,_that.userId,_that.employeeName,_that.date,_that.clockInTime,_that.clockOutTime,_that.totalHours,_that.overtimeHours,_that.status,_that.type,_that.clockInLocation,_that.clockOutLocation,_that.notes,_that.isApproved,_that.approvedBy,_that.formattedDate,_that.formattedClockIn,_that.formattedClockOut);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceDto extends AttendanceDto {
   _AttendanceDto({required this.id, required this.userId, required this.employeeName, required this.date, this.clockInTime, this.clockOutTime, this.totalHours, this.overtimeHours, required this.status, required this.type, this.clockInLocation, this.clockOutLocation, this.notes, this.isApproved = false, this.approvedBy, this.formattedDate, this.formattedClockIn, this.formattedClockOut}): super._();
  factory _AttendanceDto.fromJson(Map<String, dynamic> json) => _$AttendanceDtoFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String employeeName;
@override final  DateTime date;
@override final  DateTime? clockInTime;
@override final  DateTime? clockOutTime;
@override final  double? totalHours;
@override final  double? overtimeHours;
@override final  String status;
@override final  String type;
@override final  String? clockInLocation;
@override final  String? clockOutLocation;
@override final  String? notes;
@override@JsonKey() final  bool isApproved;
@override final  String? approvedBy;
@override final  String? formattedDate;
@override final  String? formattedClockIn;
@override final  String? formattedClockOut;

/// Create a copy of AttendanceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceDtoCopyWith<_AttendanceDto> get copyWith => __$AttendanceDtoCopyWithImpl<_AttendanceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceDto&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.employeeName, employeeName) || other.employeeName == employeeName)&&(identical(other.date, date) || other.date == date)&&(identical(other.clockInTime, clockInTime) || other.clockInTime == clockInTime)&&(identical(other.clockOutTime, clockOutTime) || other.clockOutTime == clockOutTime)&&(identical(other.totalHours, totalHours) || other.totalHours == totalHours)&&(identical(other.overtimeHours, overtimeHours) || other.overtimeHours == overtimeHours)&&(identical(other.status, status) || other.status == status)&&(identical(other.type, type) || other.type == type)&&(identical(other.clockInLocation, clockInLocation) || other.clockInLocation == clockInLocation)&&(identical(other.clockOutLocation, clockOutLocation) || other.clockOutLocation == clockOutLocation)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isApproved, isApproved) || other.isApproved == isApproved)&&(identical(other.approvedBy, approvedBy) || other.approvedBy == approvedBy)&&(identical(other.formattedDate, formattedDate) || other.formattedDate == formattedDate)&&(identical(other.formattedClockIn, formattedClockIn) || other.formattedClockIn == formattedClockIn)&&(identical(other.formattedClockOut, formattedClockOut) || other.formattedClockOut == formattedClockOut));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,employeeName,date,clockInTime,clockOutTime,totalHours,overtimeHours,status,type,clockInLocation,clockOutLocation,notes,isApproved,approvedBy,formattedDate,formattedClockIn,formattedClockOut);

@override
String toString() {
  return 'AttendanceDto(id: $id, userId: $userId, employeeName: $employeeName, date: $date, clockInTime: $clockInTime, clockOutTime: $clockOutTime, totalHours: $totalHours, overtimeHours: $overtimeHours, status: $status, type: $type, clockInLocation: $clockInLocation, clockOutLocation: $clockOutLocation, notes: $notes, isApproved: $isApproved, approvedBy: $approvedBy, formattedDate: $formattedDate, formattedClockIn: $formattedClockIn, formattedClockOut: $formattedClockOut)';
}


}

/// @nodoc
abstract mixin class _$AttendanceDtoCopyWith<$Res> implements $AttendanceDtoCopyWith<$Res> {
  factory _$AttendanceDtoCopyWith(_AttendanceDto value, $Res Function(_AttendanceDto) _then) = __$AttendanceDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String employeeName, DateTime date, DateTime? clockInTime, DateTime? clockOutTime, double? totalHours, double? overtimeHours, String status, String type, String? clockInLocation, String? clockOutLocation, String? notes, bool isApproved, String? approvedBy, String? formattedDate, String? formattedClockIn, String? formattedClockOut
});




}
/// @nodoc
class __$AttendanceDtoCopyWithImpl<$Res>
    implements _$AttendanceDtoCopyWith<$Res> {
  __$AttendanceDtoCopyWithImpl(this._self, this._then);

  final _AttendanceDto _self;
  final $Res Function(_AttendanceDto) _then;

/// Create a copy of AttendanceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? employeeName = null,Object? date = null,Object? clockInTime = freezed,Object? clockOutTime = freezed,Object? totalHours = freezed,Object? overtimeHours = freezed,Object? status = null,Object? type = null,Object? clockInLocation = freezed,Object? clockOutLocation = freezed,Object? notes = freezed,Object? isApproved = null,Object? approvedBy = freezed,Object? formattedDate = freezed,Object? formattedClockIn = freezed,Object? formattedClockOut = freezed,}) {
  return _then(_AttendanceDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,employeeName: null == employeeName ? _self.employeeName : employeeName // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,clockInTime: freezed == clockInTime ? _self.clockInTime : clockInTime // ignore: cast_nullable_to_non_nullable
as DateTime?,clockOutTime: freezed == clockOutTime ? _self.clockOutTime : clockOutTime // ignore: cast_nullable_to_non_nullable
as DateTime?,totalHours: freezed == totalHours ? _self.totalHours : totalHours // ignore: cast_nullable_to_non_nullable
as double?,overtimeHours: freezed == overtimeHours ? _self.overtimeHours : overtimeHours // ignore: cast_nullable_to_non_nullable
as double?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,clockInLocation: freezed == clockInLocation ? _self.clockInLocation : clockInLocation // ignore: cast_nullable_to_non_nullable
as String?,clockOutLocation: freezed == clockOutLocation ? _self.clockOutLocation : clockOutLocation // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isApproved: null == isApproved ? _self.isApproved : isApproved // ignore: cast_nullable_to_non_nullable
as bool,approvedBy: freezed == approvedBy ? _self.approvedBy : approvedBy // ignore: cast_nullable_to_non_nullable
as String?,formattedDate: freezed == formattedDate ? _self.formattedDate : formattedDate // ignore: cast_nullable_to_non_nullable
as String?,formattedClockIn: freezed == formattedClockIn ? _self.formattedClockIn : formattedClockIn // ignore: cast_nullable_to_non_nullable
as String?,formattedClockOut: freezed == formattedClockOut ? _self.formattedClockOut : formattedClockOut // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ClockInRequest {

 String get userId; DateTime? get clockInTime; String? get location; double? get latitude; double? get longitude; String? get deviceInfo; String? get notes;
/// Create a copy of ClockInRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClockInRequestCopyWith<ClockInRequest> get copyWith => _$ClockInRequestCopyWithImpl<ClockInRequest>(this as ClockInRequest, _$identity);

  /// Serializes this ClockInRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClockInRequest&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.clockInTime, clockInTime) || other.clockInTime == clockInTime)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.deviceInfo, deviceInfo) || other.deviceInfo == deviceInfo)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,clockInTime,location,latitude,longitude,deviceInfo,notes);

@override
String toString() {
  return 'ClockInRequest(userId: $userId, clockInTime: $clockInTime, location: $location, latitude: $latitude, longitude: $longitude, deviceInfo: $deviceInfo, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $ClockInRequestCopyWith<$Res>  {
  factory $ClockInRequestCopyWith(ClockInRequest value, $Res Function(ClockInRequest) _then) = _$ClockInRequestCopyWithImpl;
@useResult
$Res call({
 String userId, DateTime? clockInTime, String? location, double? latitude, double? longitude, String? deviceInfo, String? notes
});




}
/// @nodoc
class _$ClockInRequestCopyWithImpl<$Res>
    implements $ClockInRequestCopyWith<$Res> {
  _$ClockInRequestCopyWithImpl(this._self, this._then);

  final ClockInRequest _self;
  final $Res Function(ClockInRequest) _then;

/// Create a copy of ClockInRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? clockInTime = freezed,Object? location = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? deviceInfo = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,clockInTime: freezed == clockInTime ? _self.clockInTime : clockInTime // ignore: cast_nullable_to_non_nullable
as DateTime?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,deviceInfo: freezed == deviceInfo ? _self.deviceInfo : deviceInfo // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClockInRequest].
extension ClockInRequestPatterns on ClockInRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClockInRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClockInRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClockInRequest value)  $default,){
final _that = this;
switch (_that) {
case _ClockInRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClockInRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ClockInRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  DateTime? clockInTime,  String? location,  double? latitude,  double? longitude,  String? deviceInfo,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClockInRequest() when $default != null:
return $default(_that.userId,_that.clockInTime,_that.location,_that.latitude,_that.longitude,_that.deviceInfo,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  DateTime? clockInTime,  String? location,  double? latitude,  double? longitude,  String? deviceInfo,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _ClockInRequest():
return $default(_that.userId,_that.clockInTime,_that.location,_that.latitude,_that.longitude,_that.deviceInfo,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  DateTime? clockInTime,  String? location,  double? latitude,  double? longitude,  String? deviceInfo,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _ClockInRequest() when $default != null:
return $default(_that.userId,_that.clockInTime,_that.location,_that.latitude,_that.longitude,_that.deviceInfo,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClockInRequest implements ClockInRequest {
   _ClockInRequest({required this.userId, this.clockInTime, this.location, this.latitude, this.longitude, this.deviceInfo, this.notes});
  factory _ClockInRequest.fromJson(Map<String, dynamic> json) => _$ClockInRequestFromJson(json);

@override final  String userId;
@override final  DateTime? clockInTime;
@override final  String? location;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? deviceInfo;
@override final  String? notes;

/// Create a copy of ClockInRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClockInRequestCopyWith<_ClockInRequest> get copyWith => __$ClockInRequestCopyWithImpl<_ClockInRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClockInRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClockInRequest&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.clockInTime, clockInTime) || other.clockInTime == clockInTime)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.deviceInfo, deviceInfo) || other.deviceInfo == deviceInfo)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,clockInTime,location,latitude,longitude,deviceInfo,notes);

@override
String toString() {
  return 'ClockInRequest(userId: $userId, clockInTime: $clockInTime, location: $location, latitude: $latitude, longitude: $longitude, deviceInfo: $deviceInfo, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$ClockInRequestCopyWith<$Res> implements $ClockInRequestCopyWith<$Res> {
  factory _$ClockInRequestCopyWith(_ClockInRequest value, $Res Function(_ClockInRequest) _then) = __$ClockInRequestCopyWithImpl;
@override @useResult
$Res call({
 String userId, DateTime? clockInTime, String? location, double? latitude, double? longitude, String? deviceInfo, String? notes
});




}
/// @nodoc
class __$ClockInRequestCopyWithImpl<$Res>
    implements _$ClockInRequestCopyWith<$Res> {
  __$ClockInRequestCopyWithImpl(this._self, this._then);

  final _ClockInRequest _self;
  final $Res Function(_ClockInRequest) _then;

/// Create a copy of ClockInRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? clockInTime = freezed,Object? location = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? deviceInfo = freezed,Object? notes = freezed,}) {
  return _then(_ClockInRequest(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,clockInTime: freezed == clockInTime ? _self.clockInTime : clockInTime // ignore: cast_nullable_to_non_nullable
as DateTime?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,deviceInfo: freezed == deviceInfo ? _self.deviceInfo : deviceInfo // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ClockOutRequest {

 String get userId; String get attendanceId; DateTime? get clockOutTime; String? get location; double? get latitude; double? get longitude; String? get notes;
/// Create a copy of ClockOutRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClockOutRequestCopyWith<ClockOutRequest> get copyWith => _$ClockOutRequestCopyWithImpl<ClockOutRequest>(this as ClockOutRequest, _$identity);

  /// Serializes this ClockOutRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClockOutRequest&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId)&&(identical(other.clockOutTime, clockOutTime) || other.clockOutTime == clockOutTime)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,attendanceId,clockOutTime,location,latitude,longitude,notes);

@override
String toString() {
  return 'ClockOutRequest(userId: $userId, attendanceId: $attendanceId, clockOutTime: $clockOutTime, location: $location, latitude: $latitude, longitude: $longitude, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $ClockOutRequestCopyWith<$Res>  {
  factory $ClockOutRequestCopyWith(ClockOutRequest value, $Res Function(ClockOutRequest) _then) = _$ClockOutRequestCopyWithImpl;
@useResult
$Res call({
 String userId, String attendanceId, DateTime? clockOutTime, String? location, double? latitude, double? longitude, String? notes
});




}
/// @nodoc
class _$ClockOutRequestCopyWithImpl<$Res>
    implements $ClockOutRequestCopyWith<$Res> {
  _$ClockOutRequestCopyWithImpl(this._self, this._then);

  final ClockOutRequest _self;
  final $Res Function(ClockOutRequest) _then;

/// Create a copy of ClockOutRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? attendanceId = null,Object? clockOutTime = freezed,Object? location = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,attendanceId: null == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String,clockOutTime: freezed == clockOutTime ? _self.clockOutTime : clockOutTime // ignore: cast_nullable_to_non_nullable
as DateTime?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClockOutRequest].
extension ClockOutRequestPatterns on ClockOutRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClockOutRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClockOutRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClockOutRequest value)  $default,){
final _that = this;
switch (_that) {
case _ClockOutRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClockOutRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ClockOutRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String attendanceId,  DateTime? clockOutTime,  String? location,  double? latitude,  double? longitude,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClockOutRequest() when $default != null:
return $default(_that.userId,_that.attendanceId,_that.clockOutTime,_that.location,_that.latitude,_that.longitude,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String attendanceId,  DateTime? clockOutTime,  String? location,  double? latitude,  double? longitude,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _ClockOutRequest():
return $default(_that.userId,_that.attendanceId,_that.clockOutTime,_that.location,_that.latitude,_that.longitude,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String attendanceId,  DateTime? clockOutTime,  String? location,  double? latitude,  double? longitude,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _ClockOutRequest() when $default != null:
return $default(_that.userId,_that.attendanceId,_that.clockOutTime,_that.location,_that.latitude,_that.longitude,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClockOutRequest implements ClockOutRequest {
   _ClockOutRequest({required this.userId, required this.attendanceId, this.clockOutTime, this.location, this.latitude, this.longitude, this.notes});
  factory _ClockOutRequest.fromJson(Map<String, dynamic> json) => _$ClockOutRequestFromJson(json);

@override final  String userId;
@override final  String attendanceId;
@override final  DateTime? clockOutTime;
@override final  String? location;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? notes;

/// Create a copy of ClockOutRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClockOutRequestCopyWith<_ClockOutRequest> get copyWith => __$ClockOutRequestCopyWithImpl<_ClockOutRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClockOutRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClockOutRequest&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId)&&(identical(other.clockOutTime, clockOutTime) || other.clockOutTime == clockOutTime)&&(identical(other.location, location) || other.location == location)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,attendanceId,clockOutTime,location,latitude,longitude,notes);

@override
String toString() {
  return 'ClockOutRequest(userId: $userId, attendanceId: $attendanceId, clockOutTime: $clockOutTime, location: $location, latitude: $latitude, longitude: $longitude, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$ClockOutRequestCopyWith<$Res> implements $ClockOutRequestCopyWith<$Res> {
  factory _$ClockOutRequestCopyWith(_ClockOutRequest value, $Res Function(_ClockOutRequest) _then) = __$ClockOutRequestCopyWithImpl;
@override @useResult
$Res call({
 String userId, String attendanceId, DateTime? clockOutTime, String? location, double? latitude, double? longitude, String? notes
});




}
/// @nodoc
class __$ClockOutRequestCopyWithImpl<$Res>
    implements _$ClockOutRequestCopyWith<$Res> {
  __$ClockOutRequestCopyWithImpl(this._self, this._then);

  final _ClockOutRequest _self;
  final $Res Function(_ClockOutRequest) _then;

/// Create a copy of ClockOutRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? attendanceId = null,Object? clockOutTime = freezed,Object? location = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? notes = freezed,}) {
  return _then(_ClockOutRequest(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,attendanceId: null == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String,clockOutTime: freezed == clockOutTime ? _self.clockOutTime : clockOutTime // ignore: cast_nullable_to_non_nullable
as DateTime?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AttendanceCorrectionRequest {

 String get attendanceId; DateTime? get newClockInTime; DateTime? get newClockOutTime; AttendanceStatus? get newStatus; String get reason;
/// Create a copy of AttendanceCorrectionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceCorrectionRequestCopyWith<AttendanceCorrectionRequest> get copyWith => _$AttendanceCorrectionRequestCopyWithImpl<AttendanceCorrectionRequest>(this as AttendanceCorrectionRequest, _$identity);

  /// Serializes this AttendanceCorrectionRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceCorrectionRequest&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId)&&(identical(other.newClockInTime, newClockInTime) || other.newClockInTime == newClockInTime)&&(identical(other.newClockOutTime, newClockOutTime) || other.newClockOutTime == newClockOutTime)&&(identical(other.newStatus, newStatus) || other.newStatus == newStatus)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attendanceId,newClockInTime,newClockOutTime,newStatus,reason);

@override
String toString() {
  return 'AttendanceCorrectionRequest(attendanceId: $attendanceId, newClockInTime: $newClockInTime, newClockOutTime: $newClockOutTime, newStatus: $newStatus, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $AttendanceCorrectionRequestCopyWith<$Res>  {
  factory $AttendanceCorrectionRequestCopyWith(AttendanceCorrectionRequest value, $Res Function(AttendanceCorrectionRequest) _then) = _$AttendanceCorrectionRequestCopyWithImpl;
@useResult
$Res call({
 String attendanceId, DateTime? newClockInTime, DateTime? newClockOutTime, AttendanceStatus? newStatus, String reason
});




}
/// @nodoc
class _$AttendanceCorrectionRequestCopyWithImpl<$Res>
    implements $AttendanceCorrectionRequestCopyWith<$Res> {
  _$AttendanceCorrectionRequestCopyWithImpl(this._self, this._then);

  final AttendanceCorrectionRequest _self;
  final $Res Function(AttendanceCorrectionRequest) _then;

/// Create a copy of AttendanceCorrectionRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attendanceId = null,Object? newClockInTime = freezed,Object? newClockOutTime = freezed,Object? newStatus = freezed,Object? reason = null,}) {
  return _then(_self.copyWith(
attendanceId: null == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String,newClockInTime: freezed == newClockInTime ? _self.newClockInTime : newClockInTime // ignore: cast_nullable_to_non_nullable
as DateTime?,newClockOutTime: freezed == newClockOutTime ? _self.newClockOutTime : newClockOutTime // ignore: cast_nullable_to_non_nullable
as DateTime?,newStatus: freezed == newStatus ? _self.newStatus : newStatus // ignore: cast_nullable_to_non_nullable
as AttendanceStatus?,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceCorrectionRequest].
extension AttendanceCorrectionRequestPatterns on AttendanceCorrectionRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceCorrectionRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceCorrectionRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceCorrectionRequest value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceCorrectionRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceCorrectionRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceCorrectionRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String attendanceId,  DateTime? newClockInTime,  DateTime? newClockOutTime,  AttendanceStatus? newStatus,  String reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceCorrectionRequest() when $default != null:
return $default(_that.attendanceId,_that.newClockInTime,_that.newClockOutTime,_that.newStatus,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String attendanceId,  DateTime? newClockInTime,  DateTime? newClockOutTime,  AttendanceStatus? newStatus,  String reason)  $default,) {final _that = this;
switch (_that) {
case _AttendanceCorrectionRequest():
return $default(_that.attendanceId,_that.newClockInTime,_that.newClockOutTime,_that.newStatus,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String attendanceId,  DateTime? newClockInTime,  DateTime? newClockOutTime,  AttendanceStatus? newStatus,  String reason)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceCorrectionRequest() when $default != null:
return $default(_that.attendanceId,_that.newClockInTime,_that.newClockOutTime,_that.newStatus,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceCorrectionRequest implements AttendanceCorrectionRequest {
   _AttendanceCorrectionRequest({required this.attendanceId, this.newClockInTime, this.newClockOutTime, this.newStatus, required this.reason});
  factory _AttendanceCorrectionRequest.fromJson(Map<String, dynamic> json) => _$AttendanceCorrectionRequestFromJson(json);

@override final  String attendanceId;
@override final  DateTime? newClockInTime;
@override final  DateTime? newClockOutTime;
@override final  AttendanceStatus? newStatus;
@override final  String reason;

/// Create a copy of AttendanceCorrectionRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceCorrectionRequestCopyWith<_AttendanceCorrectionRequest> get copyWith => __$AttendanceCorrectionRequestCopyWithImpl<_AttendanceCorrectionRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceCorrectionRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceCorrectionRequest&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId)&&(identical(other.newClockInTime, newClockInTime) || other.newClockInTime == newClockInTime)&&(identical(other.newClockOutTime, newClockOutTime) || other.newClockOutTime == newClockOutTime)&&(identical(other.newStatus, newStatus) || other.newStatus == newStatus)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attendanceId,newClockInTime,newClockOutTime,newStatus,reason);

@override
String toString() {
  return 'AttendanceCorrectionRequest(attendanceId: $attendanceId, newClockInTime: $newClockInTime, newClockOutTime: $newClockOutTime, newStatus: $newStatus, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$AttendanceCorrectionRequestCopyWith<$Res> implements $AttendanceCorrectionRequestCopyWith<$Res> {
  factory _$AttendanceCorrectionRequestCopyWith(_AttendanceCorrectionRequest value, $Res Function(_AttendanceCorrectionRequest) _then) = __$AttendanceCorrectionRequestCopyWithImpl;
@override @useResult
$Res call({
 String attendanceId, DateTime? newClockInTime, DateTime? newClockOutTime, AttendanceStatus? newStatus, String reason
});




}
/// @nodoc
class __$AttendanceCorrectionRequestCopyWithImpl<$Res>
    implements _$AttendanceCorrectionRequestCopyWith<$Res> {
  __$AttendanceCorrectionRequestCopyWithImpl(this._self, this._then);

  final _AttendanceCorrectionRequest _self;
  final $Res Function(_AttendanceCorrectionRequest) _then;

/// Create a copy of AttendanceCorrectionRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attendanceId = null,Object? newClockInTime = freezed,Object? newClockOutTime = freezed,Object? newStatus = freezed,Object? reason = null,}) {
  return _then(_AttendanceCorrectionRequest(
attendanceId: null == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String,newClockInTime: freezed == newClockInTime ? _self.newClockInTime : newClockInTime // ignore: cast_nullable_to_non_nullable
as DateTime?,newClockOutTime: freezed == newClockOutTime ? _self.newClockOutTime : newClockOutTime // ignore: cast_nullable_to_non_nullable
as DateTime?,newStatus: freezed == newStatus ? _self.newStatus : newStatus // ignore: cast_nullable_to_non_nullable
as AttendanceStatus?,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
