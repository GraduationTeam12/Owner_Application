import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/presentation/widgets/dialog_rating.dart';

class RateUsScreen extends StatefulWidget {
  const RateUsScreen({super.key});

  @override
  State<RateUsScreen> createState() => _RateUsScreenState();
}

class _RateUsScreenState extends State<RateUsScreen> {
  double rat = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: MediaQuery.sizeOf(context).width > 600 ? 45 : null,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Image.asset(
                      fit: BoxFit.contain,
                      width: MediaQuery.sizeOf(context).width > 600
                          ? MediaQuery.sizeOf(context).width / 2
                          : null,
                      height: MediaQuery.sizeOf(context).width > 600
                          ? MediaQuery.sizeOf(context).height / 2
                          : null,
                      'assets/images/auth_images/rate_us.png')),
              SizedBox(
                height: MediaQuery.sizeOf(context).width > 600 ? 0 : 30,
              ),
              Center(
                child: Text(
                  'Your opinion matter to us!',
                  style: AppStyle.styleBold30(context)
                      .copyWith(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  children: [
                    FittedBox(
                      child: Text(
                        'We worked super hard to make Glose ',
                        style: AppStyle.styleSemiBold22(context)
                            .copyWith(color: Color(0xFFA8A1A1)),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        'better for you ,and would  love to know',
                        style: AppStyle.styleSemiBold22(context)
                            .copyWith(color: Color(0xFFA8A1A1)),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        'How would you rate our App?  ',
                        style: AppStyle.styleSemiBold22(context)
                            .copyWith(color: Color(0xFFA8A1A1)),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    RatingBar.builder(
                      initialRating: 0,
                      minRating: 0.5,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize:
                          MediaQuery.sizeOf(context).width > 600 ? 100 : 40,
                      unratedColor: Colors.grey[300],
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        // print(rating);
                        setState(() {
                          rat = rating;
                        });
                        
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).width > 600 ? 40 : 20,
                    ),
                    Center(
                      child: SizedBox(
                        width:
                            MediaQuery.sizeOf(context).width > 600 ? 600 : 300,
                        height:
                            MediaQuery.sizeOf(context).width > 600 ? 80 : 55,
                        child: ElevatedButton(
                          onPressed: () {
                            rat == 0 ? null : showRatingDialog(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.premiumColor,
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text(
                            "Submit",
                            style: AppStyle.styleRegular25(context).copyWith(
                                fontFamily: 'Inter', color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'No Thanks',
                        style: AppStyle.styleBold20(context)
                            .copyWith(color: Color(0xFFA8A1A1)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
