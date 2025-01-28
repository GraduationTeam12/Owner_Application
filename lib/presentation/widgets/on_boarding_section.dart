import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_app/constants/app_images.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/constants/pages_name.dart';
import 'package:user_app/presentation/widgets/dots_indicator.dart';
import 'package:user_app/presentation/widgets/on_boarding_pageview.dart';

class OnBoardingSection extends StatefulWidget {
  const OnBoardingSection({super.key,  });

   
  @override
  State<OnBoardingSection> createState() => _OnBoardingSectionState();
}

class _OnBoardingSectionState extends State<OnBoardingSection> {
  late PageController pageController;
  int currentIndex = 0;

  void goToPreviousPage() {
    if (currentIndex == 0) {
      // goToSelectingMethodScreen();
    } else if (currentIndex > 0) {
      currentIndex--;
      pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void goToNextPage() {
    if (currentIndex < 2) {
      currentIndex++;
      pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  // void goToSelectingMethodScreen() {
  //   if (currentIndex == 0) {
  //     Navigator.pushReplacementNamed(context, selectingMethodScreen);
  //   }
  // }

  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      currentIndex = pageController.page!.round();

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          OnBoardingPageview(pageController: pageController),
          const SizedBox(
            height: 60,
          ),
          DotsIndicator(currentIndex: currentIndex),
          const Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: goToPreviousPage,
                  child: currentIndex == 0? Text('') : Text(
                    "Back",
                    style: AppStyle.styleSemiBold18(context)
                        .copyWith(color: const Color(0xFF5C5858)),
                  )),
              currentIndex == 2
                  ? SizedBox(
                      // width: 111,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: MyColors.premiumColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))),
                          onPressed: () {
                              Navigator.pushNamed(context, signInScreen);
                          },
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Start",
                                style: AppStyle.styleRegular16(context)
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          )),
                    )
                  : GestureDetector(
                      onTap: goToNextPage,
                      child: SizedBox(
                          height:
                              MediaQuery.sizeOf(context).width > 600 ? 65 : 35,
                          width:
                              MediaQuery.sizeOf(context).width > 600 ? 65 : 35,
                          child: SvgPicture.asset(
                            Assets.imagesAuthImagesNext,
                            // fit: BoxFit.contain,
                          )),
                    ),
            ],
          ),
          const Expanded(
              child: SizedBox(
            height: 30,
          ))
        ],
      ),
    );
  }
}
