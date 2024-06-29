import 'package:flutter/material.dart';
import 'package:healthcare_wellness/configs/app_colors.dart';

class QuoteFrameView extends StatelessWidget {
  Widget build(BuildContext context) {
    return _buildQuoteFrame(context);
  }
  
  Widget _buildQuoteFrame(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.backgroundColorSplashScreenQuote,
        image: DecorationImage(
          image: AssetImage('assets/images/img_background_quote_page.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/ic_quote.png')),
            Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
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
}
