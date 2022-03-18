import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mail_ui/core/constants/app_strings.dart';
import 'package:mail_ui/feature/homeScreen/view/homeview.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/welcome_logo.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: context.paddingMedium,
            child: _buildPageContent(context),
          ),
        ),
      ),
    );
  }

  Column _buildPageContent(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: context.paddingLow,
          child: _buildMainText(context),
        ),
        Padding(
          padding: context.paddingLow,
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: context.appTheme.primaryColor,
                    ),
                    text: AppText().welcomeSubText),
                TextSpan(
                    style: context.textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: context.appTheme.primaryColor,
                    ),
                    text: AppText().welcomeSubTextBold),
              ])),
        ),
        const Spacer(),
        Padding(
          padding: context.verticalPaddingMedium,
          child: _buildNavigatorButton(context),
        ),
      ],
    );
  }

  Text _buildMainText(BuildContext context) {
    return Text(
      AppText().welcomeText,
      textAlign: TextAlign.center,
      style: context.textTheme.headline4?.copyWith(
        fontWeight: FontWeight.w600,
        color: context.appTheme.primaryColor,
      ),
    );
  }

  ElevatedButton _buildNavigatorButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.white),
      onPressed: () {
        context.navigateToPage(const HomeView());
      },
      child: Padding(
        padding: context.paddingNormal,
        child: Text(
          AppText().welcomeButtonText,
          style: context.textTheme.subtitle1?.copyWith(
              fontWeight: FontWeight.w500,
              color: context.appTheme.primaryColor),
        ),
      ),
    );
  }
}
