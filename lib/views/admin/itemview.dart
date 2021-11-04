import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:itelectivesix/models/items.dart';
import 'package:itelectivesix/constants.dart';

class ItemView extends StatelessWidget {
  final Item item;

  ItemView(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.home, color: gradPurple, size: 56),
            Text(
              "Housy Appliances",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [gradPurple, gradPink, gradYellow],
        )),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Container(
                    margin: EdgeInsets.only(
                        top: 50, left: 70, right: 70, bottom: 50),
                    child: Container(
                      height: 600,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(10)),
                        color: Colors.white,
                        image: DecorationImage(
                            image: NetworkImage(item.photoUrl),
                            fit: BoxFit.fill),
                      ),
                    ))),
            Expanded(
              flex: 4,
              child: Container(
                margin:
                    EdgeInsets.only(top: 50, left: 70, right: 70, bottom: 50),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(10)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 30,
                        left: 30,
                        right: 30,
                        // bottom: 50
                      ),
                      child: Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'FuturaBold',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        // top: 20,
                        left: 30,
                        right: 30,
                        // bottom: 50
                      ),
                      child: Text(
                        "₱ " + item.price.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'FuturaLight',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          // top: 20,
                          left: 30,
                          right: 30,
                          bottom: 50),
                      child: Text(
                        item.description,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          height: 1.5,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'FuturaLight',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: gradPurple,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Container(
                            width: 400,
                            height: 50,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Add to Cart",
                                    style: const TextStyle(
                                      // color: Colors.white,
                                      // height: 1.5,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'FuturaLight',
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // RIGHT PORTION DRAWER
      // body: Center(
      //   child: Text(
      //     item.name,
      //     style: TextStyle(fontSize: 24.0),
      //   ),
      // ),
    );
  }
}
