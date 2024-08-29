import 'package:electis_shopping/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

import '../../data/product.dart';
import '../../gen/assets.gen.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  static void showMoreView(BuildContext context){
    showGeneralDialog(
      barrierLabel: "Gadget Day",
      barrierDismissible: true,
      transitionDuration: Duration(milliseconds: 300),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Container(
          alignment: Alignment.bottomCenter,
          child: CartView()
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
  }

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )
          ),
          padding: EdgeInsets.all(26).copyWith(
            top: 10
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Shop Cart',
                      style: TextStyle(
                          color: AppColor.textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: ()=> Navigator.pop(context),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColor.textColor,
                    )
                  )
                ],
              ),
              SizedBox(height: 8,),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [1,2,3].asMap().map((i, v)=> MapEntry(i,
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF1C1E22),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(bottom: 8),
                        height: 110,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColor.cardColor,
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              padding: EdgeInsets.all(16),
                              child: Product.allProducts[i%3].photo.image(width: 70, height: 100),
                              margin: EdgeInsets.only(right: 16),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    Product.allProducts[i%3].name,
                                    style: TextStyle(
                                        color: AppColor.textColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  SizedBox(height: 3,),
                                  Text(
                                    Product.allProducts[i%3].price,
                                    style: TextStyle(
                                        color: AppColor.textColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Spacer(),
                                  Neumorphic(
                                    child: Container(
                                      padding: EdgeInsets.all(4),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: [Color(0xFFD7BDAE),Colors.white, Color(0xFF101214)][i], // Beige color
                                            radius: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                    style: NeumorphicStyle(
                                        depth: -1,
                                        color: Color(0xFF212327),
                                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20))
                                    ),
                                  ),
                                  SizedBox(height: 8,)
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                  )).values.toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.buttonColor,
                    padding: EdgeInsets.symmetric(vertical: 12)
                  ),
                  child: Center(
                    child: Text(
                      'Checkout (3)',
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
