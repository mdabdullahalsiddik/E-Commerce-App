// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommace/pages/Product%20Details%20Page/product_details_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:ecommace/widgets/costom_appbar.dart';

class CategoryPage extends StatefulWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> data;
  const CategoryPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: costomAppbar(
        context: context,
        title: Text(
          widget.data["tittle"] ?? "No Data Available ",
          textAlign: TextAlign.start,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("product ")
              .where(
                "cate_id",
                isEqualTo: widget.data["id"],
              )
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                shrinkWrap: true,
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  onTap: () async {
                                    await FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(FirebaseAuth
                                            .instance.currentUser!.email)
                                        .collection("favorite")
                                        .add(
                                      {
                                        "id": snapshot.data!.docs[index]["id"],
                                        "cate_id": snapshot.data!.docs[index]
                                            ["cate_id"],
                                        "about": snapshot.data!.docs[index]
                                            ["about"],
                                        "image": snapshot.data!.docs[index]
                                            ["image"],
                                        "tittle": snapshot.data!.docs[index]
                                            ["tittle"],
                                        "price": snapshot.data!.docs[index]
                                            ["price"],
                                        "quanti": snapshot.data!.docs[index]
                                            ["quanti"],
                                        "size": snapshot.data!.docs[index]
                                            ["size"],
                                      },
                                    ); // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Save to favorite",
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Icon(
                                    Icons.favorite_border_sharp,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .01,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * .15,
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
                              height: MediaQuery.of(context).size.height * .01,
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
                              height: MediaQuery.of(context).size.height * .01,
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
      ),
    );
  }
}
