import 'package:electis_shopping/theme/app_color.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ValueNotifier<int> currentPage = ValueNotifier(0);
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        onPageChanged: (page){
          currentPage.value = page;
        },
        children: [
          Center(child: Text("Home", style: TextStyle(color: AppColor.textColor),),),
          Center(child: Text("Feed", style: TextStyle(color: AppColor.textColor),),),
          Center(child: Text("Likes", style: TextStyle(color: AppColor.textColor),),),
          Center(child: Text("Carts", style: TextStyle(color: AppColor.textColor),),),
          Center(child: Text("Profile", style: TextStyle(color: AppColor.textColor),),),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: currentPage,
        builder: (context, value, child){
          return BottomNavigationBar(
            currentIndex: value,
            onTap: (index){
              controller.animateToPage(index, duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
              currentPage.value = index;
            },
            backgroundColor: AppColor.primary,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 13,
                fontWeight: FontWeight.w500
            ),
            selectedItemColor: Colors.white,
            unselectedItemColor: AppColor.iconColor,
            items: [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Assets.home.image(height: 24,color: value == 0 ? Colors.white : AppColor.iconColor),
                  ),
                  label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Assets.feeds.image(height: 24,color: value == 1 ? Colors.white : AppColor.iconColor),
                  ),
                  label: 'Feeds'
              ),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Assets.likes.image(height: 24,color: value == 2 ? Colors.white : AppColor.iconColor),
                  ),
                  label: 'Likes'
              ),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Assets.carts.image(height: 24,color: value == 3 ? Colors.white : AppColor.iconColor),
                  ),
                  label: 'Carts'
              ),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Assets.profile.image(height: 24,color: value == 4 ? Colors.white : AppColor.iconColor),
                  ),
                  label: 'Profile'
              ),
            ],
          );
        }
      )
    );
  }
}
