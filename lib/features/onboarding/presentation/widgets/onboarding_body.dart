import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/functions/hive_function.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/strings.dart';
import '../../../../core/widgets/background.dart';
import '../../../../core/widgets/custom_button.dart';
import 'onboarding_item.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  bool isLast = false;
  var smoothPageController = PageController();
  @override
  Widget build(BuildContext context) {
    return BackGround(
      widget: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: PageView.builder(
                itemBuilder: (context, index) => OnboardingItem(
                    imageName: AssetsData.onboarding[index],
                    title: Strings.onboardingTitle[index],
                    subTitle:  Strings.onboardingSubTitle[index]),
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) {
                  _changeInOnboarding(index);
                },
                controller: smoothPageController,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  SmoothPageIndicator(
                      controller: smoothPageController,
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.white.withOpacity(.3),
                        activeDotColor: Colors.black,
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 5,
                        expansionFactor: 4,
                      ),
                      count: 3),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      text: 'Next',
                      onTap: () {
                        _clickOnNext(context);
                      },
                      key: null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changeInOnboarding(int index) {
     if (index == 2) {
      isLast = true;
    } else {
      isLast = false;
    }
  }

  void _clickOnNext(BuildContext context) {
     if (isLast) {
      save('isOnboarding',true, kStartBox);
      GoRouter.of(context).go(AppRouter.kLogin);

    } else {
      smoothPageController.nextPage(
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    }
  }
}




