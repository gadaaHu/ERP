// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttendanceRequest {

 String get id; String get userId; String get attendanceId;@JsonKey(unknownEnumValue: AttendanceRequestType.correction) AttendanceRequestType get requestType;@JsonKey(unknownEnumValue: AttendanceRequestStatus.pending) AttendanceRequestStatus get status; String? get reason; DateTime? get newClockInTime; DateTime? get newClockOutTime; String? get approvedById; DateTime? get approvedDate; String? get rejectionReason; DateTime get createdAt; DateTime? get updatedAt;
/// Create a copy of AttendanceRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceRequestCopyWith<AttendanceRequest> get copyWith => _$AttendanceRequestCopyWithImpl<AttendanceRequest>(this as AttendanceRequest, _$identity);

  /// Serializes this AttendanceRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId)&&(identical(other.requestType, requestType) || other.requestType == requestType)&&(identical(other.status, status) || other.status == status)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.newClockInTime, newClockInTime) || other.newClockInTime == newClockInTime)&&(identical(other.newClockOutTime, newClockOutTime) || other.newClockOutTime == newClockOutTime)&&(identical(other.approvedById, approvedById) || other.approvedById == approvedById)&&(identical(other.approvedDate, approvedDate) || other.approvedDate == approvedDate)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,attendanceId,requestType,status,reason,newClockInTime,newClockOutTime,approvedById,approvedDate,rejectionReason,createdAt,updatedAt);

@override
String toString() {
  return 'AttendanceRequest(id: $id, userId: $userId, attendanceId: $attendanceId, requestType: $requestType, status: $status, reason: $reason, newClockInTime: $newClockInTime, newClockOutTime: $newClockOutTime, approvedById: $approvedById, approvedDate: $approvedDate, rejectionReason: $rejectionReason, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AttendanceRequestCopyWith<$Res>  {
  factory $AttendanceRequestCopyWith(AttendanceRequest value, $Res Function(AttendanceRequest) _then) = _$AttendanceRequestCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String attendanceId,@JsonKey(unknownEnumValue: AttendanceRequestType.correction) AttendanceRequestType requestType,@JsonKey(unknownEnumValue: AttendanceRequestStatus.pending) AttendanceRequestStatus status, String? reason, DateTime? newClockInTime, DateTime? newClockOutTime, String? approvedById, DateTime? approvedDate, String? rejectionReason, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$AttendanceRequestCopyWithImpl<$Res>
    implements $AttendanceRequestCopyWith<$Res> {
  _$AttendanceRequestCopyWithImpl(this._self, this._then);

  final AttendanceRequest _self;
  final $Res Function(AttendanceRequest) _then;

/// Create a copy of AttendanceRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? attendanceId = null,Object? requestType = null,Object? status = null,Object? reason = freezed,Object? newClockInTime = freezed,Object? newClockOutTime = freezed,Object? approvedById = freezed,Object? approvedDate = freezed,Object? rejectionReason = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,attendanceId: null == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String,requestType: null == requestType ? _self.requestType : requestType // ignore: cast_nullable_to_non_nullable
as AttendanceRequestType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AttendanceRequestStatus,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,newClockInTime: freezed == newClockInTime ? _self.newClockInTime : newClockInTime // ignore: cast_nullable_to_non_nullable
as DateTime?,newClockOutTime: freezed == newClockOutTime ? _self.newClockOutTime : newClockOutTime // ignore: cast_nullable_to_non_nullable
as DateTime?,approvedById: freezed == approvedById ? _self.approvedById : approvedById // ignore: cast_nullable_to_non_nullable
as String?,approvedDate: freezed == approvedDate ? _self.approvedDate : approvedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceRequest].
extension AttendanceRequestPatterns on AttendanceRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceRequest value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String attendanceId, @JsonKey(unknownEnumValue: AttendanceRequestType.correction)  AttendanceRequestType requestType, @JsonKey(unknownEnumValue: AttendanceRequestStatus.pending)  AttendanceRequestStatus status,  String? reason,  DateTime? newClockInTime,  DateTime? newClockOutTime,  String? approvedById,  DateTime? approvedDate,  String? rejectionReason,  DateTime createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceRequest() when $default != null:
return $default(_that.id,_that.userId,_that.attendanceId,_that.requestType,_that.status,_that.reason,_that.newClockInTime,_that.newClockOutTime,_that.approvedById,_that.approvedDate,_that.rejectionReason,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String attendanceId, @JsonKey(unknownEnumValue: AttendanceRequestType.correction)  AttendanceRequestType requestType, @JsonKey(unknownEnumValue: AttendanceRequestStatus.pending)  AttendanceRequestStatus status,  String? reason,  DateTime? newClockInTime,  DateTime? newClockOutTime,  String? approvedById,  DateTime? approvedDate,  String? rejectionReason,  DateTime createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _AttendanceRequest():
return $default(_that.id,_that.userId,_that.attendanceId,_that.requestType,_that.status,_that.reason,_that.newClockInTime,_that.newClockOutTime,_that.approvedById,_that.approvedDate,_that.rejectionReason,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String attendanceId, @JsonKey(unknownEnumValue: AttendanceRequestType.correction)  AttendanceRequestType requestType, @JsonKey(unknownEnumValue: AttendanceRequestStatus.pending)  AttendanceRequestStatus status,  String? reason,  DateTime? newClockInTime,  DateTime? newClockOutTime,  String? approvedById,  DateTime? approvedDate,  String? rejectionReason,  DateTime createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceRequest() when $default != null:
return $default(_that.id,_that.userId,_that.attendanceId,_that.requestType,_that.status,_that.reason,_that.newClockInTime,_that.newClockOutTime,_that.approvedById,_that.approvedDate,_that.rejectionReason,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceRequest extends AttendanceRequest {
   _AttendanceRequest({required this.id, required this.userId, required this.attendanceId, @JsonKey(unknownEnumValue: AttendanceRequestType.correction) required this.requestType, @JsonKey(unknownEnumValue: AttendanceRequestStatus.pending) required this.status, this.reason, this.newClockInTime, this.newClockOutTime, this.approvedById, this.approvedDate, this.rejectionReason, required this.createdAt, this.updatedAt}): super._();
  factory _AttendanceRequest.fromJson(Map<String, dynamic> json) => _$AttendanceRequestFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String attendanceId;
@override@JsonKey(unknownEnumValue: AttendanceRequestType.correction) final  AttendanceRequestType requestType;
@override@JsonKey(unknownEnumValue: AttendanceRequestStatus.pending) final  AttendanceRequestStatus status;
@override final  String? reason;
@override final  DateTime? newClockInTime;
@override final  DateTime? newClockOutTime;
@override final  String? approvedById;
@override final  DateTime? approvedDate;
@override final  String? rejectionReason;
@override final  DateTime createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of AttendanceRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceRequestCopyWith<_AttendanceRequest> get copyWith => __$AttendanceRequestCopyWithImpl<_AttendanceRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.attendanceId, attendanceId) || other.attendanceId == attendanceId)&&(identical(other.requestType, requestType) || other.requestType == requestType)&&(identical(other.status, status) || other.status == status)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.newClockInTime, newClockInTime) || other.newClockInTime == newClockInTime)&&(identical(other.newClockOutTime, newClockOutTime) || other.newClockOutTime == newClockOutTime)&&(identical(other.approvedById, approvedById) || other.approvedById == approvedById)&&(identical(other.approvedDate, approvedDate) || other.approvedDate == approvedDate)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,attendanceId,requestType,status,reason,newClockInTime,newClockOutTime,approvedById,approvedDate,rejectionReason,createdAt,updatedAt);

@override
String toString() {
  return 'AttendanceRequest(id: $id, userId: $userId, attendanceId: $attendanceId, requestType: $requestType, status: $status, reason: $reason, newClockInTime: $newClockInTime, newClockOutTime: $newClockOutTime, approvedById: $approvedById, approvedDate: $approvedDate, rejectionReason: $rejectionReason, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AttendanceRequestCopyWith<$Res> implements $AttendanceRequestCopyWith<$Res> {
  factory _$AttendanceRequestCopyWith(_AttendanceRequest value, $Res Function(_AttendanceRequest) _then) = __$AttendanceRequestCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String attendanceId,@JsonKey(unknownEnumValue: AttendanceRequestType.correction) AttendanceRequestType requestType,@JsonKey(unknownEnumValue: AttendanceRequestStatus.pending) AttendanceRequestStatus status, String? reason, DateTime? newClockInTime, DateTime? newClockOutTime, String? approvedById, DateTime? approvedDate, String? rejectionReason, DateTime createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$AttendanceRequestCopyWithImpl<$Res>
    implements _$AttendanceRequestCopyWith<$Res> {
  __$AttendanceRequestCopyWithImpl(this._self, this._then);

  final _AttendanceRequest _self;
  final $Res Function(_AttendanceRequest) _then;

/// Create a copy of AttendanceRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? attendanceId = null,Object? requestType = null,Object? status = null,Object? reason = freezed,Object? newClockInTime = freezed,Object? newClockOutTime = freezed,Object? approvedById = freezed,Object? approvedDate = freezed,Object? rejectionReason = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_AttendanceRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,attendanceId: null == attendanceId ? _self.attendanceId : attendanceId // ignore: cast_nullable_to_non_nullable
as String,requestType: null == requestType ? _self.requestType : requestType // ignore: cast_nullable_to_non_nullable
as AttendanceRequestType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AttendanceRequestStatus,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,newClockInTime: freezed == newClockInTime ? _self.newClockInTime : newClockInTime // ignore: cast_nullable_to_non_nullable
as DateTime?,newClockOutTime: freezed == newClockOutTime ? _self.newClockOutTime : newClockOutTime // ignore: cast_nullable_to_non_nullable
as DateTime?,approvedById: freezed == approvedById ? _self.approvedById : approvedById // ignore: cast_nullable_to_non_nullable
as String?,approvedDate: freezed == approvedDate ? _self.approvedDate : approvedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
