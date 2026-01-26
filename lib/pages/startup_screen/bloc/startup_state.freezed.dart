// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'startup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StartupState {

 bool get isLoading; bool get isAnimationComplete; bool get isOnboardingCompleted; StartupNavigationTarget get navigationTarget;
/// Create a copy of StartupState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartupStateCopyWith<StartupState> get copyWith => _$StartupStateCopyWithImpl<StartupState>(this as StartupState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartupState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isAnimationComplete, isAnimationComplete) || other.isAnimationComplete == isAnimationComplete)&&(identical(other.isOnboardingCompleted, isOnboardingCompleted) || other.isOnboardingCompleted == isOnboardingCompleted)&&(identical(other.navigationTarget, navigationTarget) || other.navigationTarget == navigationTarget));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isAnimationComplete,isOnboardingCompleted,navigationTarget);

@override
String toString() {
  return 'StartupState(isLoading: $isLoading, isAnimationComplete: $isAnimationComplete, isOnboardingCompleted: $isOnboardingCompleted, navigationTarget: $navigationTarget)';
}


}

/// @nodoc
abstract mixin class $StartupStateCopyWith<$Res>  {
  factory $StartupStateCopyWith(StartupState value, $Res Function(StartupState) _then) = _$StartupStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isAnimationComplete, bool isOnboardingCompleted, StartupNavigationTarget navigationTarget
});




}
/// @nodoc
class _$StartupStateCopyWithImpl<$Res>
    implements $StartupStateCopyWith<$Res> {
  _$StartupStateCopyWithImpl(this._self, this._then);

  final StartupState _self;
  final $Res Function(StartupState) _then;

/// Create a copy of StartupState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isAnimationComplete = null,Object? isOnboardingCompleted = null,Object? navigationTarget = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isAnimationComplete: null == isAnimationComplete ? _self.isAnimationComplete : isAnimationComplete // ignore: cast_nullable_to_non_nullable
as bool,isOnboardingCompleted: null == isOnboardingCompleted ? _self.isOnboardingCompleted : isOnboardingCompleted // ignore: cast_nullable_to_non_nullable
as bool,navigationTarget: null == navigationTarget ? _self.navigationTarget : navigationTarget // ignore: cast_nullable_to_non_nullable
as StartupNavigationTarget,
  ));
}

}


/// Adds pattern-matching-related methods to [StartupState].
extension StartupStatePatterns on StartupState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StartupState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StartupState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StartupState value)  $default,){
final _that = this;
switch (_that) {
case _StartupState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StartupState value)?  $default,){
final _that = this;
switch (_that) {
case _StartupState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isAnimationComplete,  bool isOnboardingCompleted,  StartupNavigationTarget navigationTarget)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StartupState() when $default != null:
return $default(_that.isLoading,_that.isAnimationComplete,_that.isOnboardingCompleted,_that.navigationTarget);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isAnimationComplete,  bool isOnboardingCompleted,  StartupNavigationTarget navigationTarget)  $default,) {final _that = this;
switch (_that) {
case _StartupState():
return $default(_that.isLoading,_that.isAnimationComplete,_that.isOnboardingCompleted,_that.navigationTarget);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isAnimationComplete,  bool isOnboardingCompleted,  StartupNavigationTarget navigationTarget)?  $default,) {final _that = this;
switch (_that) {
case _StartupState() when $default != null:
return $default(_that.isLoading,_that.isAnimationComplete,_that.isOnboardingCompleted,_that.navigationTarget);case _:
  return null;

}
}

}

/// @nodoc


class _StartupState implements StartupState {
  const _StartupState({this.isLoading = false, this.isAnimationComplete = false, this.isOnboardingCompleted = false, this.navigationTarget = StartupNavigationTarget.none});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isAnimationComplete;
@override@JsonKey() final  bool isOnboardingCompleted;
@override@JsonKey() final  StartupNavigationTarget navigationTarget;

/// Create a copy of StartupState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartupStateCopyWith<_StartupState> get copyWith => __$StartupStateCopyWithImpl<_StartupState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartupState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isAnimationComplete, isAnimationComplete) || other.isAnimationComplete == isAnimationComplete)&&(identical(other.isOnboardingCompleted, isOnboardingCompleted) || other.isOnboardingCompleted == isOnboardingCompleted)&&(identical(other.navigationTarget, navigationTarget) || other.navigationTarget == navigationTarget));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isAnimationComplete,isOnboardingCompleted,navigationTarget);

@override
String toString() {
  return 'StartupState(isLoading: $isLoading, isAnimationComplete: $isAnimationComplete, isOnboardingCompleted: $isOnboardingCompleted, navigationTarget: $navigationTarget)';
}


}

/// @nodoc
abstract mixin class _$StartupStateCopyWith<$Res> implements $StartupStateCopyWith<$Res> {
  factory _$StartupStateCopyWith(_StartupState value, $Res Function(_StartupState) _then) = __$StartupStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isAnimationComplete, bool isOnboardingCompleted, StartupNavigationTarget navigationTarget
});




}
/// @nodoc
class __$StartupStateCopyWithImpl<$Res>
    implements _$StartupStateCopyWith<$Res> {
  __$StartupStateCopyWithImpl(this._self, this._then);

  final _StartupState _self;
  final $Res Function(_StartupState) _then;

/// Create a copy of StartupState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isAnimationComplete = null,Object? isOnboardingCompleted = null,Object? navigationTarget = null,}) {
  return _then(_StartupState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isAnimationComplete: null == isAnimationComplete ? _self.isAnimationComplete : isAnimationComplete // ignore: cast_nullable_to_non_nullable
as bool,isOnboardingCompleted: null == isOnboardingCompleted ? _self.isOnboardingCompleted : isOnboardingCompleted // ignore: cast_nullable_to_non_nullable
as bool,navigationTarget: null == navigationTarget ? _self.navigationTarget : navigationTarget // ignore: cast_nullable_to_non_nullable
as StartupNavigationTarget,
  ));
}


}

// dart format on
