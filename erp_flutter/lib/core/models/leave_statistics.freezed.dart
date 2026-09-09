// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeaveStatistics {

 int get totalRequests; int get pendingRequests; int get approvedRequests; int get rejectedRequests; Map<String, int> get leaveTypeUsage; Map<String, double> get monthlyTrends;
/// Create a copy of LeaveStatistics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaveStatisticsCopyWith<LeaveStatistics> get copyWith => _$LeaveStatisticsCopyWithImpl<LeaveStatistics>(this as LeaveStatistics, _$identity);

  /// Serializes this LeaveStatistics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaveStatistics&&(identical(other.totalRequests, totalRequests) || other.totalRequests == totalRequests)&&(identical(other.pendingRequests, pendingRequests) || other.pendingRequests == pendingRequests)&&(identical(other.approvedRequests, approvedRequests) || other.approvedRequests == approvedRequests)&&(identical(other.rejectedRequests, rejectedRequests) || other.rejectedRequests == rejectedRequests)&&const DeepCollectionEquality().equals(other.leaveTypeUsage, leaveTypeUsage)&&const DeepCollectionEquality().equals(other.monthlyTrends, monthlyTrends));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalRequests,pendingRequests,approvedRequests,rejectedRequests,const DeepCollectionEquality().hash(leaveTypeUsage),const DeepCollectionEquality().hash(monthlyTrends));

@override
String toString() {
  return 'LeaveStatistics(totalRequests: $totalRequests, pendingRequests: $pendingRequests, approvedRequests: $approvedRequests, rejectedRequests: $rejectedRequests, leaveTypeUsage: $leaveTypeUsage, monthlyTrends: $monthlyTrends)';
}


}

/// @nodoc
abstract mixin class $LeaveStatisticsCopyWith<$Res>  {
  factory $LeaveStatisticsCopyWith(LeaveStatistics value, $Res Function(LeaveStatistics) _then) = _$LeaveStatisticsCopyWithImpl;
@useResult
$Res call({
 int totalRequests, int pendingRequests, int approvedRequests, int rejectedRequests, Map<String, int> leaveTypeUsage, Map<String, double> monthlyTrends
});




}
/// @nodoc
class _$LeaveStatisticsCopyWithImpl<$Res>
    implements $LeaveStatisticsCopyWith<$Res> {
  _$LeaveStatisticsCopyWithImpl(this._self, this._then);

  final LeaveStatistics _self;
  final $Res Function(LeaveStatistics) _then;

/// Create a copy of LeaveStatistics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalRequests = null,Object? pendingRequests = null,Object? approvedRequests = null,Object? rejectedRequests = null,Object? leaveTypeUsage = null,Object? monthlyTrends = null,}) {
  return _then(_self.copyWith(
totalRequests: null == totalRequests ? _self.totalRequests : totalRequests // ignore: cast_nullable_to_non_nullable
as int,pendingRequests: null == pendingRequests ? _self.pendingRequests : pendingRequests // ignore: cast_nullable_to_non_nullable
as int,approvedRequests: null == approvedRequests ? _self.approvedRequests : approvedRequests // ignore: cast_nullable_to_non_nullable
as int,rejectedRequests: null == rejectedRequests ? _self.rejectedRequests : rejectedRequests // ignore: cast_nullable_to_non_nullable
as int,leaveTypeUsage: null == leaveTypeUsage ? _self.leaveTypeUsage : leaveTypeUsage // ignore: cast_nullable_to_non_nullable
as Map<String, int>,monthlyTrends: null == monthlyTrends ? _self.monthlyTrends : monthlyTrends // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaveStatistics].
extension LeaveStatisticsPatterns on LeaveStatistics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaveStatistics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaveStatistics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaveStatistics value)  $default,){
final _that = this;
switch (_that) {
case _LeaveStatistics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaveStatistics value)?  $default,){
final _that = this;
switch (_that) {
case _LeaveStatistics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalRequests,  int pendingRequests,  int approvedRequests,  int rejectedRequests,  Map<String, int> leaveTypeUsage,  Map<String, double> monthlyTrends)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaveStatistics() when $default != null:
return $default(_that.totalRequests,_that.pendingRequests,_that.approvedRequests,_that.rejectedRequests,_that.leaveTypeUsage,_that.monthlyTrends);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalRequests,  int pendingRequests,  int approvedRequests,  int rejectedRequests,  Map<String, int> leaveTypeUsage,  Map<String, double> monthlyTrends)  $default,) {final _that = this;
switch (_that) {
case _LeaveStatistics():
return $default(_that.totalRequests,_that.pendingRequests,_that.approvedRequests,_that.rejectedRequests,_that.leaveTypeUsage,_that.monthlyTrends);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalRequests,  int pendingRequests,  int approvedRequests,  int rejectedRequests,  Map<String, int> leaveTypeUsage,  Map<String, double> monthlyTrends)?  $default,) {final _that = this;
switch (_that) {
case _LeaveStatistics() when $default != null:
return $default(_that.totalRequests,_that.pendingRequests,_that.approvedRequests,_that.rejectedRequests,_that.leaveTypeUsage,_that.monthlyTrends);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeaveStatistics implements LeaveStatistics {
   _LeaveStatistics({required this.totalRequests, required this.pendingRequests, required this.approvedRequests, required this.rejectedRequests, required final  Map<String, int> leaveTypeUsage, required final  Map<String, double> monthlyTrends}): _leaveTypeUsage = leaveTypeUsage,_monthlyTrends = monthlyTrends;
  factory _LeaveStatistics.fromJson(Map<String, dynamic> json) => _$LeaveStatisticsFromJson(json);

@override final  int totalRequests;
@override final  int pendingRequests;
@override final  int approvedRequests;
@override final  int rejectedRequests;
 final  Map<String, int> _leaveTypeUsage;
@override Map<String, int> get leaveTypeUsage {
  if (_leaveTypeUsage is EqualUnmodifiableMapView) return _leaveTypeUsage;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_leaveTypeUsage);
}

 final  Map<String, double> _monthlyTrends;
@override Map<String, double> get monthlyTrends {
  if (_monthlyTrends is EqualUnmodifiableMapView) return _monthlyTrends;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_monthlyTrends);
}


/// Create a copy of LeaveStatistics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaveStatisticsCopyWith<_LeaveStatistics> get copyWith => __$LeaveStatisticsCopyWithImpl<_LeaveStatistics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeaveStatisticsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaveStatistics&&(identical(other.totalRequests, totalRequests) || other.totalRequests == totalRequests)&&(identical(other.pendingRequests, pendingRequests) || other.pendingRequests == pendingRequests)&&(identical(other.approvedRequests, approvedRequests) || other.approvedRequests == approvedRequests)&&(identical(other.rejectedRequests, rejectedRequests) || other.rejectedRequests == rejectedRequests)&&const DeepCollectionEquality().equals(other._leaveTypeUsage, _leaveTypeUsage)&&const DeepCollectionEquality().equals(other._monthlyTrends, _monthlyTrends));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalRequests,pendingRequests,approvedRequests,rejectedRequests,const DeepCollectionEquality().hash(_leaveTypeUsage),const DeepCollectionEquality().hash(_monthlyTrends));

@override
String toString() {
  return 'LeaveStatistics(totalRequests: $totalRequests, pendingRequests: $pendingRequests, approvedRequests: $approvedRequests, rejectedRequests: $rejectedRequests, leaveTypeUsage: $leaveTypeUsage, monthlyTrends: $monthlyTrends)';
}


}

/// @nodoc
abstract mixin class _$LeaveStatisticsCopyWith<$Res> implements $LeaveStatisticsCopyWith<$Res> {
  factory _$LeaveStatisticsCopyWith(_LeaveStatistics value, $Res Function(_LeaveStatistics) _then) = __$LeaveStatisticsCopyWithImpl;
@override @useResult
$Res call({
 int totalRequests, int pendingRequests, int approvedRequests, int rejectedRequests, Map<String, int> leaveTypeUsage, Map<String, double> monthlyTrends
});




}
/// @nodoc
class __$LeaveStatisticsCopyWithImpl<$Res>
    implements _$LeaveStatisticsCopyWith<$Res> {
  __$LeaveStatisticsCopyWithImpl(this._self, this._then);

  final _LeaveStatistics _self;
  final $Res Function(_LeaveStatistics) _then;

/// Create a copy of LeaveStatistics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalRequests = null,Object? pendingRequests = null,Object? approvedRequests = null,Object? rejectedRequests = null,Object? leaveTypeUsage = null,Object? monthlyTrends = null,}) {
  return _then(_LeaveStatistics(
totalRequests: null == totalRequests ? _self.totalRequests : totalRequests // ignore: cast_nullable_to_non_nullable
as int,pendingRequests: null == pendingRequests ? _self.pendingRequests : pendingRequests // ignore: cast_nullable_to_non_nullable
as int,approvedRequests: null == approvedRequests ? _self.approvedRequests : approvedRequests // ignore: cast_nullable_to_non_nullable
as int,rejectedRequests: null == rejectedRequests ? _self.rejectedRequests : rejectedRequests // ignore: cast_nullable_to_non_nullable
as int,leaveTypeUsage: null == leaveTypeUsage ? _self._leaveTypeUsage : leaveTypeUsage // ignore: cast_nullable_to_non_nullable
as Map<String, int>,monthlyTrends: null == monthlyTrends ? _self._monthlyTrends : monthlyTrends // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}


}

// dart format on
