import 'package:flutter/material.dart';
import '../color_pr.dart';
import '../widgets/mobile/mobile_footer.dart';
import '../widgets/search.dart';


class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.grey,
          ),
          onPressed: () {},
        ),
        title: SizedBox(
          width: size.width*0.40,
          child: const DefaultTabController(
              length: 2,
              child: TabBar(
                 labelColor: blueColor,
                 unselectedLabelColor: Colors.grey,
                  indicatorColor:blueColor ,
                  tabs: [
                Tab(text: 'ALL', ),
                Tab(text: 'IMAGES',),
              ])),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/more_apps.png',
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0).copyWith(
              right: 10,
            ),
            child: MaterialButton(
              onPressed: () {},
              color: const Color(0xff1A73EB),
              child: const Text(
                'Sign in',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.20,
            ),
            Expanded(
              flex: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Search(),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  const SingleChildScrollView(scrollDirection: Axis.horizontal ,child: MobileFooter()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
