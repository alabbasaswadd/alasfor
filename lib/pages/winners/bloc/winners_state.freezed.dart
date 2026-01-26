// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'winners_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WinnersState {

 bool get isLoading; bool get isLoadingMore; bool get isSuccess; bool get isError; String get errorMessage; List<WinnerModel> get winners; int get currentPage; bool get hasReachedMax; int? get filterMonth; int? get filterYear;
/// Create a copy of WinnersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WinnersStateCopyWith<WinnersState> get copyWith => _$WinnersStateCopyWithImpl<WinnersState>(this as WinnersState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WinnersState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.winners, winners)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax)&&(identical(other.filterMonth, filterMonth) || other.filterMonth == filterMonth)&&(identical(other.filterYear, filterYear) || other.filterYear == filterYear));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isLoadingMore,isSuccess,isError,errorMessage,const DeepCollectionEquality().hash(winners),currentPage,hasReachedMax,filterMonth,filterYear);

@override
String toString() {
  return 'WinnersState(isLoading: $isLoading, isLoadingMore: $isLoadingMore, isSuccess: $isSuccess, isError: $isError, errorMessage: $errorMessage, winners: $winners, currentPage: $currentPage, hasReachedMax: $hasReachedMax, filterMonth: $filterMonth, filterYear: $filterYear)';
}


}

/// @nodoc
abstract mixin class $WinnersStateCopyWith<$Res>  {
  factory $WinnersStateCopyWith(WinnersState value, $Res Function(WinnersState) _then) = _$WinnersStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isLoadingMore, bool isSuccess, bool isError, String errorMessage, List<WinnerModel> winners, int currentPage, bool hasReachedMax, int? filterMonth, int? filterYear
});




}
/// @nodoc
class _$WinnersStateCopyWithImpl<$Res>
    implements $WinnersStateCopyWith<$Res> {
  _$WinnersStateCopyWithImpl(this._self, this._then);

  final WinnersState _self;
  final $Res Function(WinnersState) _then;

/// Create a copy of WinnersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isLoadingMore = null,Object? isSuccess = null,Object? isError = null,Object? errorMessage = null,Object? winners = null,Object? currentPage = null,Object? hasReachedMax = null,Object? filterMonth = freezed,Object? filterYear = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,winners: null == winners ? _self.winners : winners // ignore: cast_nullable_to_non_nullable
as List<WinnerModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,filterMonth: freezed == filterMonth ? _self.filterMonth : filterMonth // ignore: cast_nullable_to_non_nullable
as int?,filterYear: freezed == filterYear ? _self.filterYear : filterYear // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [WinnersState].
extension WinnersStatePatterns on WinnersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WinnersState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WinnersState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WinnersState value)  $default,){
final _that = this;
switch (_that) {
case _WinnersState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WinnersState value)?  $default,){
final _that = this;
switch (_that) {
case _WinnersState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isLoadingMore,  bool isSuccess,  bool isError,  String errorMessage,  List<WinnerModel> winners,  int currentPage,  bool hasReachedMax,  int? filterMonth,  int? filterYear)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WinnersState() when $default != null:
return $default(_that.isLoading,_that.isLoadingMore,_that.isSuccess,_that.isError,_that.errorMessage,_that.winners,_that.currentPage,_that.hasReachedMax,_that.filterMonth,_that.filterYear);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isLoadingMore,  bool isSuccess,  bool isError,  String errorMessage,  List<WinnerModel> winners,  int currentPage,  bool hasReachedMax,  int? filterMonth,  int? filterYear)  $default,) {final _that = this;
switch (_that) {
case _WinnersState():
return $default(_that.isLoading,_that.isLoadingMore,_that.isSuccess,_that.isError,_that.errorMessage,_that.winners,_that.currentPage,_that.hasReachedMax,_that.filterMonth,_that.filterYear);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isLoadingMore,  bool isSuccess,  bool isError,  String errorMessage,  List<WinnerModel> winners,  int currentPage,  bool hasReachedMax,  int? filterMonth,  int? filterYear)?  $default,) {final _that = this;
switch (_that) {
case _WinnersState() when $default != null:
return $default(_that.isLoading,_that.isLoadingMore,_that.isSuccess,_that.isError,_that.errorMessage,_that.winners,_that.currentPage,_that.hasReachedMax,_that.filterMonth,_that.filterYear);case _:
  return null;

}
}

}

/// @nodoc


class _WinnersState implements WinnersState {
  const _WinnersState({this.isLoading = false, this.isLoadingMore = false, this.isSuccess = false, this.isError = false, this.errorMessage = '', final  List<WinnerModel> winners = const [], this.currentPage = 1, this.hasReachedMax = false, this.filterMonth, this.filterYear}): _winners = winners;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isLoadingMore;
@override@JsonKey() final  bool isSuccess;
@override@JsonKey() final  bool isError;
@override@JsonKey() final  String errorMessage;
 final  List<WinnerModel> _winners;
@override@JsonKey() List<WinnerModel> get winners {
  if (_winners is EqualUnmodifiableListView) return _winners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_winners);
}

@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool hasReachedMax;
@override final  int? filterMonth;
@override final  int? filterYear;

/// Create a copy of WinnersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WinnersStateCopyWith<_WinnersState> get copyWith => __$WinnersStateCopyWithImpl<_WinnersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WinnersState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._winners, _winners)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax)&&(identical(other.filterMonth, filterMonth) || other.filterMonth == filterMonth)&&(identical(other.filterYear, filterYear) || other.filterYear == filterYear));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isLoadingMore,isSuccess,isError,errorMessage,const DeepCollectionEquality().hash(_winners),currentPage,hasReachedMax,filterMonth,filterYear);

@override
String toString() {
  return 'WinnersState(isLoading: $isLoading, isLoadingMore: $isLoadingMore, isSuccess: $isSuccess, isError: $isError, errorMessage: $errorMessage, winners: $winners, currentPage: $currentPage, hasReachedMax: $hasReachedMax, filterMonth: $filterMonth, filterYear: $filterYear)';
}


}

/// @nodoc
abstract mixin class _$WinnersStateCopyWith<$Res> implements $WinnersStateCopyWith<$Res> {
  factory _$WinnersStateCopyWith(_WinnersState value, $Res Function(_WinnersState) _then) = __$WinnersStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isLoadingMore, bool isSuccess, bool isError, String errorMessage, List<WinnerModel> winners, int currentPage, bool hasReachedMax, int? filterMonth, int? filterYear
});




}
/// @nodoc
class __$WinnersStateCopyWithImpl<$Res>
    implements _$WinnersStateCopyWith<$Res> {
  __$WinnersStateCopyWithImpl(this._self, this._then);

  final _WinnersState _self;
  final $Res Function(_WinnersState) _then;

/// Create a copy of WinnersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isLoadingMore = null,Object? isSuccess = null,Object? isError = null,Object? errorMessage = null,Object? winners = null,Object? currentPage = null,Object? hasReachedMax = null,Object? filterMonth = freezed,Object? filterYear = freezed,}) {
  return _then(_WinnersState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,winners: null == winners ? _self._winners : winners // ignore: cast_nullable_to_non_nullable
as List<WinnerModel>,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,filterMonth: freezed == filterMonth ? _self.filterMonth : filterMonth // ignore: cast_nullable_to_non_nullable
as int?,filterYear: freezed == filterYear ? _self.filterYear : filterYear // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
