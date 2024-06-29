import 'package:flutter/material.dart';
import 'package:healthcare_wellness/configs/app_colors.dart';

class LoadingFrameView extends StatefulWidget {
  final double progressValue;

  const LoadingFrameView({
    Key? key,
    this.progressValue = 0,
  }) : super(key: key);

  @override
  _LoadingFrameViewState createState() => _LoadingFrameViewState();
}

class _LoadingFrameViewState extends State<LoadingFrameView> {
  late double _progressValue;

  @override
  void initState() {
    super.initState();
    _progressValue = widget.progressValue;
  }

  void setProgressValue(double value) {
    setState(() {
      _progressValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildLoadingFrame(_progressValue);
  }

  Widget _buildLoadingFrame(double progressValue) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.backgroundColorSplashScreen,
        image: DecorationImage(
            image: AssetImage('assets/images/img_background_loading.png'),
            fit: BoxFit.cover),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Loading. . .',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(
                left: 100,
                right: 100,
                bottom: 20,
                top: 10,
              ),
              child: LinearProgressIndicator(
                value: progressValue,
                backgroundColor: const Color.fromARGB(82, 255, 255, 255),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                minHeight: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
