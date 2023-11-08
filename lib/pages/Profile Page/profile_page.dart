import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommace/widgets/costom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.email)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                "My Profile",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.person,
                  ),
                  title: Text(
                    snapshot.data!["name"].toString(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              "Edit Name",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            content: CostomTextField(
                              hintText: "Name",
                              controller: nameController,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.email)
                                      .update({"name": nameController.text});
                                  Navigator.pop(context);
                                },
                                child: const Text("Ok"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.mail,
                  ),
                  title: Text(
                    snapshot.data!["email"].toString(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.call,
                  ),
                  title: Text(
                    snapshot.data!["phone"].toString(),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              "Edit Phone Number",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            content: CostomTextField(
                              hintText: "Phone Number",
                              controller: phoneController,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection("users")
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.email)
                                      .update({"phone": phoneController.text});
                                  Navigator.pop(context);
                                },
                                child: const Text("Ok"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.edit,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
