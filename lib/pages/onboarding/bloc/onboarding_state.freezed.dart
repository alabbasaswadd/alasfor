// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingState {

 bool get isLoading; bool get isCompleted; int get currentPage; List<OnboardingContent> get pages; bool get shouldNavigateToMain;
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingStateCopyWith<OnboardingState> get copyWith => _$OnboardingStateCopyWithImpl<OnboardingState>(this as OnboardingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other.pages, pages)&&(identical(other.shouldNavigateToMain, shouldNavigateToMain) || other.shouldNavigateToMain == shouldNavigateToMain));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isCompleted,currentPage,const DeepCollectionEquality().hash(pages),shouldNavigateToMain);

@override
String toString() {
  return 'OnboardingState(isLoading: $isLoading, isCompleted: $isCompleted, currentPage: $currentPage, pages: $pages, shouldNavigateToMain: $shouldNavigateToMain)';
}


}

/// @nodoc
abstract mixin class $OnboardingStateCopyWith<$Res>  {
  factory $OnboardingStateCopyWith(OnboardingState value, $Res Function(OnboardingState) _then) = _$OnboardingStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isCompleted, int currentPage, List<OnboardingContent> pages, bool shouldNavigateToMain
});




}
/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._self, this._then);

  final OnboardingState _self;
  final $Res Function(OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isCompleted = null,Object? currentPage = null,Object? pages = null,Object? shouldNavigateToMain = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as List<OnboardingContent>,shouldNavigateToMain: null == shouldNavigateToMain ? _self.shouldNavigateToMain : shouldNavigateToMain // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingState].
extension OnboardingStatePatterns on OnboardingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isCompleted,  int currentPage,  List<OnboardingContent> pages,  bool shouldNavigateToMain)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.isLoading,_that.isCompleted,_that.currentPage,_that.pages,_that.shouldNavigateToMain);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isCompleted,  int currentPage,  List<OnboardingContent> pages,  bool shouldNavigateToMain)  $default,) {final _that = this;
switch (_that) {
case _OnboardingState():
return $default(_that.isLoading,_that.isCompleted,_that.currentPage,_that.pages,_that.shouldNavigateToMain);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isCompleted,  int currentPage,  List<OnboardingContent> pages,  bool shouldNavigateToMain)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.isLoading,_that.isCompleted,_that.currentPage,_that.pages,_that.shouldNavigateToMain);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingState implements OnboardingState {
  const _OnboardingState({this.isLoading = false, this.isCompleted = false, this.currentPage = 0, final  List<OnboardingContent> pages = const [], this.shouldNavigateToMain = false}): _pages = pages;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isCompleted;
@override@JsonKey() final  int currentPage;
 final  List<OnboardingContent> _pages;
@override@JsonKey() List<OnboardingContent> get pages {
  if (_pages is EqualUnmodifiableListView) return _pages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pages);
}

@override@JsonKey() final  bool shouldNavigateToMain;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingStateCopyWith<_OnboardingState> get copyWith => __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&const DeepCollectionEquality().equals(other._pages, _pages)&&(identical(other.shouldNavigateToMain, shouldNavigateToMain) || other.shouldNavigateToMain == shouldNavigateToMain));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isCompleted,currentPage,const DeepCollectionEquality().hash(_pages),shouldNavigateToMain);

@override
String toString() {
  return 'OnboardingState(isLoading: $isLoading, isCompleted: $isCompleted, currentPage: $currentPage, pages: $pages, shouldNavigateToMain: $shouldNavigateToMain)';
}


}

/// @nodoc
abstract mixin class _$OnboardingStateCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(_OnboardingState value, $Res Function(_OnboardingState) _then) = __$OnboardingStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isCompleted, int currentPage, List<OnboardingContent> pages, bool shouldNavigateToMain
});




}
/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(this._self, this._then);

  final _OnboardingState _self;
  final $Res Function(_OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isCompleted = null,Object? currentPage = null,Object? pages = null,Object? shouldNavigateToMain = null,}) {
  return _then(_OnboardingState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,pages: null == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as List<OnboardingContent>,shouldNavigateToMain: null == shouldNavigateToMain ? _self.shouldNavigateToMain : shouldNavigateToMain // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
