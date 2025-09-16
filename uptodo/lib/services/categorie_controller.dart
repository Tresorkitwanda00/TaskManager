import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uptodo/models/categorie.dart';

class CategorieController {
  // methode pour recuper les categories
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Stream<List<CategorieTask>> getCategories() {
    return _db.collection('category').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return CategorieTask.fromMap(doc.data());
      }).toList();
    });
  }
}
