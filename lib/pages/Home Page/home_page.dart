import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommace/statics/all_colors.dart';
import 'package:ecommace/widgets/costom_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> bannerImage = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4qzhomecl9o3rcPexAVITvNYi4GfMPxyVbQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqA9kUlLN9e3vbKHZO45S0b33fSx5b38-Xcg&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHqnPMkvAKCzZ7kB4bRRw2nbksPDyjfmSnWw&usqp=CAU"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: costomAppbar(
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_rounded,
                  color: Colors.black,
                ))
          ]),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Hello Fola ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.waving_hand_outlined,
                          color: AllColors.primarycolor,
                        ),
                      ],
                    ),
                    Text(
                      "Let’s start shopping!",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider.builder(
                    itemCount: bannerImage.length,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(bannerImage[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayCurve: Curves.easeInOut,
                      enlargeCenterPage: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Categories",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "See All",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 62.54545593261719,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return SizedBox(
                                width: MediaQuery.of(context).size.width / 4,
                                child: const Card(
                                  elevation: 0,
                                  color: Color(0xFFf1f1f1),
                                  child: Icon(
                                    Icons.tv_sharp,
                                    weight: 21,
                                    color: Color(0xFF919191),
                                  ),
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Card(
                      color: const Color(0xfff8f8f8),
                      child: Column(
                   

                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite_border_sharp,
                                    size: 12,
                                  ))
                            ],
                          ),
                          Container(
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/welcome_image.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Apple Watch - series 6",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.attach_money,
                                    size: 12,
                                  ),
                                  Text(
                                    "45,000",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.23,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.attach_money,
                                    size: 10,
                                    color: Color(0xFFAFAFAF),
                                  ),
                                  Text(
                                    "55,000",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Color(0xFFAFAFAF),
                                        fontSize: 10.00,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
