// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scanner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScannerState {

 bool get isLoading; bool get isSuccess; bool get isError; String get errorMessage; bool get isCameraOpen; String get scannedCode; String? get capturedImagePath; ScanResult? get scanResult;
/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScannerStateCopyWith<ScannerState> get copyWith => _$ScannerStateCopyWithImpl<ScannerState>(this as ScannerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isCameraOpen, isCameraOpen) || other.isCameraOpen == isCameraOpen)&&(identical(other.scannedCode, scannedCode) || other.scannedCode == scannedCode)&&(identical(other.capturedImagePath, capturedImagePath) || other.capturedImagePath == capturedImagePath)&&(identical(other.scanResult, scanResult) || other.scanResult == scanResult));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSuccess,isError,errorMessage,isCameraOpen,scannedCode,capturedImagePath,scanResult);

@override
String toString() {
  return 'ScannerState(isLoading: $isLoading, isSuccess: $isSuccess, isError: $isError, errorMessage: $errorMessage, isCameraOpen: $isCameraOpen, scannedCode: $scannedCode, capturedImagePath: $capturedImagePath, scanResult: $scanResult)';
}


}

/// @nodoc
abstract mixin class $ScannerStateCopyWith<$Res>  {
  factory $ScannerStateCopyWith(ScannerState value, $Res Function(ScannerState) _then) = _$ScannerStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isSuccess, bool isError, String errorMessage, bool isCameraOpen, String scannedCode, String? capturedImagePath, ScanResult? scanResult
});




}
/// @nodoc
class _$ScannerStateCopyWithImpl<$Res>
    implements $ScannerStateCopyWith<$Res> {
  _$ScannerStateCopyWithImpl(this._self, this._then);

  final ScannerState _self;
  final $Res Function(ScannerState) _then;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isSuccess = null,Object? isError = null,Object? errorMessage = null,Object? isCameraOpen = null,Object? scannedCode = null,Object? capturedImagePath = freezed,Object? scanResult = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,isCameraOpen: null == isCameraOpen ? _self.isCameraOpen : isCameraOpen // ignore: cast_nullable_to_non_nullable
as bool,scannedCode: null == scannedCode ? _self.scannedCode : scannedCode // ignore: cast_nullable_to_non_nullable
as String,capturedImagePath: freezed == capturedImagePath ? _self.capturedImagePath : capturedImagePath // ignore: cast_nullable_to_non_nullable
as String?,scanResult: freezed == scanResult ? _self.scanResult : scanResult // ignore: cast_nullable_to_non_nullable
as ScanResult?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScannerState].
extension ScannerStatePatterns on ScannerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScannerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScannerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScannerState value)  $default,){
final _that = this;
switch (_that) {
case _ScannerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScannerState value)?  $default,){
final _that = this;
switch (_that) {
case _ScannerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isSuccess,  bool isError,  String errorMessage,  bool isCameraOpen,  String scannedCode,  String? capturedImagePath,  ScanResult? scanResult)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScannerState() when $default != null:
return $default(_that.isLoading,_that.isSuccess,_that.isError,_that.errorMessage,_that.isCameraOpen,_that.scannedCode,_that.capturedImagePath,_that.scanResult);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isSuccess,  bool isError,  String errorMessage,  bool isCameraOpen,  String scannedCode,  String? capturedImagePath,  ScanResult? scanResult)  $default,) {final _that = this;
switch (_that) {
case _ScannerState():
return $default(_that.isLoading,_that.isSuccess,_that.isError,_that.errorMessage,_that.isCameraOpen,_that.scannedCode,_that.capturedImagePath,_that.scanResult);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isSuccess,  bool isError,  String errorMessage,  bool isCameraOpen,  String scannedCode,  String? capturedImagePath,  ScanResult? scanResult)?  $default,) {final _that = this;
switch (_that) {
case _ScannerState() when $default != null:
return $default(_that.isLoading,_that.isSuccess,_that.isError,_that.errorMessage,_that.isCameraOpen,_that.scannedCode,_that.capturedImagePath,_that.scanResult);case _:
  return null;

}
}

}

/// @nodoc


class _ScannerState implements ScannerState {
  const _ScannerState({this.isLoading = false, this.isSuccess = false, this.isError = false, this.errorMessage = '', this.isCameraOpen = false, this.scannedCode = '', this.capturedImagePath, this.scanResult});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSuccess;
@override@JsonKey() final  bool isError;
@override@JsonKey() final  String errorMessage;
@override@JsonKey() final  bool isCameraOpen;
@override@JsonKey() final  String scannedCode;
@override final  String? capturedImagePath;
@override final  ScanResult? scanResult;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScannerStateCopyWith<_ScannerState> get copyWith => __$ScannerStateCopyWithImpl<_ScannerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScannerState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isCameraOpen, isCameraOpen) || other.isCameraOpen == isCameraOpen)&&(identical(other.scannedCode, scannedCode) || other.scannedCode == scannedCode)&&(identical(other.capturedImagePath, capturedImagePath) || other.capturedImagePath == capturedImagePath)&&(identical(other.scanResult, scanResult) || other.scanResult == scanResult));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isSuccess,isError,errorMessage,isCameraOpen,scannedCode,capturedImagePath,scanResult);

@override
String toString() {
  return 'ScannerState(isLoading: $isLoading, isSuccess: $isSuccess, isError: $isError, errorMessage: $errorMessage, isCameraOpen: $isCameraOpen, scannedCode: $scannedCode, capturedImagePath: $capturedImagePath, scanResult: $scanResult)';
}


}

/// @nodoc
abstract mixin class _$ScannerStateCopyWith<$Res> implements $ScannerStateCopyWith<$Res> {
  factory _$ScannerStateCopyWith(_ScannerState value, $Res Function(_ScannerState) _then) = __$ScannerStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isSuccess, bool isError, String errorMessage, bool isCameraOpen, String scannedCode, String? capturedImagePath, ScanResult? scanResult
});




}
/// @nodoc
class __$ScannerStateCopyWithImpl<$Res>
    implements _$ScannerStateCopyWith<$Res> {
  __$ScannerStateCopyWithImpl(this._self, this._then);

  final _ScannerState _self;
  final $Res Function(_ScannerState) _then;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isSuccess = null,Object? isError = null,Object? errorMessage = null,Object? isCameraOpen = null,Object? scannedCode = null,Object? capturedImagePath = freezed,Object? scanResult = freezed,}) {
  return _then(_ScannerState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,isCameraOpen: null == isCameraOpen ? _self.isCameraOpen : isCameraOpen // ignore: cast_nullable_to_non_nullable
as bool,scannedCode: null == scannedCode ? _self.scannedCode : scannedCode // ignore: cast_nullable_to_non_nullable
as String,capturedImagePath: freezed == capturedImagePath ? _self.capturedImagePath : capturedImagePath // ignore: cast_nullable_to_non_nullable
as String?,scanResult: freezed == scanResult ? _self.scanResult : scanResult // ignore: cast_nullable_to_non_nullable
as ScanResult?,
  ));
}


}

// dart format on
