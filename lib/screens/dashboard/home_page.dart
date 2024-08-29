import 'package:carousel_slider/carousel_slider.dart';
import 'package:electis_shopping/data/product.dart';
import 'package:electis_shopping/screens/dashboard/gadget_day.dart';
import 'package:electis_shopping/screens/dashboard/more_view.dart';
import 'package:electis_shopping/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../gen/assets.gen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<int> tabs = ValueNotifier(0);
  ValueNotifier<double> carouselIndex = ValueNotifier(0);
  CarouselSliderController carouselController = CarouselSliderController();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          margin: EdgeInsets.only(top: 16),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.searchBarColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(right: 4),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.buttonColor,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(right: 16),
                        child: Icon(Icons.search_rounded,color: AppColor.textColor,size: 28,),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Search on Electis',
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColor.textColor,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                            Text(
                              'Electronics • Shoes • Anything',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColor.textColor2,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: ()=> MoreView.showMoreView(context),
                icon: Icon(Icons.menu, color: AppColor.textColor,)
              )
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 8,),
                tabView(),
                SizedBox(height: 20,),
                sliderView(),
                SizedBox(height: 20,),
                electisChoice(),
                SizedBox(height: 4,),
                worldShoppingView(),
                SizedBox(height: 20,),
                gadgetSliderView(),
                SizedBox(height: 20,),
                electisChoice2(),
                SizedBox(height: 20,),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget tabView() {
    return ValueListenableBuilder<int>(
        valueListenable: tabs,
        builder: (context, value, child) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                'Promo',
                'Best Deals',
                'Windy Basic',
                'Special'
              ].asMap().map((i,v)=> MapEntry(i,
                  Padding(
                    padding: EdgeInsets.only(right: 8, left: i==0 ? 16 : 0),
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
    );
  }

  Widget sliderView() {
    return Column(
      children: [
        CarouselSlider(
          carouselController: carouselController,
          items: [1,2,3,4,5,].asMap().map((i, v)=> MapEntry(i,
            Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFD5C4FB),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    margin: EdgeInsets.only(right: 16),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Try Bold \nExperience',
                          style: TextStyle(
                            color: AppColor.textColorBlack,
                            fontSize: 28,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(height: 4,),
                        Text(
                          'Sony think differents.',
                          style: TextStyle(
                            color: AppColor.textColorBlack,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 16,),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.textColorBlack,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          child: Text(
                            'Discount 40%',
                            style: TextStyle(
                              color: AppColor.textColor,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 16,
                  child: Assets.speaker.image(
                    width: 140,
                  )
                )
              ],
            )
          )).values.toList(),
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: false,
            viewportFraction: 0.9,
            aspectRatio: 2.0,
            initialPage: 0,
            enableInfiniteScroll: false,
            onScrolled: (value){
              carouselIndex.value = value ?? 0;
            }
          ),
        ),
        SizedBox(height: 16,),
        ValueListenableBuilder<double>(
          valueListenable: carouselIndex,
          builder: (context, value, child) {
            return SmoothPageIndicator(
              controller: PageController(initialPage: value.round()),
              count: 5,
              effect: ExpandingDotsEffect(
                dotColor: AppColor.cardColor,
                activeDotColor: AppColor.textColor,
                dotHeight: 6,
                dotWidth: 6,
                spacing: 4
              )
            );
          }
        )
      ],
    );
  }

  Widget electisChoice() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Electis Choice',
                  style: TextStyle(
                    color: AppColor.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Text(
                'Show all',
                style: TextStyle(
                  color: AppColor.cardColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 16,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [1,2,3,4,5].asMap().map((i, v)=> MapEntry(i,
              Padding(
                padding: EdgeInsets.only(right: 12, left: i==0 ? 16 : 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.cardColor,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      padding: EdgeInsets.all(8),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Product.allProducts[i%3].photo.image(
                              height: 90,
                              width: 90,
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
                                      fontSize: 13,
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
                                'NEW',
                                style: TextStyle(
                                  color: Color(0xFF003A40),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text(
                      Product.allProducts[i%3].name,
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    SizedBox(height: 3,),
                    Text(
                      Product.allProducts[i%3].price,
                      style: TextStyle(
                        color: AppColor.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                      ),
                    )
                  ],
                ),
              )
            )).values.toList(),
          ),
        )
      ],
    );
  }

  Widget worldShoppingView() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xFF009350)
          ),
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'World Shopping',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFFD6FFF4),
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    Text(
                      'Discounts & free shipping.',
                      style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFFBCFFE9),
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFC6FFDF)
                ),
                padding: EdgeInsets.all(16),
                child: Assets.arrowTopRight.image(
                    height: 12,
                    color: Color(0xFF009D67)
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 4,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF25262D)
                ),
                padding: EdgeInsets.all(10),
                child: Icon(Icons.camera_enhance,color: AppColor.textColor,size: 20,),
              ),
              SizedBox(width: 16,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ELECTRONICS',
                      style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF515259),
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    Text(
                      'Gadget Day',
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: ()=> GadgetDay.showGadgetDay(context),
                child: Text(
                  'Show all',
                  style: TextStyle(
                      color: AppColor.cardColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget gadgetSliderView() {
    return Column(
      children: [
        CarouselSlider(
          items: [1,2,3,4,5,].asMap().map((i, v)=> MapEntry(i,
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFF1C1E22),
                    borderRadius: BorderRadius.circular(20)
                ),
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.cardColor,
                        borderRadius: BorderRadius.circular(16)
                      ),
                      padding: EdgeInsets.all(16),
                      child: Assets.radio.image(width: 80, height: 120),
                      margin: EdgeInsets.only(right: 16),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SPEAKER',
                            style: TextStyle(
                              color: Color(0xFF4D525B),
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(height: 3,),
                          Text(
                            'Marshall Action 3',
                            style: TextStyle(
                              color: AppColor.textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(height: 3,),
                          Text(
                            'RP 24.500.000',
                            style: TextStyle(
                                color: AppColor.textColor,
                                fontSize: 16,
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
                                    backgroundColor: Color(0xFFD7BDAE), // Beige color
                                    radius: 10,
                                  ),
                                  SizedBox(width: 4), // Spacing between circles
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 10,
                                  ),
                                  SizedBox(width: 4), // Spacing between circles
                                  CircleAvatar(
                                    backgroundColor: Color(0xFF101214),
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
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: false,
            viewportFraction: 0.9,
            aspectRatio: 3,
            initialPage: 0,
            enableInfiniteScroll: false,
          ),
        ),
      ],
    );
  }

  Widget electisChoice2() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Electis Choice',
                  style: TextStyle(
                      color: AppColor.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Text(
                'Show all',
                style: TextStyle(
                    color: AppColor.cardColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 16,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [1,2,3,4,5].asMap().map((i, v)=> MapEntry(i,
                Padding(
                  padding: EdgeInsets.only(right: 12, left: i==0 ? 16 : 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColor.cardColor,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        padding: EdgeInsets.all(8),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Product.allProducts[i%3].photo.image(
                                height: 70,
                                width: 70,
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
                      SizedBox(height: 16,),
                      Text(
                        Product.allProducts[i%3].name,
                        style: TextStyle(
                            color: AppColor.textColor,
                            fontSize: 12,
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
                      )
                    ],
                  ),
                )
            )).values.toList(),
          ),
        )
      ],
    );
  }
}
