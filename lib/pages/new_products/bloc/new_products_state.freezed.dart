// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NewProductsState {

 bool get isLoading; bool get isSuccess; bool get isError; String get errorMessage; List<ProductsModel> get products;
/// Create a copy of NewProductsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewProductsStateCopyWith<NewProductsState> get copyWith => _$NewProductsStateCopyWithImpl<NewProductsState>(this as NewProductsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewProductsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.products, products));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSuccess,isError,errorMessage,const DeepCollectionEquality().hash(products));

@override
String toString() {
  return 'NewProductsState(isLoading: $isLoading, isSuccess: $isSuccess, isError: $isError, errorMessage: $errorMessage, products: $products)';
}


}

/// @nodoc
abstract mixin class $NewProductsStateCopyWith<$Res>  {
  factory $NewProductsStateCopyWith(NewProductsState value, $Res Function(NewProductsState) _then) = _$NewProductsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isSuccess, bool isError, String errorMessage, List<ProductsModel> products
});




}
/// @nodoc
class _$NewProductsStateCopyWithImpl<$Res>
    implements $NewProductsStateCopyWith<$Res> {
  _$NewProductsStateCopyWithImpl(this._self, this._then);

  final NewProductsState _self;
  final $Res Function(NewProductsState) _then;

/// Create a copy of NewProductsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isSuccess = null,Object? isError = null,Object? errorMessage = null,Object? products = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductsModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [NewProductsState].
extension NewProductsStatePatterns on NewProductsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewProductsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewProductsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewProductsState value)  $default,){
final _that = this;
switch (_that) {
case _NewProductsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewProductsState value)?  $default,){
final _that = this;
switch (_that) {
case _NewProductsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isSuccess,  bool isError,  String errorMessage,  List<ProductsModel> products)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewProductsState() when $default != null:
return $default(_that.isLoading,_that.isSuccess,_that.isError,_that.errorMessage,_that.products);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isSuccess,  bool isError,  String errorMessage,  List<ProductsModel> products)  $default,) {final _that = this;
switch (_that) {
case _NewProductsState():
return $default(_that.isLoading,_that.isSuccess,_that.isError,_that.errorMessage,_that.products);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isSuccess,  bool isError,  String errorMessage,  List<ProductsModel> products)?  $default,) {final _that = this;
switch (_that) {
case _NewProductsState() when $default != null:
return $default(_that.isLoading,_that.isSuccess,_that.isError,_that.errorMessage,_that.products);case _:
  return null;

}
}

}

/// @nodoc


class _NewProductsState implements NewProductsState {
  const _NewProductsState({this.isLoading = false, this.isSuccess = false, this.isError = false, this.errorMessage = '', final  List<ProductsModel> products = const []}): _products = products;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSuccess;
@override@JsonKey() final  bool isError;
@override@JsonKey() final  String errorMessage;
 final  List<ProductsModel> _products;
@override@JsonKey() List<ProductsModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}


/// Create a copy of NewProductsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewProductsStateCopyWith<_NewProductsState> get copyWith => __$NewProductsStateCopyWithImpl<_NewProductsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewProductsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._products, _products));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSuccess,isError,errorMessage,const DeepCollectionEquality().hash(_products));

@override
String toString() {
  return 'NewProductsState(isLoading: $isLoading, isSuccess: $isSuccess, isError: $isError, errorMessage: $errorMessage, products: $products)';
}


}

/// @nodoc
abstract mixin class _$NewProductsStateCopyWith<$Res> implements $NewProductsStateCopyWith<$Res> {
  factory _$NewProductsStateCopyWith(_NewProductsState value, $Res Function(_NewProductsState) _then) = __$NewProductsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isSuccess, bool isError, String errorMessage, List<ProductsModel> products
});




}
/// @nodoc
class __$NewProductsStateCopyWithImpl<$Res>
    implements _$NewProductsStateCopyWith<$Res> {
  __$NewProductsStateCopyWithImpl(this._self, this._then);

  final _NewProductsState _self;
  final $Res Function(_NewProductsState) _then;

/// Create a copy of NewProductsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isSuccess = null,Object? isError = null,Object? errorMessage = null,Object? products = null,}) {
  return _then(_NewProductsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductsModel>,
  ));
}


}

// dart format on
