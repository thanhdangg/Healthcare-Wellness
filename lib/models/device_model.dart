// To parse this JSON data, do
//
//     final deviceModel = deviceModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'device_model.freezed.dart';
part 'device_model.g.dart';

List<DeviceModel> deviceModelFromJson(String str) =>
    List<DeviceModel>.from(json.decode(str).map((x) => DeviceModel.fromJson(x)));

String deviceModelToJson(List<DeviceModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class DeviceModel with _$DeviceModel {
  const factory DeviceModel({
    String? id,
    String? name,
    Data? data,
  }) = _DeviceModel;

  factory DeviceModel.fromJson(Map<String, dynamic> json) => _$DeviceModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    String? dataColor,
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
    double? price,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
