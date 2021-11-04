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
        title: InkWell(
          child: Icon(Icons.home, color: gradPurple, size: 56),
          // onTap: (){
          // },
        ),
        backgroundColor: Colors.grey[300],
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container (
              margin: EdgeInsets.only(
              top: 50,
              left: 70,
              right: 70,
              bottom: 50
              ),
              child: Container(
              height: 600,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: const BorderRadius.all(const Radius.circular(10)),
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(item.photoUrl),
                  fit: BoxFit.fill
                ),
              ),
            )
            )
          ),
          Expanded(
            flex: 4,
            child: Container(
              margin: EdgeInsets.only(
                top: 50,
                left: 70,
                right: 70,
                bottom: 50
              ),
              decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: const BorderRadius.all(const Radius.circular(10)),
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
                    Container(
                      margin: EdgeInsets.only(
                        // top: 20,
                        left: 30,
                        right: 30,
                        bottom: 50
                      ),
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
                    Center(
                      child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black54,
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
                                  "Add to Bag",
                                  style: const TextStyle(
                                  // color: Colors.white,
                                  fontSize: 16,
                                  // height: 1.5,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'FuturaLight',
                                ),
                               ),
                              ]
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red[400],
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
                                  "Favorite  ",
                                  style: const TextStyle(
                                  // color: Colors.white,
                                  fontSize: 16,
                                  // height: 1.5,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'FuturaLight',
                                  ),
                                ),
                                const FaIcon(
                                  FontAwesomeIcons.heart,
                                )
                              ]
                            ),
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