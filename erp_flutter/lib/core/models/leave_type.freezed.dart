// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaveType {

 String get id; String get name; String? get description; int get defaultDays; bool get isPaid; bool get requiresApproval; String? get iconCode; String? get colorCode; int get maxConsecutiveDays; bool get isActive;
/// Create a copy of LeaveType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaveTypeCopyWith<LeaveType> get copyWith => _$LeaveTypeCopyWithImpl<LeaveType>(this as LeaveType, _$identity);

  /// Serializes this LeaveType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaveType&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.defaultDays, defaultDays) || other.defaultDays == defaultDays)&&(identical(other.isPaid, isPaid) || other.isPaid == isPaid)&&(identical(other.requiresApproval, requiresApproval) || other.requiresApproval == requiresApproval)&&(identical(other.iconCode, iconCode) || other.iconCode == iconCode)&&(identical(other.colorCode, colorCode) || other.colorCode == colorCode)&&(identical(other.maxConsecutiveDays, maxConsecutiveDays) || other.maxConsecutiveDays == maxConsecutiveDays)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,defaultDays,isPaid,requiresApproval,iconCode,colorCode,maxConsecutiveDays,isActive);

@override
String toString() {
  return 'LeaveType(id: $id, name: $name, description: $description, defaultDays: $defaultDays, isPaid: $isPaid, requiresApproval: $requiresApproval, iconCode: $iconCode, colorCode: $colorCode, maxConsecutiveDays: $maxConsecutiveDays, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $LeaveTypeCopyWith<$Res>  {
  factory $LeaveTypeCopyWith(LeaveType value, $Res Function(LeaveType) _then) = _$LeaveTypeCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, int defaultDays, bool isPaid, bool requiresApproval, String? iconCode, String? colorCode, int maxConsecutiveDays, bool isActive
});




}
/// @nodoc
class _$LeaveTypeCopyWithImpl<$Res>
    implements $LeaveTypeCopyWith<$Res> {
  _$LeaveTypeCopyWithImpl(this._self, this._then);

  final LeaveType _self;
  final $Res Function(LeaveType) _then;

/// Create a copy of LeaveType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? defaultDays = null,Object? isPaid = null,Object? requiresApproval = null,Object? iconCode = freezed,Object? colorCode = freezed,Object? maxConsecutiveDays = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,defaultDays: null == defaultDays ? _self.defaultDays : defaultDays // ignore: cast_nullable_to_non_nullable
as int,isPaid: null == isPaid ? _self.isPaid : isPaid // ignore: cast_nullable_to_non_nullable
as bool,requiresApproval: null == requiresApproval ? _self.requiresApproval : requiresApproval // ignore: cast_nullable_to_non_nullable
as bool,iconCode: freezed == iconCode ? _self.iconCode : iconCode // ignore: cast_nullable_to_non_nullable
as String?,colorCode: freezed == colorCode ? _self.colorCode : colorCode // ignore: cast_nullable_to_non_nullable
as String?,maxConsecutiveDays: null == maxConsecutiveDays ? _self.maxConsecutiveDays : maxConsecutiveDays // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaveType].
extension LeaveTypePatterns on LeaveType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaveType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaveType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaveType value)  $default,){
final _that = this;
switch (_that) {
case _LeaveType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaveType value)?  $default,){
final _that = this;
switch (_that) {
case _LeaveType() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  int defaultDays,  bool isPaid,  bool requiresApproval,  String? iconCode,  String? colorCode,  int maxConsecutiveDays,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaveType() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.defaultDays,_that.isPaid,_that.requiresApproval,_that.iconCode,_that.colorCode,_that.maxConsecutiveDays,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  int defaultDays,  bool isPaid,  bool requiresApproval,  String? iconCode,  String? colorCode,  int maxConsecutiveDays,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _LeaveType():
return $default(_that.id,_that.name,_that.description,_that.defaultDays,_that.isPaid,_that.requiresApproval,_that.iconCode,_that.colorCode,_that.maxConsecutiveDays,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  int defaultDays,  bool isPaid,  bool requiresApproval,  String? iconCode,  String? colorCode,  int maxConsecutiveDays,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _LeaveType() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.defaultDays,_that.isPaid,_that.requiresApproval,_that.iconCode,_that.colorCode,_that.maxConsecutiveDays,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeaveType extends LeaveType {
   _LeaveType({required this.id, required this.name, this.description, required this.defaultDays, required this.isPaid, required this.requiresApproval, this.iconCode, this.colorCode, required this.maxConsecutiveDays, required this.isActive}): super._();
  factory _LeaveType.fromJson(Map<String, dynamic> json) => _$LeaveTypeFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  int defaultDays;
@override final  bool isPaid;
@override final  bool requiresApproval;
@override final  String? iconCode;
@override final  String? colorCode;
@override final  int maxConsecutiveDays;
@override final  bool isActive;

/// Create a copy of LeaveType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaveTypeCopyWith<_LeaveType> get copyWith => __$LeaveTypeCopyWithImpl<_LeaveType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaveTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaveType&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.defaultDays, defaultDays) || other.defaultDays == defaultDays)&&(identical(other.isPaid, isPaid) || other.isPaid == isPaid)&&(identical(other.requiresApproval, requiresApproval) || other.requiresApproval == requiresApproval)&&(identical(other.iconCode, iconCode) || other.iconCode == iconCode)&&(identical(other.colorCode, colorCode) || other.colorCode == colorCode)&&(identical(other.maxConsecutiveDays, maxConsecutiveDays) || other.maxConsecutiveDays == maxConsecutiveDays)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,defaultDays,isPaid,requiresApproval,iconCode,colorCode,maxConsecutiveDays,isActive);

@override
String toString() {
  return 'LeaveType(id: $id, name: $name, description: $description, defaultDays: $defaultDays, isPaid: $isPaid, requiresApproval: $requiresApproval, iconCode: $iconCode, colorCode: $colorCode, maxConsecutiveDays: $maxConsecutiveDays, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$LeaveTypeCopyWith<$Res> implements $LeaveTypeCopyWith<$Res> {
  factory _$LeaveTypeCopyWith(_LeaveType value, $Res Function(_LeaveType) _then) = __$LeaveTypeCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, int defaultDays, bool isPaid, bool requiresApproval, String? iconCode, String? colorCode, int maxConsecutiveDays, bool isActive
});




}
/// @nodoc
class __$LeaveTypeCopyWithImpl<$Res>
    implements _$LeaveTypeCopyWith<$Res> {
  __$LeaveTypeCopyWithImpl(this._self, this._then);

  final _LeaveType _self;
  final $Res Function(_LeaveType) _then;

/// Create a copy of LeaveType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? defaultDays = null,Object? isPaid = null,Object? requiresApproval = null,Object? iconCode = freezed,Object? colorCode = freezed,Object? maxConsecutiveDays = null,Object? isActive = null,}) {
  return _then(_LeaveType(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,defaultDays: null == defaultDays ? _self.defaultDays : defaultDays // ignore: cast_nullable_to_non_nullable
as int,isPaid: null == isPaid ? _self.isPaid : isPaid // ignore: cast_nullable_to_non_nullable
as bool,requiresApproval: null == requiresApproval ? _self.requiresApproval : requiresApproval // ignore: cast_nullable_to_non_nullable
as bool,iconCode: freezed == iconCode ? _self.iconCode : iconCode // ignore: cast_nullable_to_non_nullable
as String?,colorCode: freezed == colorCode ? _self.colorCode : colorCode // ignore: cast_nullable_to_non_nullable
as String?,maxConsecutiveDays: null == maxConsecutiveDays ? _self.maxConsecutiveDays : maxConsecutiveDays // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
