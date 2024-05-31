// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GalleryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getGalleries,
    required TResult Function(int id) getGalleryDetail,
    required TResult Function() refreshGalleries,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getGalleries,
    TResult? Function(int id)? getGalleryDetail,
    TResult? Function()? refreshGalleries,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getGalleries,
    TResult Function(int id)? getGalleryDetail,
    TResult Function()? refreshGalleries,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetGalleries value) getGalleries,
    required TResult Function(_GetGalleryDetail value) getGalleryDetail,
    required TResult Function(_RefreshGalleries value) refreshGalleries,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetGalleries value)? getGalleries,
    TResult? Function(_GetGalleryDetail value)? getGalleryDetail,
    TResult? Function(_RefreshGalleries value)? refreshGalleries,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetGalleries value)? getGalleries,
    TResult Function(_GetGalleryDetail value)? getGalleryDetail,
    TResult Function(_RefreshGalleries value)? refreshGalleries,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryEventCopyWith<$Res> {
  factory $GalleryEventCopyWith(
          GalleryEvent value, $Res Function(GalleryEvent) then) =
      _$GalleryEventCopyWithImpl<$Res, GalleryEvent>;
}

/// @nodoc
class _$GalleryEventCopyWithImpl<$Res, $Val extends GalleryEvent>
    implements $GalleryEventCopyWith<$Res> {
  _$GalleryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$GalleryEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'GalleryEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getGalleries,
    required TResult Function(int id) getGalleryDetail,
    required TResult Function() refreshGalleries,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getGalleries,
    TResult? Function(int id)? getGalleryDetail,
    TResult? Function()? refreshGalleries,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getGalleries,
    TResult Function(int id)? getGalleryDetail,
    TResult Function()? refreshGalleries,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetGalleries value) getGalleries,
    required TResult Function(_GetGalleryDetail value) getGalleryDetail,
    required TResult Function(_RefreshGalleries value) refreshGalleries,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetGalleries value)? getGalleries,
    TResult? Function(_GetGalleryDetail value)? getGalleryDetail,
    TResult? Function(_RefreshGalleries value)? refreshGalleries,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetGalleries value)? getGalleries,
    TResult Function(_GetGalleryDetail value)? getGalleryDetail,
    TResult Function(_RefreshGalleries value)? refreshGalleries,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements GalleryEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetGalleriesImplCopyWith<$Res> {
  factory _$$GetGalleriesImplCopyWith(
          _$GetGalleriesImpl value, $Res Function(_$GetGalleriesImpl) then) =
      __$$GetGalleriesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetGalleriesImplCopyWithImpl<$Res>
    extends _$GalleryEventCopyWithImpl<$Res, _$GetGalleriesImpl>
    implements _$$GetGalleriesImplCopyWith<$Res> {
  __$$GetGalleriesImplCopyWithImpl(
      _$GetGalleriesImpl _value, $Res Function(_$GetGalleriesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetGalleriesImpl implements GetGalleries {
  const _$GetGalleriesImpl();

  @override
  String toString() {
    return 'GalleryEvent.getGalleries()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetGalleriesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getGalleries,
    required TResult Function(int id) getGalleryDetail,
    required TResult Function() refreshGalleries,
  }) {
    return getGalleries();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getGalleries,
    TResult? Function(int id)? getGalleryDetail,
    TResult? Function()? refreshGalleries,
  }) {
    return getGalleries?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getGalleries,
    TResult Function(int id)? getGalleryDetail,
    TResult Function()? refreshGalleries,
    required TResult orElse(),
  }) {
    if (getGalleries != null) {
      return getGalleries();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetGalleries value) getGalleries,
    required TResult Function(_GetGalleryDetail value) getGalleryDetail,
    required TResult Function(_RefreshGalleries value) refreshGalleries,
  }) {
    return getGalleries(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetGalleries value)? getGalleries,
    TResult? Function(_GetGalleryDetail value)? getGalleryDetail,
    TResult? Function(_RefreshGalleries value)? refreshGalleries,
  }) {
    return getGalleries?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetGalleries value)? getGalleries,
    TResult Function(_GetGalleryDetail value)? getGalleryDetail,
    TResult Function(_RefreshGalleries value)? refreshGalleries,
    required TResult orElse(),
  }) {
    if (getGalleries != null) {
      return getGalleries(this);
    }
    return orElse();
  }
}

abstract class GetGalleries implements GalleryEvent {
  const factory GetGalleries() = _$GetGalleriesImpl;
}

/// @nodoc
abstract class _$$GetGalleryDetailImplCopyWith<$Res> {
  factory _$$GetGalleryDetailImplCopyWith(_$GetGalleryDetailImpl value,
          $Res Function(_$GetGalleryDetailImpl) then) =
      __$$GetGalleryDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$GetGalleryDetailImplCopyWithImpl<$Res>
    extends _$GalleryEventCopyWithImpl<$Res, _$GetGalleryDetailImpl>
    implements _$$GetGalleryDetailImplCopyWith<$Res> {
  __$$GetGalleryDetailImplCopyWithImpl(_$GetGalleryDetailImpl _value,
      $Res Function(_$GetGalleryDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetGalleryDetailImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetGalleryDetailImpl implements _GetGalleryDetail {
  const _$GetGalleryDetailImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'GalleryEvent.getGalleryDetail(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetGalleryDetailImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetGalleryDetailImplCopyWith<_$GetGalleryDetailImpl> get copyWith =>
      __$$GetGalleryDetailImplCopyWithImpl<_$GetGalleryDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getGalleries,
    required TResult Function(int id) getGalleryDetail,
    required TResult Function() refreshGalleries,
  }) {
    return getGalleryDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getGalleries,
    TResult? Function(int id)? getGalleryDetail,
    TResult? Function()? refreshGalleries,
  }) {
    return getGalleryDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getGalleries,
    TResult Function(int id)? getGalleryDetail,
    TResult Function()? refreshGalleries,
    required TResult orElse(),
  }) {
    if (getGalleryDetail != null) {
      return getGalleryDetail(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetGalleries value) getGalleries,
    required TResult Function(_GetGalleryDetail value) getGalleryDetail,
    required TResult Function(_RefreshGalleries value) refreshGalleries,
  }) {
    return getGalleryDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetGalleries value)? getGalleries,
    TResult? Function(_GetGalleryDetail value)? getGalleryDetail,
    TResult? Function(_RefreshGalleries value)? refreshGalleries,
  }) {
    return getGalleryDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetGalleries value)? getGalleries,
    TResult Function(_GetGalleryDetail value)? getGalleryDetail,
    TResult Function(_RefreshGalleries value)? refreshGalleries,
    required TResult orElse(),
  }) {
    if (getGalleryDetail != null) {
      return getGalleryDetail(this);
    }
    return orElse();
  }
}

abstract class _GetGalleryDetail implements GalleryEvent {
  const factory _GetGalleryDetail(final int id) = _$GetGalleryDetailImpl;

  int get id;
  @JsonKey(ignore: true)
  _$$GetGalleryDetailImplCopyWith<_$GetGalleryDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshGalleriesImplCopyWith<$Res> {
  factory _$$RefreshGalleriesImplCopyWith(_$RefreshGalleriesImpl value,
          $Res Function(_$RefreshGalleriesImpl) then) =
      __$$RefreshGalleriesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshGalleriesImplCopyWithImpl<$Res>
    extends _$GalleryEventCopyWithImpl<$Res, _$RefreshGalleriesImpl>
    implements _$$RefreshGalleriesImplCopyWith<$Res> {
  __$$RefreshGalleriesImplCopyWithImpl(_$RefreshGalleriesImpl _value,
      $Res Function(_$RefreshGalleriesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshGalleriesImpl implements _RefreshGalleries {
  const _$RefreshGalleriesImpl();

  @override
  String toString() {
    return 'GalleryEvent.refreshGalleries()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshGalleriesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getGalleries,
    required TResult Function(int id) getGalleryDetail,
    required TResult Function() refreshGalleries,
  }) {
    return refreshGalleries();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getGalleries,
    TResult? Function(int id)? getGalleryDetail,
    TResult? Function()? refreshGalleries,
  }) {
    return refreshGalleries?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getGalleries,
    TResult Function(int id)? getGalleryDetail,
    TResult Function()? refreshGalleries,
    required TResult orElse(),
  }) {
    if (refreshGalleries != null) {
      return refreshGalleries();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetGalleries value) getGalleries,
    required TResult Function(_GetGalleryDetail value) getGalleryDetail,
    required TResult Function(_RefreshGalleries value) refreshGalleries,
  }) {
    return refreshGalleries(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetGalleries value)? getGalleries,
    TResult? Function(_GetGalleryDetail value)? getGalleryDetail,
    TResult? Function(_RefreshGalleries value)? refreshGalleries,
  }) {
    return refreshGalleries?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetGalleries value)? getGalleries,
    TResult Function(_GetGalleryDetail value)? getGalleryDetail,
    TResult Function(_RefreshGalleries value)? refreshGalleries,
    required TResult orElse(),
  }) {
    if (refreshGalleries != null) {
      return refreshGalleries(this);
    }
    return orElse();
  }
}

abstract class _RefreshGalleries implements GalleryEvent {
  const factory _RefreshGalleries() = _$RefreshGalleriesImpl;
}

/// @nodoc
mixin _$GalleryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<GalleryResponseModel> galleries) loadSuccess,
    required TResult Function(String error) loadFailure,
    required TResult Function(GalleryResponseModel galleryDetail)
        detailLoadSuccess,
    required TResult Function(String error) detailLoadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(List<GalleryResponseModel> galleries)? loadSuccess,
    TResult? Function(String error)? loadFailure,
    TResult? Function(GalleryResponseModel galleryDetail)? detailLoadSuccess,
    TResult? Function(String error)? detailLoadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<GalleryResponseModel> galleries)? loadSuccess,
    TResult Function(String error)? loadFailure,
    TResult Function(GalleryResponseModel galleryDetail)? detailLoadSuccess,
    TResult Function(String error)? detailLoadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(LoadInProgress value) loadInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
    required TResult Function(DetailLoadSuccess value) detailLoadSuccess,
    required TResult Function(DetailLoadFailure value) detailLoadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadInProgress value)? loadInProgress,
    TResult? Function(LoadSuccess value)? loadSuccess,
    TResult? Function(LoadFailure value)? loadFailure,
    TResult? Function(DetailLoadSuccess value)? detailLoadSuccess,
    TResult? Function(DetailLoadFailure value)? detailLoadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    TResult Function(DetailLoadSuccess value)? detailLoadSuccess,
    TResult Function(DetailLoadFailure value)? detailLoadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryStateCopyWith<$Res> {
  factory $GalleryStateCopyWith(
          GalleryState value, $Res Function(GalleryState) then) =
      _$GalleryStateCopyWithImpl<$Res, GalleryState>;
}

/// @nodoc
class _$GalleryStateCopyWithImpl<$Res, $Val extends GalleryState>
    implements $GalleryStateCopyWith<$Res> {
  _$GalleryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'GalleryState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<GalleryResponseModel> galleries) loadSuccess,
    required TResult Function(String error) loadFailure,
    required TResult Function(GalleryResponseModel galleryDetail)
        detailLoadSuccess,
    required TResult Function(String error) detailLoadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(List<GalleryResponseModel> galleries)? loadSuccess,
    TResult? Function(String error)? loadFailure,
    TResult? Function(GalleryResponseModel galleryDetail)? detailLoadSuccess,
    TResult? Function(String error)? detailLoadFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<GalleryResponseModel> galleries)? loadSuccess,
    TResult Function(String error)? loadFailure,
    TResult Function(GalleryResponseModel galleryDetail)? detailLoadSuccess,
    TResult Function(String error)? detailLoadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(LoadInProgress value) loadInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
    required TResult Function(DetailLoadSuccess value) detailLoadSuccess,
    required TResult Function(DetailLoadFailure value) detailLoadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadInProgress value)? loadInProgress,
    TResult? Function(LoadSuccess value)? loadSuccess,
    TResult? Function(LoadFailure value)? loadFailure,
    TResult? Function(DetailLoadSuccess value)? detailLoadSuccess,
    TResult? Function(DetailLoadFailure value)? detailLoadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    TResult Function(DetailLoadSuccess value)? detailLoadSuccess,
    TResult Function(DetailLoadFailure value)? detailLoadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements GalleryState {
  const factory Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadInProgressImplCopyWith<$Res> {
  factory _$$LoadInProgressImplCopyWith(_$LoadInProgressImpl value,
          $Res Function(_$LoadInProgressImpl) then) =
      __$$LoadInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadInProgressImplCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$LoadInProgressImpl>
    implements _$$LoadInProgressImplCopyWith<$Res> {
  __$$LoadInProgressImplCopyWithImpl(
      _$LoadInProgressImpl _value, $Res Function(_$LoadInProgressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadInProgressImpl implements LoadInProgress {
  const _$LoadInProgressImpl();

  @override
  String toString() {
    return 'GalleryState.loadInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<GalleryResponseModel> galleries) loadSuccess,
    required TResult Function(String error) loadFailure,
    required TResult Function(GalleryResponseModel galleryDetail)
        detailLoadSuccess,
    required TResult Function(String error) detailLoadFailure,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(List<GalleryResponseModel> galleries)? loadSuccess,
    TResult? Function(String error)? loadFailure,
    TResult? Function(GalleryResponseModel galleryDetail)? detailLoadSuccess,
    TResult? Function(String error)? detailLoadFailure,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<GalleryResponseModel> galleries)? loadSuccess,
    TResult Function(String error)? loadFailure,
    TResult Function(GalleryResponseModel galleryDetail)? detailLoadSuccess,
    TResult Function(String error)? detailLoadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(LoadInProgress value) loadInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
    required TResult Function(DetailLoadSuccess value) detailLoadSuccess,
    required TResult Function(DetailLoadFailure value) detailLoadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadInProgress value)? loadInProgress,
    TResult? Function(LoadSuccess value)? loadSuccess,
    TResult? Function(LoadFailure value)? loadFailure,
    TResult? Function(DetailLoadSuccess value)? detailLoadSuccess,
    TResult? Function(DetailLoadFailure value)? detailLoadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    TResult Function(DetailLoadSuccess value)? detailLoadSuccess,
    TResult Function(DetailLoadFailure value)? detailLoadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class LoadInProgress implements GalleryState {
  const factory LoadInProgress() = _$LoadInProgressImpl;
}

/// @nodoc
abstract class _$$LoadSuccessImplCopyWith<$Res> {
  factory _$$LoadSuccessImplCopyWith(
          _$LoadSuccessImpl value, $Res Function(_$LoadSuccessImpl) then) =
      __$$LoadSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<GalleryResponseModel> galleries});
}

/// @nodoc
class __$$LoadSuccessImplCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$LoadSuccessImpl>
    implements _$$LoadSuccessImplCopyWith<$Res> {
  __$$LoadSuccessImplCopyWithImpl(
      _$LoadSuccessImpl _value, $Res Function(_$LoadSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? galleries = null,
  }) {
    return _then(_$LoadSuccessImpl(
      null == galleries
          ? _value._galleries
          : galleries // ignore: cast_nullable_to_non_nullable
              as List<GalleryResponseModel>,
    ));
  }
}

/// @nodoc

class _$LoadSuccessImpl implements LoadSuccess {
  const _$LoadSuccessImpl(final List<GalleryResponseModel> galleries)
      : _galleries = galleries;

  final List<GalleryResponseModel> _galleries;
  @override
  List<GalleryResponseModel> get galleries {
    if (_galleries is EqualUnmodifiableListView) return _galleries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_galleries);
  }

  @override
  String toString() {
    return 'GalleryState.loadSuccess(galleries: $galleries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._galleries, _galleries));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_galleries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSuccessImplCopyWith<_$LoadSuccessImpl> get copyWith =>
      __$$LoadSuccessImplCopyWithImpl<_$LoadSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<GalleryResponseModel> galleries) loadSuccess,
    required TResult Function(String error) loadFailure,
    required TResult Function(GalleryResponseModel galleryDetail)
        detailLoadSuccess,
    required TResult Function(String error) detailLoadFailure,
  }) {
    return loadSuccess(galleries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(List<GalleryResponseModel> galleries)? loadSuccess,
    TResult? Function(String error)? loadFailure,
    TResult? Function(GalleryResponseModel galleryDetail)? detailLoadSuccess,
    TResult? Function(String error)? detailLoadFailure,
  }) {
    return loadSuccess?.call(galleries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<GalleryResponseModel> galleries)? loadSuccess,
    TResult Function(String error)? loadFailure,
    TResult Function(GalleryResponseModel galleryDetail)? detailLoadSuccess,
    TResult Function(String error)? detailLoadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(galleries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(LoadInProgress value) loadInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
    required TResult Function(DetailLoadSuccess value) detailLoadSuccess,
    required TResult Function(DetailLoadFailure value) detailLoadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadInProgress value)? loadInProgress,
    TResult? Function(LoadSuccess value)? loadSuccess,
    TResult? Function(LoadFailure value)? loadFailure,
    TResult? Function(DetailLoadSuccess value)? detailLoadSuccess,
    TResult? Function(DetailLoadFailure value)? detailLoadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    TResult Function(DetailLoadSuccess value)? detailLoadSuccess,
    TResult Function(DetailLoadFailure value)? detailLoadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class LoadSuccess implements GalleryState {
  const factory LoadSuccess(final List<GalleryResponseModel> galleries) =
      _$LoadSuccessImpl;

  List<GalleryResponseModel> get galleries;
  @JsonKey(ignore: true)
  _$$LoadSuccessImplCopyWith<_$LoadSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadFailureImplCopyWith<$Res> {
  factory _$$LoadFailureImplCopyWith(
          _$LoadFailureImpl value, $Res Function(_$LoadFailureImpl) then) =
      __$$LoadFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$LoadFailureImplCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$LoadFailureImpl>
    implements _$$LoadFailureImplCopyWith<$Res> {
  __$$LoadFailureImplCopyWithImpl(
      _$LoadFailureImpl _value, $Res Function(_$LoadFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$LoadFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadFailureImpl implements LoadFailure {
  const _$LoadFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'GalleryState.loadFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadFailureImplCopyWith<_$LoadFailureImpl> get copyWith =>
      __$$LoadFailureImplCopyWithImpl<_$LoadFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<GalleryResponseModel> galleries) loadSuccess,
    required TResult Function(String error) loadFailure,
    required TResult Function(GalleryResponseModel galleryDetail)
        detailLoadSuccess,
    required TResult Function(String error) detailLoadFailure,
  }) {
    return loadFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(List<GalleryResponseModel> galleries)? loadSuccess,
    TResult? Function(String error)? loadFailure,
    TResult? Function(GalleryResponseModel galleryDetail)? detailLoadSuccess,
    TResult? Function(String error)? detailLoadFailure,
  }) {
    return loadFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<GalleryResponseModel> galleries)? loadSuccess,
    TResult Function(String error)? loadFailure,
    TResult Function(GalleryResponseModel galleryDetail)? detailLoadSuccess,
    TResult Function(String error)? detailLoadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(LoadInProgress value) loadInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
    required TResult Function(DetailLoadSuccess value) detailLoadSuccess,
    required TResult Function(DetailLoadFailure value) detailLoadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadInProgress value)? loadInProgress,
    TResult? Function(LoadSuccess value)? loadSuccess,
    TResult? Function(LoadFailure value)? loadFailure,
    TResult? Function(DetailLoadSuccess value)? detailLoadSuccess,
    TResult? Function(DetailLoadFailure value)? detailLoadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    TResult Function(DetailLoadSuccess value)? detailLoadSuccess,
    TResult Function(DetailLoadFailure value)? detailLoadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class LoadFailure implements GalleryState {
  const factory LoadFailure(final String error) = _$LoadFailureImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$LoadFailureImplCopyWith<_$LoadFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailLoadSuccessImplCopyWith<$Res> {
  factory _$$DetailLoadSuccessImplCopyWith(_$DetailLoadSuccessImpl value,
          $Res Function(_$DetailLoadSuccessImpl) then) =
      __$$DetailLoadSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GalleryResponseModel galleryDetail});
}

/// @nodoc
class __$$DetailLoadSuccessImplCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$DetailLoadSuccessImpl>
    implements _$$DetailLoadSuccessImplCopyWith<$Res> {
  __$$DetailLoadSuccessImplCopyWithImpl(_$DetailLoadSuccessImpl _value,
      $Res Function(_$DetailLoadSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? galleryDetail = null,
  }) {
    return _then(_$DetailLoadSuccessImpl(
      null == galleryDetail
          ? _value.galleryDetail
          : galleryDetail // ignore: cast_nullable_to_non_nullable
              as GalleryResponseModel,
    ));
  }
}

/// @nodoc

class _$DetailLoadSuccessImpl implements DetailLoadSuccess {
  const _$DetailLoadSuccessImpl(this.galleryDetail);

  @override
  final GalleryResponseModel galleryDetail;

  @override
  String toString() {
    return 'GalleryState.detailLoadSuccess(galleryDetail: $galleryDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailLoadSuccessImpl &&
            (identical(other.galleryDetail, galleryDetail) ||
                other.galleryDetail == galleryDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, galleryDetail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailLoadSuccessImplCopyWith<_$DetailLoadSuccessImpl> get copyWith =>
      __$$DetailLoadSuccessImplCopyWithImpl<_$DetailLoadSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<GalleryResponseModel> galleries) loadSuccess,
    required TResult Function(String error) loadFailure,
    required TResult Function(GalleryResponseModel galleryDetail)
        detailLoadSuccess,
    required TResult Function(String error) detailLoadFailure,
  }) {
    return detailLoadSuccess(galleryDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(List<GalleryResponseModel> galleries)? loadSuccess,
    TResult? Function(String error)? loadFailure,
    TResult? Function(GalleryResponseModel galleryDetail)? detailLoadSuccess,
    TResult? Function(String error)? detailLoadFailure,
  }) {
    return detailLoadSuccess?.call(galleryDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<GalleryResponseModel> galleries)? loadSuccess,
    TResult Function(String error)? loadFailure,
    TResult Function(GalleryResponseModel galleryDetail)? detailLoadSuccess,
    TResult Function(String error)? detailLoadFailure,
    required TResult orElse(),
  }) {
    if (detailLoadSuccess != null) {
      return detailLoadSuccess(galleryDetail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(LoadInProgress value) loadInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
    required TResult Function(DetailLoadSuccess value) detailLoadSuccess,
    required TResult Function(DetailLoadFailure value) detailLoadFailure,
  }) {
    return detailLoadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadInProgress value)? loadInProgress,
    TResult? Function(LoadSuccess value)? loadSuccess,
    TResult? Function(LoadFailure value)? loadFailure,
    TResult? Function(DetailLoadSuccess value)? detailLoadSuccess,
    TResult? Function(DetailLoadFailure value)? detailLoadFailure,
  }) {
    return detailLoadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    TResult Function(DetailLoadSuccess value)? detailLoadSuccess,
    TResult Function(DetailLoadFailure value)? detailLoadFailure,
    required TResult orElse(),
  }) {
    if (detailLoadSuccess != null) {
      return detailLoadSuccess(this);
    }
    return orElse();
  }
}

abstract class DetailLoadSuccess implements GalleryState {
  const factory DetailLoadSuccess(final GalleryResponseModel galleryDetail) =
      _$DetailLoadSuccessImpl;

  GalleryResponseModel get galleryDetail;
  @JsonKey(ignore: true)
  _$$DetailLoadSuccessImplCopyWith<_$DetailLoadSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailLoadFailureImplCopyWith<$Res> {
  factory _$$DetailLoadFailureImplCopyWith(_$DetailLoadFailureImpl value,
          $Res Function(_$DetailLoadFailureImpl) then) =
      __$$DetailLoadFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$DetailLoadFailureImplCopyWithImpl<$Res>
    extends _$GalleryStateCopyWithImpl<$Res, _$DetailLoadFailureImpl>
    implements _$$DetailLoadFailureImplCopyWith<$Res> {
  __$$DetailLoadFailureImplCopyWithImpl(_$DetailLoadFailureImpl _value,
      $Res Function(_$DetailLoadFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$DetailLoadFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DetailLoadFailureImpl implements DetailLoadFailure {
  const _$DetailLoadFailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'GalleryState.detailLoadFailure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailLoadFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailLoadFailureImplCopyWith<_$DetailLoadFailureImpl> get copyWith =>
      __$$DetailLoadFailureImplCopyWithImpl<_$DetailLoadFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<GalleryResponseModel> galleries) loadSuccess,
    required TResult Function(String error) loadFailure,
    required TResult Function(GalleryResponseModel galleryDetail)
        detailLoadSuccess,
    required TResult Function(String error) detailLoadFailure,
  }) {
    return detailLoadFailure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(List<GalleryResponseModel> galleries)? loadSuccess,
    TResult? Function(String error)? loadFailure,
    TResult? Function(GalleryResponseModel galleryDetail)? detailLoadSuccess,
    TResult? Function(String error)? detailLoadFailure,
  }) {
    return detailLoadFailure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<GalleryResponseModel> galleries)? loadSuccess,
    TResult Function(String error)? loadFailure,
    TResult Function(GalleryResponseModel galleryDetail)? detailLoadSuccess,
    TResult Function(String error)? detailLoadFailure,
    required TResult orElse(),
  }) {
    if (detailLoadFailure != null) {
      return detailLoadFailure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(LoadInProgress value) loadInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
    required TResult Function(DetailLoadSuccess value) detailLoadSuccess,
    required TResult Function(DetailLoadFailure value) detailLoadFailure,
  }) {
    return detailLoadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LoadInProgress value)? loadInProgress,
    TResult? Function(LoadSuccess value)? loadSuccess,
    TResult? Function(LoadFailure value)? loadFailure,
    TResult? Function(DetailLoadSuccess value)? detailLoadSuccess,
    TResult? Function(DetailLoadFailure value)? detailLoadFailure,
  }) {
    return detailLoadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LoadInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    TResult Function(DetailLoadSuccess value)? detailLoadSuccess,
    TResult Function(DetailLoadFailure value)? detailLoadFailure,
    required TResult orElse(),
  }) {
    if (detailLoadFailure != null) {
      return detailLoadFailure(this);
    }
    return orElse();
  }
}

abstract class DetailLoadFailure implements GalleryState {
  const factory DetailLoadFailure(final String error) = _$DetailLoadFailureImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$DetailLoadFailureImplCopyWith<_$DetailLoadFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
