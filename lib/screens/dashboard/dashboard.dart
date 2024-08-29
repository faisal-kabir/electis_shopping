import 'package:electis_shopping/screens/dashboard/home_page.dart';
import 'package:electis_shopping/theme/app_color.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../cart_view.dart';

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
      body: SafeArea(
        child: PageView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (page){
            currentPage.value = page;
          },
          children: [
            HomePage(),
            Center(child: Text("Feed", style: TextStyle(color: AppColor.textColor),),),
            Center(child: Text("Likes", style: TextStyle(color: AppColor.textColor),),),
            Center(child: Text("Carts", style: TextStyle(color: AppColor.textColor),),),
            Center(child: Text("Profile", style: TextStyle(color: AppColor.textColor),),),
          ],
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: currentPage,
        builder: (context, value, child){
          return BottomNavigationBar(
            currentIndex: value,
            onTap: (index){
              if(index != 3) {
                controller.animateToPage(
                  index, duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut
                );
                currentPage.value = index;
              } else {
                CartView.showMoreView(context);
              }
            },
            backgroundColor: Color(0xFF1C1E22),
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
                    padding: EdgeInsets.only(bottom: 4, top: 4),
                    child: Assets.home.image(height: 24,color: value == 0 ? Colors.white : AppColor.iconColor),
                  ),
                  label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4, top: 4),
                    child: Assets.feeds.image(height: 24,color: value == 1 ? Colors.white : AppColor.iconColor),
                  ),
                  label: 'Feeds'
              ),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4, top: 4),
                    child: Assets.likes.image(height: 24,color: value == 2 ? Colors.white : AppColor.iconColor),
                  ),
                  label: 'Likes'
              ),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4, top: 4),
                    child: Assets.carts.image(height: 24,color: value == 3 ? Colors.white : AppColor.iconColor),
                  ),
                  label: 'Carts'
              ),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 4, top: 4),
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
