import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_app/constants/app_style.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/presentation/models/drawer_model.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Widget buildDrawerListItemsDivider() {
    return const Divider(
      height: 0,
      color: Colors.white,
      thickness: 1,
      indent: 10,
      endIndent: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<DrawerModel> items = [
      DrawerModel(
          title: 'My Profile',
          img: 'assets/images/auth_images/myprofile.svg',
          onTap: () {}),
      DrawerModel(
          title: 'My Car',
          img: 'assets/images/auth_images/mycar.svg',
          onTap: () {}),
      DrawerModel(
          title: 'Location',
          img: 'assets/images/auth_images/location.svg',
          onTap: () {}),
      DrawerModel(
          title: 'Contact Us',
          img: 'assets/images/auth_images/contact.svg',
          onTap: () {}),
      DrawerModel(
          title: 'Privacy Policy',
          img: 'assets/images/auth_images/privacy.svg',
          onTap: () {}),
      DrawerModel(
          title: 'Share this app',
          img: 'assets/images/auth_images/shareapp.svg',
          onTap: () {}),
      DrawerModel(
          title: 'Rate Us',
          img: 'assets/images/auth_images/star.svg',
          onTap: () {}),
      DrawerModel(
          title: 'Settings',
          img: 'assets/images/auth_images/settings.svg',
          onTap: () {}),
    ];

    return Container(
      width: MediaQuery.sizeOf(context).width > 600
          ? MediaQuery.of(context).size.width * .55
          : MediaQuery.of(context).size.width * .7,
      // color: MyColors.premiumColor,
      decoration: ShapeDecoration(
          color: MyColors.premiumColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ))),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: Image.asset(
                          'assets/images/auth_images/drawerphoto.jpg'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Ayman Ahmed',
                      style: AppStyle.styleRegular20(context)
                          .copyWith(color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Ayman Ahmed@gmail.com',
                      style: AppStyle.styleRegular20(context)
                          .copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).width > 600 ? 60 : 30,
              ),
            ),
            SliverList.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: InkWell(
                    onTap: items[index].onTap,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: SvgPicture.asset(
                                items[index].img,
                                width: MediaQuery.sizeOf(context).width > 600
                                    ? 40
                                    : 24,
                                height: MediaQuery.sizeOf(context).width > 600
                                    ? 40
                                    : 24,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                items[index].title,
                                style: AppStyle.styleRegular20(context)
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            Transform.rotate(
                              angle: -1.5708 * 2,
                              child: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: Colors.white,
                                size: MediaQuery.sizeOf(context).width > 600
                                    ? 50
                                    : 20,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width > 600
                                  ? 20
                                  : 10,
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).width > 600
                              ? MediaQuery.sizeOf(context).height * 0.02
                              : 11,
                        ),
                        buildDrawerListItemsDivider(),
                        const SizedBox(height: 10)
                      ],
                    ),
                  ),
                );
              },
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      height:
                          MediaQuery.sizeOf(context).width > 600 ? 70 : null,
                      width: MediaQuery.sizeOf(context).width > 600 ? 250 : 150,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout,
                              color: const Color(0xFFA8A1A1),
                              size: MediaQuery.sizeOf(context).width > 600
                                  ? 50
                                  : 24,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Log Out',
                              style: AppStyle.styleBold20(context).copyWith(
                                color: const Color(0xFFA8A1A1),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height:
                          MediaQuery.sizeOf(context).height > 1800 ? 300 : 26),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
