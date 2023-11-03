import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommace/pages/Buttom%20Navigator%20Bar%20Page/bottom_navigator_bar_page%20.dart';
import 'package:ecommace/statics/all_colors.dart';
import 'package:ecommace/widgets/costom_appbar.dart';
import 'package:ecommace/widgets/costom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalAmount = 0.0;
  List<QueryDocumentSnapshot> cartItems = [];
  double totalPrice(List<QueryDocumentSnapshot> itemQuantityData) {
    double fainalAmount = 0.0;
    for (var priceData in itemQuantityData) {
      double price = double.parse(priceData["price"]);
      int quantity = priceData["quanti"];
      fainalAmount += price * quantity;
    }
    return fainalAmount;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection("cart")
          .snapshots(),
      builder: (context, snapshot1) {
        if (snapshot1.hasData) {
          cartItems = snapshot1.data!.docs;
          final taka = totalPrice(snapshot1.data!.docs);
          totalAmount = taka;
          return Scaffold(
            appBar: costomAppbar(
              leading: const Text(""),
              title: const Text(
                "My Cart",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              context: context,
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "\$${totalAmount.toString()}",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .05,
                    ),
                    CostomButton(
                      onTap: () async {
                        List<Map<String, dynamic>> data = cartItems
                            .map((e) => e.data() as Map<String, dynamic>)
                            .toList();
                        try {
                          await FirebaseFirestore.instance
                              .collection("oder")
                              .add(
                            {
                              "email": FirebaseAuth.instance.currentUser!.email,
                              "time": Timestamp.now(),
                              "item": data,
                              "price": totalAmount,
                            },
                          ).then((value) async {
                            final cart = await FirebaseFirestore.instance
                                .collection("users")
                                .doc(FirebaseAuth.instance.currentUser!.email)
                                .collection("cart")
                                .get();
                            for (var item in cart.docs) {
                              await item.reference.delete();
                            }
                          }); // ignore: use_build_context_synchronously
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "order successful",
                              ),
                            ),
                          );
                          // ignore: use_build_context_synchronously
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ButtomNavigatorBarPage(),
                              ),
                              (route) => false);
                        } catch (e) {
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                e.toString(),
                              ),
                            ),
                          );
                        }
                      },
                      color: AllColors.primarycolor,
                      child: const Text(
                        "Buy Now",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            body: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: snapshot1.data!.docs.length,
              itemBuilder: (context, index1) {
                return StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("product ")
                      .where("id",
                          isEqualTo: snapshot1.data!.docs[index1]["id"])
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                        

                          if (snapshot.hasData) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * .15,
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .1,
                                      width: MediaQuery.of(context).size.width *
                                          .15,
                                      child: Image.network(
                                        snapshot.data!.docs[index]["image"],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          snapshot.data!.docs[index]["tittle"],
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "\$${snapshot1.data!.docs[index1]['price']}",
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          snapshot1.data!.docs[index1]["id"] ==
                                                  snapshot.data!.docs[index]
                                                      ["id"]
                                              ? snapshot1
                                                  .data!.docs[index1]["size"] == null ? "":snapshot1
                                                  .data!.docs[index1]["size"]
                                                  .toString()
                                              : "" ,
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: const BorderSide(
                                              width: 1,
                                              color: AllColors.primarycolor,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  if (snapshot1.data!
                                                              .docs[index1]
                                                          ["quanti"] >
                                                      1) {
                                                    FirebaseFirestore.instance
                                                        .collection("users")
                                                        .doc(FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .email)
                                                        .collection("cart")
                                                        .doc(snapshot1.data!
                                                            .docs[index1].id)
                                                        .update({
                                                      "quanti": snapshot1.data!
                                                                  .docs[index1]
                                                              ["quanti"] -
                                                          1
                                                    });
                                                  } else {
                                                    FirebaseFirestore.instance
                                                        .collection("users")
                                                        .doc(FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .email)
                                                        .collection("cart")
                                                        .doc(snapshot1.data!
                                                            .docs[index1].id)
                                                        .delete();
                                                  }
                                                },
                                                icon: Icon(
                                                    snapshot1.data!.docs[index1]
                                                                ["quanti"] <=
                                                            1
                                                        ? Icons.delete
                                                        : Icons.remove,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                snapshot1.data!.docs[index1]
                                                            ["id"] ==
                                                        snapshot.data!
                                                            .docs[index]["id"]
                                                    ? snapshot1.data!
                                                        .docs[index1]["quanti"]
                                                        .toString()
                                                    : "0",
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  FirebaseFirestore.instance
                                                      .collection("users")
                                                      .doc(FirebaseAuth.instance
                                                          .currentUser!.email)
                                                      .collection("cart")
                                                      .doc(snapshot1.data!
                                                          .docs[index1].id)
                                                      .update({
                                                    "quanti": snapshot1.data!
                                                                .docs[index1]
                                                            ["quanti"] +
                                                        1
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
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
                );
              },
            ),
          );
        } else if (snapshot1.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                snapshot1.hasError.toString(),
              ),
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
