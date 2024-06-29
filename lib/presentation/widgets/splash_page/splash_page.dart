import 'package:flutter/material.dart';
import 'package:healthcare_wellness/configs/app_colors.dart';
import 'package:healthcare_wellness/presentation/widgets/splash_page/loading_frame_view.dart';
import 'package:healthcare_wellness/presentation/widgets/splash_page/loading_number_frame_view.dart';
import 'logo_frame_view.dart';
import 'quote_frame_view.dart';


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
