// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaveBalance {

 String get leaveTypeId; String get leaveTypeName; int get totalDays; int get usedDays; int get pendingDays;
/// Create a copy of LeaveBalance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaveBalanceCopyWith<LeaveBalance> get copyWith => _$LeaveBalanceCopyWithImpl<LeaveBalance>(this as LeaveBalance, _$identity);

  /// Serializes this LeaveBalance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaveBalance&&(identical(other.leaveTypeId, leaveTypeId) || other.leaveTypeId == leaveTypeId)&&(identical(other.leaveTypeName, leaveTypeName) || other.leaveTypeName == leaveTypeName)&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays)&&(identical(other.usedDays, usedDays) || other.usedDays == usedDays)&&(identical(other.pendingDays, pendingDays) || other.pendingDays == pendingDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leaveTypeId,leaveTypeName,totalDays,usedDays,pendingDays);

@override
String toString() {
  return 'LeaveBalance(leaveTypeId: $leaveTypeId, leaveTypeName: $leaveTypeName, totalDays: $totalDays, usedDays: $usedDays, pendingDays: $pendingDays)';
}


}

/// @nodoc
abstract mixin class $LeaveBalanceCopyWith<$Res>  {
  factory $LeaveBalanceCopyWith(LeaveBalance value, $Res Function(LeaveBalance) _then) = _$LeaveBalanceCopyWithImpl;
@useResult
$Res call({
 String leaveTypeId, String leaveTypeName, int totalDays, int usedDays, int pendingDays
});




}
/// @nodoc
class _$LeaveBalanceCopyWithImpl<$Res>
    implements $LeaveBalanceCopyWith<$Res> {
  _$LeaveBalanceCopyWithImpl(this._self, this._then);

  final LeaveBalance _self;
  final $Res Function(LeaveBalance) _then;

/// Create a copy of LeaveBalance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? leaveTypeId = null,Object? leaveTypeName = null,Object? totalDays = null,Object? usedDays = null,Object? pendingDays = null,}) {
  return _then(_self.copyWith(
leaveTypeId: null == leaveTypeId ? _self.leaveTypeId : leaveTypeId // ignore: cast_nullable_to_non_nullable
as String,leaveTypeName: null == leaveTypeName ? _self.leaveTypeName : leaveTypeName // ignore: cast_nullable_to_non_nullable
as String,totalDays: null == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int,usedDays: null == usedDays ? _self.usedDays : usedDays // ignore: cast_nullable_to_non_nullable
as int,pendingDays: null == pendingDays ? _self.pendingDays : pendingDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaveBalance].
extension LeaveBalancePatterns on LeaveBalance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaveBalance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaveBalance() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaveBalance value)  $default,){
final _that = this;
switch (_that) {
case _LeaveBalance():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaveBalance value)?  $default,){
final _that = this;
switch (_that) {
case _LeaveBalance() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String leaveTypeId,  String leaveTypeName,  int totalDays,  int usedDays,  int pendingDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaveBalance() when $default != null:
return $default(_that.leaveTypeId,_that.leaveTypeName,_that.totalDays,_that.usedDays,_that.pendingDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String leaveTypeId,  String leaveTypeName,  int totalDays,  int usedDays,  int pendingDays)  $default,) {final _that = this;
switch (_that) {
case _LeaveBalance():
return $default(_that.leaveTypeId,_that.leaveTypeName,_that.totalDays,_that.usedDays,_that.pendingDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String leaveTypeId,  String leaveTypeName,  int totalDays,  int usedDays,  int pendingDays)?  $default,) {final _that = this;
switch (_that) {
case _LeaveBalance() when $default != null:
return $default(_that.leaveTypeId,_that.leaveTypeName,_that.totalDays,_that.usedDays,_that.pendingDays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeaveBalance extends LeaveBalance {
   _LeaveBalance({required this.leaveTypeId, required this.leaveTypeName, required this.totalDays, required this.usedDays, required this.pendingDays}): super._();
  factory _LeaveBalance.fromJson(Map<String, dynamic> json) => _$LeaveBalanceFromJson(json);

@override final  String leaveTypeId;
@override final  String leaveTypeName;
@override final  int totalDays;
@override final  int usedDays;
@override final  int pendingDays;

/// Create a copy of LeaveBalance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaveBalanceCopyWith<_LeaveBalance> get copyWith => __$LeaveBalanceCopyWithImpl<_LeaveBalance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaveBalanceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaveBalance&&(identical(other.leaveTypeId, leaveTypeId) || other.leaveTypeId == leaveTypeId)&&(identical(other.leaveTypeName, leaveTypeName) || other.leaveTypeName == leaveTypeName)&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays)&&(identical(other.usedDays, usedDays) || other.usedDays == usedDays)&&(identical(other.pendingDays, pendingDays) || other.pendingDays == pendingDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,leaveTypeId,leaveTypeName,totalDays,usedDays,pendingDays);

@override
String toString() {
  return 'LeaveBalance(leaveTypeId: $leaveTypeId, leaveTypeName: $leaveTypeName, totalDays: $totalDays, usedDays: $usedDays, pendingDays: $pendingDays)';
}


}

/// @nodoc
abstract mixin class _$LeaveBalanceCopyWith<$Res> implements $LeaveBalanceCopyWith<$Res> {
  factory _$LeaveBalanceCopyWith(_LeaveBalance value, $Res Function(_LeaveBalance) _then) = __$LeaveBalanceCopyWithImpl;
@override @useResult
$Res call({
 String leaveTypeId, String leaveTypeName, int totalDays, int usedDays, int pendingDays
});




}
/// @nodoc
class __$LeaveBalanceCopyWithImpl<$Res>
    implements _$LeaveBalanceCopyWith<$Res> {
  __$LeaveBalanceCopyWithImpl(this._self, this._then);

  final _LeaveBalance _self;
  final $Res Function(_LeaveBalance) _then;

/// Create a copy of LeaveBalance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? leaveTypeId = null,Object? leaveTypeName = null,Object? totalDays = null,Object? usedDays = null,Object? pendingDays = null,}) {
  return _then(_LeaveBalance(
leaveTypeId: null == leaveTypeId ? _self.leaveTypeId : leaveTypeId // ignore: cast_nullable_to_non_nullable
as String,leaveTypeName: null == leaveTypeName ? _self.leaveTypeName : leaveTypeName // ignore: cast_nullable_to_non_nullable
as String,totalDays: null == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int,usedDays: null == usedDays ? _self.usedDays : usedDays // ignore: cast_nullable_to_non_nullable
as int,pendingDays: null == pendingDays ? _self.pendingDays : pendingDays // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
