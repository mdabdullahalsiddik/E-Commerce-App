
import 'package:ecommace/statics/all_colors.dart';
import 'package:ecommace/widgets/costom_appbar.dart';
import 'package:ecommace/widgets/costom_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductDetailsPage extends StatefulWidget {
  Map<String, dynamic>? data;
  ProductDetailsPage({
    super.key,
    this.data,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  List<String> sizeData = [
    "30",
    "32",
    "36",
    "40",
  ];
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
                    widget.data!["image"],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                widget.data!["title"],
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
                    "\$${widget.data!["price"]}",
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
                "The upgraded S6 SiP runs up to 20 percent faster, allowing apps to also launch 20 percent faster, while maintaining the same all-day 18-hour battery life.",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                  fontSize: 24,
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
          height: MediaQuery.of(context).size.height * .2,
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
                        itemCount: sizeData.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 64,
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              color: const Color(0xFFD8D3D3).withOpacity(.5),
                              child: Center(
                                child: Text(
                                  sizeData[index],
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
                onTap: () {},
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
