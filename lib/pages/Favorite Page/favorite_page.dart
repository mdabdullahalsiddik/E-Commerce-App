import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("favorite"),
      ),
    );
  }
}



// .where(
//                 "id",
//                 isEqualTo: FirebaseFirestore.instance
//                     .collection("users")
//                     .doc(FirebaseAuth.instance.currentUser!.email)
//                     .collection("cart")
//                     .doc("id"),
//               )


// return ListView.builder(
//                 shrinkWrap: true,
//                 primary: false,
//                 itemCount: snapshot.data!.docs.length,
//                 itemBuilder: (context, index) {
//                   return SizedBox(
//                     height: MediaQuery.of(context).size.height * .15,
//                     child: Card(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * .1,
//                             width: MediaQuery.of(context).size.width * .15,
//                             child: Image.network(
//                               snapshot.data!.docs[index]["image"],
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                           const Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Text(
//                                 "Reami Watch",
//                                 textAlign: TextAlign.start,
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               Text(
//                                 "\$50",
//                                 textAlign: TextAlign.start,
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w800,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               const Text(
//                                 "Size : 35",
//                                 textAlign: TextAlign.start,
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               Card(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   side: const BorderSide(
//                                     width: 1,
//                                     color: AllColors.primarycolor,
//                                   ),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     IconButton(
//                                       onPressed: () {},
//                                       icon: const Icon(Icons.remove,
//                                           color: Colors.black),
//                                     ),
//                                     const Text(
//                                       "1",
//                                       textAlign: TextAlign.start,
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                     IconButton(
//                                       onPressed: () {},
//                                       icon: const Icon(
//                                         Icons.add,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );





















// StreamBuilder(
//           stream: FirebaseFirestore.instance
//               .collection("users")
//               .doc(FirebaseAuth.instance.currentUser!.email)
//               .collection("cart")
//               .snapshots(),
//           builder: (context, snapshot1) {
//             if (snapshot1.hasData) {
//               return ListView.builder(
//                 shrinkWrap: true,
//                 primary: false,
//                 itemCount: snapshot1.data!.docs.length,
//                 itemBuilder: (context, index) {
//                   return StreamBuilder(
//                     stream: FirebaseFirestore.instance
//                         .collection("product ")
//                         .where("id",
//                             isEqualTo: snapshot1.data!.docs[index]["id"])
//                         .snapshots(),
//                     builder: (context, snapshot) {
//                       print(
//                           "..........................${snapshot.data!.docs.length}");
//                       if (snapshot.hasData) {
//                         return ListView.builder(
//                           shrinkWrap: true,
//                           primary: false,
//                           itemCount: snapshot.data!.docs.length,
//                           itemBuilder: (context, index) {
//                             return SizedBox(
//                               height: MediaQuery.of(context).size.height * .15,
//                               child: Card(
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     SizedBox(
//                                       height:
//                                           MediaQuery.of(context).size.height *
//                                               .1,
//                                       width: MediaQuery.of(context).size.width *
//                                           .15,
//                                       child: Image.network(
//                                         snapshot.data!.docs[index]["image"],
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                     Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Text(
//                                           snapshot.data!.docs[index]["tittle"],
//                                           textAlign: TextAlign.start,
//                                           style: const TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                         Text(
//                                           "\$${snapshot.data!.docs[index]['price']}",
//                                           textAlign: TextAlign.start,
//                                           style: const TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.w800,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Text(
//                                           snapshot1.data!.docs[index]["size"] ??
//                                               "",
//                                           textAlign: TextAlign.start,
//                                           style: const TextStyle(
//                                             color: Colors.black,
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w500,
//                                           ),
//                                         ),
//                                         Card(
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                             side: const BorderSide(
//                                               width: 1,
//                                               color: AllColors.primarycolor,
//                                             ),
//                                           ),
//                                           child: Row(
//                                             children: [
//                                               IconButton(
//                                                 onPressed: () {},
//                                                 icon: const Icon(Icons.remove,
//                                                     color: Colors.black),
//                                               ),
//                                               Text(
//                                                 snapshot.data!
//                                                         .docs[index]["quanti"]
//                                                         .toString() ??
//                                                     "1",
//                                                 textAlign: TextAlign.start,
//                                                 style: const TextStyle(
//                                                   color: Colors.black,
//                                                   fontSize: 18,
//                                                   fontWeight: FontWeight.w500,
//                                                 ),
//                                               ),
//                                               IconButton(
//                                                 onPressed: () {},
//                                                 icon: const Icon(
//                                                   Icons.add,
//                                                   color: Colors.black,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         )
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         );
//                       } else if (snapshot.hasError) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(
//                               snapshot.hasError.toString(),
//                             ),
//                           ),
//                         );
//                       }
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     },
//                   );
//                 },
//               );
//             } else if (snapshot1.hasError) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(
//                     snapshot1.hasError.toString(),
//                   ),
//                 ),
//               );
//             }
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           },
//         ),