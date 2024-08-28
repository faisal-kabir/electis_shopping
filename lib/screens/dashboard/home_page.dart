import 'package:carousel_slider/carousel_slider.dart';
import 'package:electis_shopping/theme/app_color.dart';
import 'package:flutter/material.dart';
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
                onPressed: (){},
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
                sliderView()
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
}
