import 'package:flutter/material.dart';
import 'package:healthcare_wellness/configs/app_colors.dart';

Widget buildPage(int index, double progressValue) {
  switch (index) {
    case 0:
      return buildLogoFrame();
    case 1:
      return buildLoadingFrame(progressValue);
    case 2:
      return buildQuoteFrame();
    case 3:
      return buildLoadingNumberFrame(progressValue);
    default:
      return Container();
  }
}

Widget buildLogoFrame() {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(image: AssetImage('assets/images/monotone_health_plus.png')),
        SizedBox(height: 20),
        Image(image: AssetImage('assets/images/asklepios.png')),
        SizedBox(height: 20),
        Text(
          'Your Intelligent AI Health & Wellness Companion.',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'PlusJakartaSans',
            color: AppColors.textLogoColor,
            wordSpacing: 2,
            letterSpacing: 1,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget buildLoadingFrame(double progressValue) {
  return Container(
    decoration: const BoxDecoration(
      color: AppColors.backgroundColorSplashScreen,
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Loading',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(
                left: 100, right: 100, bottom: 20, top: 10),
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

Widget buildQuoteFrame() {
  return Container(
    decoration: const BoxDecoration(
      color: AppColors.backgroundColorSplashScreenQuote,
      image: DecorationImage(
        image: AssetImage('assets/images/group.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/images/quote.png')),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: Text(
              '"Health is the complete harmony of the body and soul."',
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.normal,
                fontFamily: 'PlusJakartaSans',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            "— Aristotle",
            style: TextStyle(
              fontSize: 24,
              fontStyle: FontStyle.normal,
              fontFamily: 'PlusJakartaSans',
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

Widget buildLoadingNumberFrame(double progressValue) {
  return Container(
    decoration: const BoxDecoration(
      color: AppColors.backgroundColor,
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
