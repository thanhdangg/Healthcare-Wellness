import 'package:flutter/material.dart';
import 'package:healthcare_wellness/configs/app_colors.dart';

class LoadingNumberFrameView extends StatefulWidget {
  final double progressValue;

  const LoadingNumberFrameView({
    Key? key,
    this.progressValue = 0,
  }) : super(key: key);

  @override
  _LoadingNumberFrameViewState createState() => _LoadingNumberFrameViewState();
  
}
class _LoadingNumberFrameViewState extends State<LoadingNumberFrameView>{
  late double _progressValue;
  @override
  void initState() {
    super.initState();
    _progressValue = widget.progressValue;
  }

  @override
  Widget build(BuildContext context) {
    return _buildLoadingNumberFrame(_progressValue);
  }
  Widget _buildLoadingNumberFrame(double progressValue) {
    return Container(
    decoration: const BoxDecoration(
      color: AppColors.backgroundColor,
      image: DecorationImage(
        image: AssetImage('assets/images/img_background_loading_number.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          '${(progressValue * 100).toStringAsFixed(0)}%',
          style: const TextStyle(
            fontSize: 40,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
  }
}