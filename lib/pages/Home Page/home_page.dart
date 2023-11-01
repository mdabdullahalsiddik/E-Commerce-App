import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommace/pages/Category%20Page/category_page.dart';
import 'package:ecommace/pages/Product%20Details%20Page/product_details_page.dart';
import 'package:ecommace/pages/authentication/login_page.dart';
import 'package:ecommace/statics/all_colors.dart';
import 'package:ecommace/widgets/costom_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> bannerItem = [];
  final user = FirebaseAuth.instance.currentUser;
  String? name;
  Future firebaseBanaer() async {
    await FirebaseFirestore.instance.collection("banner").get().then(
      (value) {
        setState(
          () {
            bannerItem.addAll(value.docs);
            FirebaseFirestore.instance
                .collection("users")
                .doc(user!.email)
                .get()
                .then((value) {
              setState(() {
                name = value.data()!["name"];
              });
            });
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    firebaseBanaer();
  }

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
            onPressed: () {
              setState(() {
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginPage(),
                  ),
                  (route) => false,
                );
              });
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          )
        ],
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        name ?? "Hello User",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Icon(
                        Icons.waving_hand_outlined,
                        color: AllColors.primarycolor,
                      ),
                    ],
                  ),
                  const Text(
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
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider.builder(
                  itemCount: bannerItem.length,
                  itemBuilder: (context, index, realIndex) {
                    if (bannerItem.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                            bannerItem[index]["image"],
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
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
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
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("categories")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .1,
                            child: ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CategoryPage(
                                            data: snapshot.data!.docs[index],
                                          ),
                                        ));
                                  },
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                    child: Container(
                                      margin: const EdgeInsets.all(5),
                                      color: const Color(0xFFD8D3D3)
                                          .withOpacity(.5),
                                      child: Center(
                                        child: Image.network(
                                          snapshot.data!.docs[index]["icon"],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          snapshot.hasError.toString(),
                        ),
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Recent Products',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("product ")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .7,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        final data = snapshot.data!.docs[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsPage(
                                    data: data,
                                  ),
                                ));
                          },
                          child: Container(
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
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .01,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          snapshot.data!.docs[index]["image"]!,
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .01,
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]["tittle"]!,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .01,
                                  ),
                                  Text(
                                    "\$${snapshot.data!.docs[index]["price"]!}",
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          snapshot.hasError.toString(),
                        ),
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
