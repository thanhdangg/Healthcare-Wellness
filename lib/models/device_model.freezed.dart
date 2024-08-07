// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) {
  return _DeviceModel.fromJson(json);
}

/// @nodoc
mixin _$DeviceModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceModelCopyWith<DeviceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceModelCopyWith<$Res> {
  factory $DeviceModelCopyWith(
          DeviceModel value, $Res Function(DeviceModel) then) =
      _$DeviceModelCopyWithImpl<$Res, DeviceModel>;
  @useResult
  $Res call({String? id, String? name, Data? data});

  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$DeviceModelCopyWithImpl<$Res, $Val extends DeviceModel>
    implements $DeviceModelCopyWith<$Res> {
  _$DeviceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeviceModelImplCopyWith<$Res>
    implements $DeviceModelCopyWith<$Res> {
  factory _$$DeviceModelImplCopyWith(
          _$DeviceModelImpl value, $Res Function(_$DeviceModelImpl) then) =
      __$$DeviceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name, Data? data});

  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$DeviceModelImplCopyWithImpl<$Res>
    extends _$DeviceModelCopyWithImpl<$Res, _$DeviceModelImpl>
    implements _$$DeviceModelImplCopyWith<$Res> {
  __$$DeviceModelImplCopyWithImpl(
      _$DeviceModelImpl _value, $Res Function(_$DeviceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? data = freezed,
  }) {
    return _then(_$DeviceModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceModelImpl implements _DeviceModel {
  const _$DeviceModelImpl({this.id, this.name, this.data});

  factory _$DeviceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final Data? data;

  @override
  String toString() {
    return 'DeviceModel(id: $id, name: $name, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceModelImplCopyWith<_$DeviceModelImpl> get copyWith =>
      __$$DeviceModelImplCopyWithImpl<_$DeviceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceModelImplToJson(
      this,
    );
  }
}

abstract class _DeviceModel implements DeviceModel {
  const factory _DeviceModel(
      {final String? id,
      final String? name,
      final Data? data}) = _$DeviceModelImpl;

  factory _DeviceModel.fromJson(Map<String, dynamic> json) =
      _$DeviceModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  Data? get data;
  @override
  @JsonKey(ignore: true)
  _$$DeviceModelImplCopyWith<_$DeviceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  String? get dataColor => throw _privateConstructorUsedError;
  String? get dataCapacity => throw _privateConstructorUsedError;
  int? get capacityGb => throw _privateConstructorUsedError;
  double? get dataPrice => throw _privateConstructorUsedError;
  String? get dataGeneration => throw _privateConstructorUsedError;
  int? get year => throw _privateConstructorUsedError;
  String? get cpuModel => throw _privateConstructorUsedError;
  String? get hardDiskSize => throw _privateConstructorUsedError;
  String? get strapColour => throw _privateConstructorUsedError;
  String? get caseSize => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get capacity => throw _privateConstructorUsedError;
  double? get screenSize => throw _privateConstructorUsedError;
  String? get generation => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {String? dataColor,
      String? dataCapacity,
      int? capacityGb,
      double? dataPrice,
      String? dataGeneration,
      int? year,
      String? cpuModel,
      String? hardDiskSize,
      String? strapColour,
      String? caseSize,
      String? color,
      String? description,
      String? capacity,
      double? screenSize,
      String? generation,
      double? price});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataColor = freezed,
    Object? dataCapacity = freezed,
    Object? capacityGb = freezed,
    Object? dataPrice = freezed,
    Object? dataGeneration = freezed,
    Object? year = freezed,
    Object? cpuModel = freezed,
    Object? hardDiskSize = freezed,
    Object? strapColour = freezed,
    Object? caseSize = freezed,
    Object? color = freezed,
    Object? description = freezed,
    Object? capacity = freezed,
    Object? screenSize = freezed,
    Object? generation = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      dataColor: freezed == dataColor
          ? _value.dataColor
          : dataColor // ignore: cast_nullable_to_non_nullable
              as String?,
      dataCapacity: freezed == dataCapacity
          ? _value.dataCapacity
          : dataCapacity // ignore: cast_nullable_to_non_nullable
              as String?,
      capacityGb: freezed == capacityGb
          ? _value.capacityGb
          : capacityGb // ignore: cast_nullable_to_non_nullable
              as int?,
      dataPrice: freezed == dataPrice
          ? _value.dataPrice
          : dataPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      dataGeneration: freezed == dataGeneration
          ? _value.dataGeneration
          : dataGeneration // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      cpuModel: freezed == cpuModel
          ? _value.cpuModel
          : cpuModel // ignore: cast_nullable_to_non_nullable
              as String?,
      hardDiskSize: freezed == hardDiskSize
          ? _value.hardDiskSize
          : hardDiskSize // ignore: cast_nullable_to_non_nullable
              as String?,
      strapColour: freezed == strapColour
          ? _value.strapColour
          : strapColour // ignore: cast_nullable_to_non_nullable
              as String?,
      caseSize: freezed == caseSize
          ? _value.caseSize
          : caseSize // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as String?,
      screenSize: freezed == screenSize
          ? _value.screenSize
          : screenSize // ignore: cast_nullable_to_non_nullable
              as double?,
      generation: freezed == generation
          ? _value.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? dataColor,
      String? dataCapacity,
      int? capacityGb,
      double? dataPrice,
      String? dataGeneration,
      int? year,
      String? cpuModel,
      String? hardDiskSize,
      String? strapColour,
      String? caseSize,
      String? color,
      String? description,
      String? capacity,
      double? screenSize,
      String? generation,
      double? price});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataColor = freezed,
    Object? dataCapacity = freezed,
    Object? capacityGb = freezed,
    Object? dataPrice = freezed,
    Object? dataGeneration = freezed,
    Object? year = freezed,
    Object? cpuModel = freezed,
    Object? hardDiskSize = freezed,
    Object? strapColour = freezed,
    Object? caseSize = freezed,
    Object? color = freezed,
    Object? description = freezed,
    Object? capacity = freezed,
    Object? screenSize = freezed,
    Object? generation = freezed,
    Object? price = freezed,
  }) {
    return _then(_$DataImpl(
      dataColor: freezed == dataColor
          ? _value.dataColor
          : dataColor // ignore: cast_nullable_to_non_nullable
              as String?,
      dataCapacity: freezed == dataCapacity
          ? _value.dataCapacity
          : dataCapacity // ignore: cast_nullable_to_non_nullable
              as String?,
      capacityGb: freezed == capacityGb
          ? _value.capacityGb
          : capacityGb // ignore: cast_nullable_to_non_nullable
              as int?,
      dataPrice: freezed == dataPrice
          ? _value.dataPrice
          : dataPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      dataGeneration: freezed == dataGeneration
          ? _value.dataGeneration
          : dataGeneration // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      cpuModel: freezed == cpuModel
          ? _value.cpuModel
          : cpuModel // ignore: cast_nullable_to_non_nullable
              as String?,
      hardDiskSize: freezed == hardDiskSize
          ? _value.hardDiskSize
          : hardDiskSize // ignore: cast_nullable_to_non_nullable
              as String?,
      strapColour: freezed == strapColour
          ? _value.strapColour
          : strapColour // ignore: cast_nullable_to_non_nullable
              as String?,
      caseSize: freezed == caseSize
          ? _value.caseSize
          : caseSize // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      capacity: freezed == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as String?,
      screenSize: freezed == screenSize
          ? _value.screenSize
          : screenSize // ignore: cast_nullable_to_non_nullable
              as double?,
      generation: freezed == generation
          ? _value.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl(
      {this.dataColor,
      this.dataCapacity,
      this.capacityGb,
      this.dataPrice,
      this.dataGeneration,
      this.year,
      this.cpuModel,
      this.hardDiskSize,
      this.strapColour,
      this.caseSize,
      this.color,
      this.description,
      this.capacity,
      this.screenSize,
      this.generation,
      this.price});

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  @override
  final String? dataColor;
  @override
  final String? dataCapacity;
  @override
  final int? capacityGb;
  @override
  final double? dataPrice;
  @override
  final String? dataGeneration;
  @override
  final int? year;
  @override
  final String? cpuModel;
  @override
  final String? hardDiskSize;
  @override
  final String? strapColour;
  @override
  final String? caseSize;
  @override
  final String? color;
  @override
  final String? description;
  @override
  final String? capacity;
  @override
  final double? screenSize;
  @override
  final String? generation;
  @override
  final double? price;

  @override
  String toString() {
    return 'Data(dataColor: $dataColor, dataCapacity: $dataCapacity, capacityGb: $capacityGb, dataPrice: $dataPrice, dataGeneration: $dataGeneration, year: $year, cpuModel: $cpuModel, hardDiskSize: $hardDiskSize, strapColour: $strapColour, caseSize: $caseSize, color: $color, description: $description, capacity: $capacity, screenSize: $screenSize, generation: $generation, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.dataColor, dataColor) ||
                other.dataColor == dataColor) &&
            (identical(other.dataCapacity, dataCapacity) ||
                other.dataCapacity == dataCapacity) &&
            (identical(other.capacityGb, capacityGb) ||
                other.capacityGb == capacityGb) &&
            (identical(other.dataPrice, dataPrice) ||
                other.dataPrice == dataPrice) &&
            (identical(other.dataGeneration, dataGeneration) ||
                other.dataGeneration == dataGeneration) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.cpuModel, cpuModel) ||
                other.cpuModel == cpuModel) &&
            (identical(other.hardDiskSize, hardDiskSize) ||
                other.hardDiskSize == hardDiskSize) &&
            (identical(other.strapColour, strapColour) ||
                other.strapColour == strapColour) &&
            (identical(other.caseSize, caseSize) ||
                other.caseSize == caseSize) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.capacity, capacity) ||
                other.capacity == capacity) &&
            (identical(other.screenSize, screenSize) ||
                other.screenSize == screenSize) &&
            (identical(other.generation, generation) ||
                other.generation == generation) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dataColor,
      dataCapacity,
      capacityGb,
      dataPrice,
      dataGeneration,
      year,
      cpuModel,
      hardDiskSize,
      strapColour,
      caseSize,
      color,
      description,
      capacity,
      screenSize,
      generation,
      price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {final String? dataColor,
      final String? dataCapacity,
      final int? capacityGb,
      final double? dataPrice,
      final String? dataGeneration,
      final int? year,
      final String? cpuModel,
      final String? hardDiskSize,
      final String? strapColour,
      final String? caseSize,
      final String? color,
      final String? description,
      final String? capacity,
      final double? screenSize,
      final String? generation,
      final double? price}) = _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  String? get dataColor;
  @override
  String? get dataCapacity;
  @override
  int? get capacityGb;
  @override
  double? get dataPrice;
  @override
  String? get dataGeneration;
  @override
  int? get year;
  @override
  String? get cpuModel;
  @override
  String? get hardDiskSize;
  @override
  String? get strapColour;
  @override
  String? get caseSize;
  @override
  String? get color;
  @override
  String? get description;
  @override
  String? get capacity;
  @override
  double? get screenSize;
  @override
  String? get generation;
  @override
  double? get price;
  @override
  @JsonKey(ignore: true)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
