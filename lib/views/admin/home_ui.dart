import 'package:flutter/material.dart';
import 'package:itelectivesix/views/mainDrawer.dart';
import 'package:itelectivesix/models/items.dart';
import 'package:provider/provider.dart';
import 'package:itelectivesix/services/item_service.dart';
import 'package:itelectivesix/views/admin/itemview.dart';
import 'package:itelectivesix/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  color: gradPurple,
                ),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ],
          iconTheme: IconThemeData(color: Colors.black54),
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
        // RIGHT PORTION DRAWER
        endDrawer: MainDrawer(),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: StreamProvider<List<Item>>.value(
                  value: ItemService().getItems(),
                  builder: (context, snapshot) {
                    List<Item> items = Provider.of<List<Item>>(context);
                    return Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      direction: Axis.horizontal,
                      children: items.map((item) {
                        return customCard(item);
                      }).toList(),
                    );
                  },
                  initialData: [],
                ))
          ],
        ));
  }

  Material customCard(Item item) {
    return Material(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ItemView(item)));
            },
            child: Container(
                color: Colors.white,
                width: 300,
                height: 300,
                padding: EdgeInsets.all(10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Image.asset(item.imageLocation),
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(item.photoUrl),
                              fit: BoxFit.fill),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(item.name, style: TextStyle(fontSize: 18)),
                      SizedBox(height: 5),
                      // Text(
                      //   item.description,
                      //   style: TextStyle(
                      //     fontSize: 14,
                      //     color: Colors.black38
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 5
                      // ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "₱ " + item.price.toString(),
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            width: 15,
                          )
                        ],
                      )
                    ]))));
  }
}
