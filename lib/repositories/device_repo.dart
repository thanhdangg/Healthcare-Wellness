import 'package:dio/dio.dart';
import 'package:healthcare_wellness/models/device_model.dart';

class DeviceRepository {
  /// Get the list device information
  Future<List<DeviceModel>?> getDevices() async {
    final res = await Dio().get('https://api.restful-api.dev/objects');
    if (res.statusCode == 200) {
      final devicesJsonList = res.data;
      return List<DeviceModel>.from(devicesJsonList.map((x) => DeviceModel.fromJson(x)));
    } else {
      return null;
    }
  }
}
