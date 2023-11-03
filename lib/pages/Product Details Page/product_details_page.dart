import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommace/pages/Cart%20Page/cart_page.dart';
import 'package:ecommace/statics/all_colors.dart';
import 'package:ecommace/widgets/costom_appbar.dart';
import 'package:ecommace/widgets/costom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductDetailsPage extends StatefulWidget {
  QueryDocumentSnapshot<Map<String, dynamic>> data;
  ProductDetailsPage({
    super.key,
    required this.data,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int seletIndex = 0;
  String? seletSizes;
  final user = FirebaseAuth.instance.currentUser;
  Future seletSize() async {
    setState(() {
      seletSizes = widget.data["size"] == null ? null : widget.data["size"][0];
    });
  }

  @override
  void initState() {
    super.initState();

    seletSize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: costomAppbar(
        color: Colors.transparent,
        context: context,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Image.network(
                    widget.data["image"] ?? "No Data Available ",
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * .3,
                  ),
                ),
              ),
              Text(
                widget.data["tittle"] ?? "No Data Available ",
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber.shade700,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber.shade700,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber.shade700,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber.shade700,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber.shade700,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${widget.data["price"] ?? "0"}",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Available in stock",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black.withOpacity(.7),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Text(
                "About",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.data["about"] ?? "No Data Found",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .25,
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 62.54545593261719,
                      child: ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.data["size"].length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 64,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  seletIndex = index;
                                  seletSizes = widget.data["size"][index];
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: seletIndex == index
                                        ? AllColors.primarycolor
                                        : const Color(0xFFD8D3D3)
                                            .withOpacity(.5),
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: seletIndex == index
                                          ? Colors.transparent
                                          : Colors.black,
                                    )),
                                margin: const EdgeInsets.all(5),
                                child: Center(
                                  child: Text(
                                    widget.data["size"][index],
                                    style: TextStyle(
                                      color: seletIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
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
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              CostomButton(
                onTap: () async {
                  await FirebaseFirestore.instance
                      .collection("users")
                      .doc(user!.email)
                      .collection("cart")
                      .add(
                    {
                      "id": widget.data["id"],
                      "size": seletSizes,
                      "quanti":1,
                    },
                  );
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Save to cart",
                      ),
                    ),
                  );
                },
                color: AllColors.primarycolor,
                child: const Text(
                  "Add to cart",
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
    );
  }
}
