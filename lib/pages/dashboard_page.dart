import 'package:ezmoney/json/activity_json.dart';
import 'package:ezmoney/json/category_json.dart';
import 'package:ezmoney/json/merchant_json.dart';
import 'package:ezmoney/pages/your_balance_page.dart';
import 'package:ezmoney/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 350,
            child: Stack(
              children: [appBarCurve(), appBarBalance()],
            ),
          ),
          SizedBox(
            height: 35,
          ),
          getTopCategories(),
        SizedBox(
          height: 0,
        ),
        getTopMechants(),
        ],
      ),
    );
  }

  Widget appBarCurve() {
    var size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        width: size.width,
        height: size.height * 0.25,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [primary, secondary]),
            boxShadow: [
              BoxShadow(
                color: bgColor.withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 10,
                // changes position of shadow
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
          child: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => YourBalancePage()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "\$",
                            style: TextStyle(fontSize: 22, color: white),
                          ),
                          Text(
                            "1,752",
                            style: TextStyle(fontSize: 30, color: white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Available balance",
                        style: TextStyle(color: white.withOpacity(0.8)),
                      )
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1663431512297-993006b0098b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2M3x8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    Positioned(
                      top: 35,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                            color: white,
                            shape: BoxShape.circle,
                            border: Border.all(color: primary)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBarBalance() {
    var size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          height: 200,
          width: size.width,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 10,
                  // changes position of shadow
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.redAccent),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Spent",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: black.withOpacity(0.5)),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "\$1,460",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: primary),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Earned",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: black.withOpacity(0.5)),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "\$3,850",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "You spent \$1,230 on dining out this month. Let's try to make it lower",
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Tell me more",
                  style: TextStyle(
                      color: primary,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getTopCategories() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top category",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categoryList.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    width: 150,
                    height: 220,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: black.withOpacity(0.01),
                            spreadRadius: 10,
                            blurRadius: 10,
                            // changes position of shadow
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 20, bottom: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 80,
                            child: CircleProgressBar(
                              foregroundColor: primary,
                              backgroundColor: black.withOpacity(0.1),
                              value: categoryList[index]['percentage'],
                              child: Center(child: Text(categoryList[index]['img'],style: TextStyle(
                                  fontSize: 22
                              ),)),

                            ),
                          ),

                          SizedBox(height: 15,),
                          Text(categoryList[index]['name'],style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                          SizedBox(height: 5,),
                          Text(categoryList[index]['price'],style: TextStyle(
                              fontSize: 16,
                              color: black.withOpacity(0.5),
                              fontWeight: FontWeight.w600
                          ),),
                          SizedBox(height: 15,),
                          Container(
                            width: 80,
                            height: 20,
                            decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Center(
                              child: Text("on track",style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: black.withOpacity(0.7)
                              ),),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  Widget getTopMechants() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top merchant",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(merchantList.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: black.withOpacity(0.01),
                                      spreadRadius: 10,
                                      blurRadius: 10,
                                      // changes position of shadow
                                    ),
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                    merchantList[index]['img']),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  merchantList[index]['name'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  merchantList[index]['transaction'],
                                  style: TextStyle(
                                      color: black.withOpacity(0.5),
                                      fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          merchantList[index]['price'],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Divider()
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}