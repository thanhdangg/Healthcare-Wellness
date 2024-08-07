import 'package:flutter/material.dart';
import 'package:healthcare_wellness/models/device_model.dart';

class ItemDevice extends StatefulWidget {
  final DeviceModel device;
  const ItemDevice({super.key, required this.device});

  @override
  State<ItemDevice> createState() => _ItemDeviceState();
}

class _ItemDeviceState extends State<ItemDevice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(widget.device.name ?? ''),
          Text('${widget.device.data?.price ?? 0.0}'),
        ],
      ),
    );
  }
}
