// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceModelImpl _$$DeviceModelImplFromJson(Map<String, dynamic> json) =>
    _$DeviceModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DeviceModelImplToJson(_$DeviceModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      dataColor: json['dataColor'] as String?,
      dataCapacity: json['dataCapacity'] as String?,
      capacityGb: (json['capacityGb'] as num?)?.toInt(),
      dataPrice: (json['dataPrice'] as num?)?.toDouble(),
      dataGeneration: json['dataGeneration'] as String?,
      year: (json['year'] as num?)?.toInt(),
      cpuModel: json['cpuModel'] as String?,
      hardDiskSize: json['hardDiskSize'] as String?,
      strapColour: json['strapColour'] as String?,
      caseSize: json['caseSize'] as String?,
      color: json['color'] as String?,
      description: json['description'] as String?,
      capacity: json['capacity'] as String?,
      screenSize: (json['screenSize'] as num?)?.toDouble(),
      generation: json['generation'] as String?,
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'dataColor': instance.dataColor,
      'dataCapacity': instance.dataCapacity,
      'capacityGb': instance.capacityGb,
      'dataPrice': instance.dataPrice,
      'dataGeneration': instance.dataGeneration,
      'year': instance.year,
      'cpuModel': instance.cpuModel,
      'hardDiskSize': instance.hardDiskSize,
      'strapColour': instance.strapColour,
      'caseSize': instance.caseSize,
      'color': instance.color,
      'description': instance.description,
      'capacity': instance.capacity,
      'screenSize': instance.screenSize,
      'generation': instance.generation,
      'price': instance.price,
    };
