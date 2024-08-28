import 'package:electis_shopping/theme/app_color.dart';
import 'package:flutter/material.dart';

import '../../data/product.dart';
import '../../gen/assets.gen.dart';

class GadgetDay extends StatefulWidget {
  const GadgetDay({super.key});

  static void showGadgetDay(BuildContext context){
    showGeneralDialog(
      barrierLabel: "Gadget Day",
      barrierDismissible: true,
      transitionDuration: Duration(milliseconds: 300),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Container(
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + AppBar().preferredSize.height+8),
          child: GadgetDay()
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, -1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
  }

  @override
  State<GadgetDay> createState() => _GadgetDayState();
}

class _GadgetDayState extends State<GadgetDay> {
  ValueNotifier<int> tabs = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gadget Day',
          style: TextStyle(
            color: AppColor.textColor,
            fontSize: 18
          ),
        ),
        iconTheme: IconThemeData(
          color: AppColor.textColor
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.search_rounded)
          ),
          SizedBox(width: 10,)
        ],
      ),
      body: Column(
        children: [
          Divider(color: Color(0xFF1B1D20),),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16,),
                Row(
                  children: [
                    Expanded(
                      child: ValueListenableBuilder<int>(
                        valueListenable: tabs,
                        builder: (context, value, child) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                'Latest',
                                'Popular',
                                'Top Deals'
                              ].asMap().map((i,v)=> MapEntry(i,
                                  Padding(
                                    padding: EdgeInsets.only(right: 8, left: i==0 ? 26 : 0),
                                    child: InkWell(
                                      onTap: (){
                                        tabs.value = i;
                                      },
                                      borderRadius: BorderRadius.circular(30),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: value == i ? AppColor.buttonColor : AppColor.cardColor,
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                        child: Text(
                                          v,
                                          style: TextStyle(
                                            color: AppColor.textColor,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                              )).values.toList(),
                            ),
                          );
                        }
                      ),
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: Assets.settings.image(height: 24, color: AppColor.textColor)
                    ),
                    SizedBox(width: 16,)
                  ],
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.9,
                    padding: EdgeInsets.symmetric(horizontal: 26),
                    children: [1,2,3,4,5].asMap().map((i, v)=> MapEntry(i,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColor.cardColor,
                                borderRadius: BorderRadius.circular(20)
                              ),
                              width: double.infinity,
                              padding: EdgeInsets.all(8),
                              child: Stack(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(24.0),
                                    alignment: Alignment.center,
                                    child: Product.allProducts[i%3].photo.image(
                                      height: 80
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFDF8DA),
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                      child: Row(
                                        children: [
                                          Icon(Icons.star, color: Color(0xFFFBBA03),size: 16,),
                                          Text(
                                            '4.9',
                                            style: TextStyle(
                                                color: AppColor.textColorBlack,
                                                fontSize: 11,
                                                fontWeight: FontWeight.w700
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE3F7FA),
                                          borderRadius: BorderRadius.circular(20)
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                      child: Text(
                                        'DEAL',
                                        style: TextStyle(
                                            color: Color(0xFF003A40),
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              Product.allProducts[i%3].name,
                              style: TextStyle(
                                  color: AppColor.textColor,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                            SizedBox(height: 3,),
                            Text(
                              Product.allProducts[i%3].price,
                              style: TextStyle(
                                  color: AppColor.textColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700
                              ),
                            )
                          ],
                        )
                    )).values.toList(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
