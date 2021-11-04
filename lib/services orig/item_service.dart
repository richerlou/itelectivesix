import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:itelectivesix/models/items.dart';

class ItemService {
  final CollectionReference items =
      FirebaseFirestore.instance.collection("items");

  Stream<List<Item>> getItems() {
    return items.snapshots().map((QuerySnapshot snapshot) {
      return snapshot.docs.map((doc) {
        return Item(
          id: doc.id,
          name: doc.get('name'),
          description: doc.get('description'),
          price: doc.get('price'),
          photoUrl: doc.get('photoUrl'),
        );
      }).toList();
    });
  }

  Future<DocumentReference<Object?>> createItem(Item item) async {
    Map<String, dynamic> data = {
      "name": item.name,
      "description": item.description,
      "price": item.price,
      "photoUrl": item.photoUrl
    };
    var ref = await items.add(data);

    return ref;
  }
}
