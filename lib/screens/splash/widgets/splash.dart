import 'package:flutter/material.dart';
import 'package:healthcare_wellness/screens/splash/widgets/loading_frame_view.dart';
import 'package:healthcare_wellness/screens/splash/widgets/loading_number_frame_view.dart';
import 'package:healthcare_wellness/screens/splash/widgets/logo_frame_view.dart';
import 'package:healthcare_wellness/screens/splash/widgets/quote_frame_view.dart';



Widget buildPage(int index, double progressValue) {
  switch (index) {
    case 0:
      return LogoFrameView();
    case 1:
      return LoadingFrameView(key: ValueKey(progressValue), progressValue: progressValue);
    case 2:
      return QuoteFrameView();
    case 3:
      return LoadingNumberFrameView(key: ValueKey(progressValue), progressValue: progressValue);
    default:
      return Container();
  }
}
