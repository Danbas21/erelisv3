// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

 String get id; String get email; String? get nombre;// Valor por defecto para evitar nulls
 String? get apellido; String? get telefono; String? get curp; String? get escuela; String? get grado; String? get displayName;// Este puede ser nulo
 String? get photoUrl;// Este puede ser nulo
 String? get rol; bool get isEmailVerified; DateTime? get createdAt; DateTime? get lastLoginAt;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.apellido, apellido) || other.apellido == apellido)&&(identical(other.telefono, telefono) || other.telefono == telefono)&&(identical(other.curp, curp) || other.curp == curp)&&(identical(other.escuela, escuela) || other.escuela == escuela)&&(identical(other.grado, grado) || other.grado == grado)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.rol, rol) || other.rol == rol)&&(identical(other.isEmailVerified, isEmailVerified) || other.isEmailVerified == isEmailVerified)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,nombre,apellido,telefono,curp,escuela,grado,displayName,photoUrl,rol,isEmailVerified,createdAt,lastLoginAt);

@override
String toString() {
  return 'UserModel(id: $id, email: $email, nombre: $nombre, apellido: $apellido, telefono: $telefono, curp: $curp, escuela: $escuela, grado: $grado, displayName: $displayName, photoUrl: $photoUrl, rol: $rol, isEmailVerified: $isEmailVerified, createdAt: $createdAt, lastLoginAt: $lastLoginAt)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String id, String email, String? nombre, String? apellido, String? telefono, String? curp, String? escuela, String? grado, String? displayName, String? photoUrl, String? rol, bool isEmailVerified, DateTime? createdAt, DateTime? lastLoginAt
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? nombre = freezed,Object? apellido = freezed,Object? telefono = freezed,Object? curp = freezed,Object? escuela = freezed,Object? grado = freezed,Object? displayName = freezed,Object? photoUrl = freezed,Object? rol = freezed,Object? isEmailVerified = null,Object? createdAt = freezed,Object? lastLoginAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,nombre: freezed == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String?,apellido: freezed == apellido ? _self.apellido : apellido // ignore: cast_nullable_to_non_nullable
as String?,telefono: freezed == telefono ? _self.telefono : telefono // ignore: cast_nullable_to_non_nullable
as String?,curp: freezed == curp ? _self.curp : curp // ignore: cast_nullable_to_non_nullable
as String?,escuela: freezed == escuela ? _self.escuela : escuela // ignore: cast_nullable_to_non_nullable
as String?,grado: freezed == grado ? _self.grado : grado // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,rol: freezed == rol ? _self.rol : rol // ignore: cast_nullable_to_non_nullable
as String?,isEmailVerified: null == isEmailVerified ? _self.isEmailVerified : isEmailVerified // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserModel extends UserModel {
  const _UserModel({required this.id, required this.email, this.nombre, this.apellido, this.telefono, this.curp, this.escuela, this.grado, this.displayName, this.photoUrl, this.rol, this.isEmailVerified = false, this.createdAt, this.lastLoginAt}): super._();
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  String id;
@override final  String email;
@override final  String? nombre;
// Valor por defecto para evitar nulls
@override final  String? apellido;
@override final  String? telefono;
@override final  String? curp;
@override final  String? escuela;
@override final  String? grado;
@override final  String? displayName;
// Este puede ser nulo
@override final  String? photoUrl;
// Este puede ser nulo
@override final  String? rol;
@override@JsonKey() final  bool isEmailVerified;
@override final  DateTime? createdAt;
@override final  DateTime? lastLoginAt;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.nombre, nombre) || other.nombre == nombre)&&(identical(other.apellido, apellido) || other.apellido == apellido)&&(identical(other.telefono, telefono) || other.telefono == telefono)&&(identical(other.curp, curp) || other.curp == curp)&&(identical(other.escuela, escuela) || other.escuela == escuela)&&(identical(other.grado, grado) || other.grado == grado)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.rol, rol) || other.rol == rol)&&(identical(other.isEmailVerified, isEmailVerified) || other.isEmailVerified == isEmailVerified)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,nombre,apellido,telefono,curp,escuela,grado,displayName,photoUrl,rol,isEmailVerified,createdAt,lastLoginAt);

@override
String toString() {
  return 'UserModel(id: $id, email: $email, nombre: $nombre, apellido: $apellido, telefono: $telefono, curp: $curp, escuela: $escuela, grado: $grado, displayName: $displayName, photoUrl: $photoUrl, rol: $rol, isEmailVerified: $isEmailVerified, createdAt: $createdAt, lastLoginAt: $lastLoginAt)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String? nombre, String? apellido, String? telefono, String? curp, String? escuela, String? grado, String? displayName, String? photoUrl, String? rol, bool isEmailVerified, DateTime? createdAt, DateTime? lastLoginAt
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? nombre = freezed,Object? apellido = freezed,Object? telefono = freezed,Object? curp = freezed,Object? escuela = freezed,Object? grado = freezed,Object? displayName = freezed,Object? photoUrl = freezed,Object? rol = freezed,Object? isEmailVerified = null,Object? createdAt = freezed,Object? lastLoginAt = freezed,}) {
  return _then(_UserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,nombre: freezed == nombre ? _self.nombre : nombre // ignore: cast_nullable_to_non_nullable
as String?,apellido: freezed == apellido ? _self.apellido : apellido // ignore: cast_nullable_to_non_nullable
as String?,telefono: freezed == telefono ? _self.telefono : telefono // ignore: cast_nullable_to_non_nullable
as String?,curp: freezed == curp ? _self.curp : curp // ignore: cast_nullable_to_non_nullable
as String?,escuela: freezed == escuela ? _self.escuela : escuela // ignore: cast_nullable_to_non_nullable
as String?,grado: freezed == grado ? _self.grado : grado // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,rol: freezed == rol ? _self.rol : rol // ignore: cast_nullable_to_non_nullable
as String?,isEmailVerified: null == isEmailVerified ? _self.isEmailVerified : isEmailVerified // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
