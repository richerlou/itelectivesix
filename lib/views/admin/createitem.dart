import 'package:flutter/material.dart';
import 'package:itelectivesix/models/items.dart';
import 'package:itelectivesix/services/item_service.dart';
import 'package:itelectivesix/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateItem extends StatelessWidget {
  const CreateItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: const [
              Icon(Icons.home, color: gradPurple, size: 56),
              Text(
                "Housy Appliances",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          iconTheme: const IconThemeData(color: gradPurple),
        ),
        body: const CreateItemForm());
  }
}

class CreateItemForm extends StatefulWidget {
  const CreateItemForm({Key? key}) : super(key: key);

  @override
  CreateItemFormState createState() {
    return CreateItemFormState();
  }
}

class CreateItemFormState extends State<CreateItemForm> {
  final _formKey = GlobalKey<FormState>();

  String name = "";
  String description = "";
  String price = "";
  String photoUrl = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [gradPurple, gradPink, gradYellow],
      )),
      child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.only(
              top: 50,
              left: 400,
              right: 400,
              bottom: 50,
            ),
            padding: const EdgeInsets.all(50),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ignore: avoid_unnecessary_containers
                Container(
                  child: Text(
                    'Add Item',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Name",
                    contentPadding: const EdgeInsets.only(left: 30),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: gradPurple),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: gradPurple),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      description = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Description",
                    contentPadding: const EdgeInsets.only(left: 30),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: gradPurple),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: gradPurple),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null) {
                      return 'Please enter a number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      price = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Price",
                    contentPadding: const EdgeInsets.only(left: 30),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: gradPurple),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: gradPurple),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      photoUrl = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Photo Url",
                    contentPadding: const EdgeInsets.only(left: 30),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: gradPurple),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: gradPurple),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var ref = await ItemService().createItem(Item(
                              id: "0",
                              name: name,
                              description: description,
                              price: price,
                              photoUrl: photoUrl));

                          if (ref.id != "") {
                            Navigator.pop(context);
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: gradPurple,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: SizedBox(
                        width: 400,
                        height: 50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Add Item",
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
