// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'club_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClubModel _$ClubModelFromJson(Map<String, dynamic> json) {
  return _ClubModel.fromJson(json);
}

/// @nodoc
mixin _$ClubModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get instituteName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Map<Social, String> get socials => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @PhoneNumberSerializer()
  PhoneNumber? get phoneNumber => throw _privateConstructorUsedError;
  String get clubLogoURL => throw _privateConstructorUsedError;
  String? get clubBannerURL => throw _privateConstructorUsedError;

  /// Map<ClubPositionModelID, List<Member Email>>
  /// Cannot use clubPositionModel
  /// Since it has issues with freezed (cannot make keys with custom type)
  Map<String, List<String>> get members => throw _privateConstructorUsedError;

  /// Follower Ids
  List<String> get followers => throw _privateConstructorUsedError;
  DateTime? get lastLocalUpdate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClubModelCopyWith<ClubModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubModelCopyWith<$Res> {
  factory $ClubModelCopyWith(ClubModel value, $Res Function(ClubModel) then) =
      _$ClubModelCopyWithImpl<$Res, ClubModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String name,
      String instituteName,
      String description,
      Map<Social, String> socials,
      String email,
      @PhoneNumberSerializer() PhoneNumber? phoneNumber,
      String clubLogoURL,
      String? clubBannerURL,
      Map<String, List<String>> members,
      List<String> followers,
      DateTime? lastLocalUpdate});
}

/// @nodoc
class _$ClubModelCopyWithImpl<$Res, $Val extends ClubModel>
    implements $ClubModelCopyWith<$Res> {
  _$ClubModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? instituteName = null,
    Object? description = null,
    Object? socials = null,
    Object? email = null,
    Object? phoneNumber = freezed,
    Object? clubLogoURL = null,
    Object? clubBannerURL = freezed,
    Object? members = null,
    Object? followers = null,
    Object? lastLocalUpdate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      instituteName: null == instituteName
          ? _value.instituteName
          : instituteName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      socials: null == socials
          ? _value.socials
          : socials // ignore: cast_nullable_to_non_nullable
              as Map<Social, String>,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber?,
      clubLogoURL: null == clubLogoURL
          ? _value.clubLogoURL
          : clubLogoURL // ignore: cast_nullable_to_non_nullable
              as String,
      clubBannerURL: freezed == clubBannerURL
          ? _value.clubBannerURL
          : clubBannerURL // ignore: cast_nullable_to_non_nullable
              as String?,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      followers: null == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastLocalUpdate: freezed == lastLocalUpdate
          ? _value.lastLocalUpdate
          : lastLocalUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClubModelImplCopyWith<$Res>
    implements $ClubModelCopyWith<$Res> {
  factory _$$ClubModelImplCopyWith(
          _$ClubModelImpl value, $Res Function(_$ClubModelImpl) then) =
      __$$ClubModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String name,
      String instituteName,
      String description,
      Map<Social, String> socials,
      String email,
      @PhoneNumberSerializer() PhoneNumber? phoneNumber,
      String clubLogoURL,
      String? clubBannerURL,
      Map<String, List<String>> members,
      List<String> followers,
      DateTime? lastLocalUpdate});
}

/// @nodoc
class __$$ClubModelImplCopyWithImpl<$Res>
    extends _$ClubModelCopyWithImpl<$Res, _$ClubModelImpl>
    implements _$$ClubModelImplCopyWith<$Res> {
  __$$ClubModelImplCopyWithImpl(
      _$ClubModelImpl _value, $Res Function(_$ClubModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? instituteName = null,
    Object? description = null,
    Object? socials = null,
    Object? email = null,
    Object? phoneNumber = freezed,
    Object? clubLogoURL = null,
    Object? clubBannerURL = freezed,
    Object? members = null,
    Object? followers = null,
    Object? lastLocalUpdate = freezed,
  }) {
    return _then(_$ClubModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      instituteName: null == instituteName
          ? _value.instituteName
          : instituteName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      socials: null == socials
          ? _value._socials
          : socials // ignore: cast_nullable_to_non_nullable
              as Map<Social, String>,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber?,
      clubLogoURL: null == clubLogoURL
          ? _value.clubLogoURL
          : clubLogoURL // ignore: cast_nullable_to_non_nullable
              as String,
      clubBannerURL: freezed == clubBannerURL
          ? _value.clubBannerURL
          : clubBannerURL // ignore: cast_nullable_to_non_nullable
              as String?,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      followers: null == followers
          ? _value._followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastLocalUpdate: freezed == lastLocalUpdate
          ? _value.lastLocalUpdate
          : lastLocalUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClubModelImpl extends _ClubModel {
  const _$ClubModelImpl(
      {@JsonKey(name: '_id') this.id,
      required this.name,
      required this.instituteName,
      required this.description,
      final Map<Social, String> socials = const {},
      required this.email,
      @PhoneNumberSerializer() this.phoneNumber,
      required this.clubLogoURL,
      this.clubBannerURL,
      required final Map<String, List<String>> members,
      final List<String> followers = const [],
      this.lastLocalUpdate})
      : _socials = socials,
        _members = members,
        _followers = followers,
        super._();

  factory _$ClubModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClubModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String name;
  @override
  final String instituteName;
  @override
  final String description;
  final Map<Social, String> _socials;
  @override
  @JsonKey()
  Map<Social, String> get socials {
    if (_socials is EqualUnmodifiableMapView) return _socials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_socials);
  }

  @override
  final String email;
  @override
  @PhoneNumberSerializer()
  final PhoneNumber? phoneNumber;
  @override
  final String clubLogoURL;
  @override
  final String? clubBannerURL;

  /// Map<ClubPositionModelID, List<Member Email>>
  /// Cannot use clubPositionModel
  /// Since it has issues with freezed (cannot make keys with custom type)
  final Map<String, List<String>> _members;

  /// Map<ClubPositionModelID, List<Member Email>>
  /// Cannot use clubPositionModel
  /// Since it has issues with freezed (cannot make keys with custom type)
  @override
  Map<String, List<String>> get members {
    if (_members is EqualUnmodifiableMapView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_members);
  }

  /// Follower Ids
  final List<String> _followers;

  /// Follower Ids
  @override
  @JsonKey()
  List<String> get followers {
    if (_followers is EqualUnmodifiableListView) return _followers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followers);
  }

  @override
  final DateTime? lastLocalUpdate;

  @override
  String toString() {
    return 'ClubModel(id: $id, name: $name, instituteName: $instituteName, description: $description, socials: $socials, email: $email, phoneNumber: $phoneNumber, clubLogoURL: $clubLogoURL, clubBannerURL: $clubBannerURL, members: $members, followers: $followers, lastLocalUpdate: $lastLocalUpdate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClubModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.instituteName, instituteName) ||
                other.instituteName == instituteName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._socials, _socials) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.clubLogoURL, clubLogoURL) ||
                other.clubLogoURL == clubLogoURL) &&
            (identical(other.clubBannerURL, clubBannerURL) ||
                other.clubBannerURL == clubBannerURL) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality()
                .equals(other._followers, _followers) &&
            (identical(other.lastLocalUpdate, lastLocalUpdate) ||
                other.lastLocalUpdate == lastLocalUpdate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      instituteName,
      description,
      const DeepCollectionEquality().hash(_socials),
      email,
      phoneNumber,
      clubLogoURL,
      clubBannerURL,
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(_followers),
      lastLocalUpdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClubModelImplCopyWith<_$ClubModelImpl> get copyWith =>
      __$$ClubModelImplCopyWithImpl<_$ClubModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClubModelImplToJson(
      this,
    );
  }
}

abstract class _ClubModel extends ClubModel {
  const factory _ClubModel(
      {@JsonKey(name: '_id') final String? id,
      required final String name,
      required final String instituteName,
      required final String description,
      final Map<Social, String> socials,
      required final String email,
      @PhoneNumberSerializer() final PhoneNumber? phoneNumber,
      required final String clubLogoURL,
      final String? clubBannerURL,
      required final Map<String, List<String>> members,
      final List<String> followers,
      final DateTime? lastLocalUpdate}) = _$ClubModelImpl;
  const _ClubModel._() : super._();

  factory _ClubModel.fromJson(Map<String, dynamic> json) =
      _$ClubModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String get name;
  @override
  String get instituteName;
  @override
  String get description;
  @override
  Map<Social, String> get socials;
  @override
  String get email;
  @override
  @PhoneNumberSerializer()
  PhoneNumber? get phoneNumber;
  @override
  String get clubLogoURL;
  @override
  String? get clubBannerURL;
  @override

  /// Map<ClubPositionModelID, List<Member Email>>
  /// Cannot use clubPositionModel
  /// Since it has issues with freezed (cannot make keys with custom type)
  Map<String, List<String>> get members;
  @override

  /// Follower Ids
  List<String> get followers;
  @override
  DateTime? get lastLocalUpdate;
  @override
  @JsonKey(ignore: true)
  _$$ClubModelImplCopyWith<_$ClubModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
