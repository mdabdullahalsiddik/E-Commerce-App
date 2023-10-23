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
  List<Map<String, String>> elementIcon = [
    {
      "icon": "assets/images/watch.png",
    },
    {
      "icon": "assets/images/tshart.png",
    },
    {
      "icon": "assets/images/bug.png",
    },
    {
      "icon": "assets/images/watch.png",
    },
    {
      "icon": "assets/images/tshart.png",
    },
    {
      "icon": "assets/images/bug.png",
    }
  ];
  List<Map<String, String>> item = [
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAQvxC4sZAzUkZZcFIqqen7W_ncU3UI0ge8Q&usqp=CAU",
      "title": "Realmi Watch",
      "price": "50",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwcIeklz7uGblVW_bHQT_A7tADDd-k89rw_A&usqp=CAU",
      "title": "Realmi Digital",
      "price": "80",
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaqrzpmzjR_dVpPE4Ms31nQBcpN7vO5SL86A&usqp=CAU",
      "title": "Appale",
      "price": "150",
    },
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
              ),
            )
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
                            fontWeight: FontWeight.w600,
                          ),
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
                        fontWeight: FontWeight.w600,
                      ),
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
                            image: NetworkImage(
                              bannerImage[index],
                            ),
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
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "See All",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
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
                          primary: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: elementIcon.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 64,
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                color: const Color(0xFFD8D3D3).withOpacity(.5),
                                child: Center(
                                  child: Image.asset(
                                    elementIcon[index]["icon"]!,
                                  ),
                                ),
                              ),
                            );
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
                  primary: true,
                  itemCount: item.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .7,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      color: const Color(0xFFD8D3D3).withOpacity(.5),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.favorite_border_sharp,
                                    size: 14,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    item[index]["image"] ?? "",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              item[index]["title"] ?? "",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "\$${item[index]["price"] ?? ""}",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12.23,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
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
