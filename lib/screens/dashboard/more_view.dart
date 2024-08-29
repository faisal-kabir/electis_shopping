import 'package:electis_shopping/theme/app_color.dart';
import 'package:flutter/material.dart';

import '../../data/product.dart';
import '../../gen/assets.gen.dart';

class MoreView extends StatefulWidget {
  const MoreView({super.key});

  static void showMoreView(BuildContext context){
    showGeneralDialog(
      barrierLabel: "Gadget Day",
      barrierDismissible: true,
      transitionDuration: Duration(milliseconds: 300),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + AppBar().preferredSize.height+8),
          child: MoreView()
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
  State<MoreView> createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  ValueNotifier<int> tabs = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.backgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.cardColor,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BALANCE',
                            style: TextStyle(
                              color: Color(0xFF575C67),
                              fontSize: 10
                            ),
                          ),
                          Text(
                            'RP 2.500.000',
                            style: TextStyle(
                              color: AppColor.textColor,
                              fontSize: 16
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.cardColor,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'MEMBER',
                                  style: TextStyle(
                                    color: Color(0xFF575C67),
                                    fontSize: 10
                                  ),
                                ),
                                Text(
                                  'Platinum',
                                  style: TextStyle(
                                    color: AppColor.textColor,
                                    fontSize: 16
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Assets.trophy.image(
                            height: 20
                          )
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: ()=> Navigator.pop(context),
                    icon: Icon(
                      Icons.close,
                      color: AppColor.textColor,
                    )
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Delivery Location',
                      style: TextStyle(
                          color: AppColor.textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Text(
                    'Manage',
                    style: TextStyle(
                        color: AppColor.cardColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
              SizedBox(height: 16,),
              Container(
                decoration: BoxDecoration(
                    color: AppColor.cardColor,
                    borderRadius: BorderRadius.circular(20)
                ),
                width: double.infinity,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      margin: EdgeInsets.only(bottom: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Office',
                            style: TextStyle(
                              color: AppColor.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          Text(
                            'Ketilang Merah No. 440 Block B.',
                            style: TextStyle(
                              color: Color(0xFF5C5E68),
                              fontSize: 13
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFE5D8FF),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      margin: EdgeInsets.only(bottom: 4),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Home',
                            style: TextStyle(
                              color: AppColor.textColorBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          Text(
                            'Soekarno-Hatta Street No.8 Block B.',
                            style: TextStyle(
                              color: Color(0xFF504C68),
                              fontSize: 13
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Village',
                            style: TextStyle(
                              color: AppColor.textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          Text(
                            'Jendral Sudirman St. No.21 Block C.',
                            style: TextStyle(
                                color: Color(0xFF5C5E68),
                                fontSize: 13
                            ),
                          ),
                        ],
                      ),
                    ),
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
