import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uptodo/models/categorie.dart';

class CategorieController {
  // methode pour recuper les categories
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  bool _isProcessing = false; // variable pour suivre  l'etat de traitement
  Stream<List<CategorieTask>> getCategories() {
    return _db.collection('category').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return CategorieTask.fromMap(doc.data());
      }).toList();
    });
  }

  Future<String> addCategory(CategorieTask category) async {
    if (_isProcessing) return "processing"; //  empêche clics multiples
    _isProcessing = true;
    try {
      final docRef = _db.collection('category').doc(category.nameCategory);
      final retry = await docRef.get();
      if (!retry.exists) {
        await docRef.set({
          ...category.toMap(),
          'created': FieldValue.serverTimestamp(), // enregistre la date/heure
        });
        return 'saved';
      } else {
        return "exists";
      }
    } catch (e) {
      return "❌ Error : $e";
    } finally {
      _isProcessing = false;
    }
  }
}
