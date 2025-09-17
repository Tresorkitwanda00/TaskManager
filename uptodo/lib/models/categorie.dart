import 'package:flutter/material.dart';

class CategorieTask {
  final String nameCategory;
  final Color color;
  final Map<String, dynamic> iconCategory;

  CategorieTask({
    required this.nameCategory,
    required this.color,
    required this.iconCategory,
  });

  /// 🔄 Factory : convertir les données Firestore -> Objet Dart
  factory CategorieTask.fromMap(Map<String, dynamic> data) {
    assert(
      data['nameCategory'] != null,
      "nameCategory manquant dans Firestore",
    );
    assert(data['codeValue'] != null, "codeValue manquant dans Firestore");
    assert(
      data['iconCategory'] != null,
      "iconCategory manquant dans Firestore",
    );

    return CategorieTask(
      nameCategory: data['nameCategory'] ?? 'Unknown',
      color: Color(data['codeValue']),
      iconCategory: {
        'codePoint': data['iconCategory']['codePoint'],
        'iconfamilly': data['iconCategory']['iconfamilly'] ?? 'MaterialIcons',
      },
    );
  }

  /// 🔄 Méthode : convertir Objet Dart -> Map (pour Firestore)
  Map<String, dynamic> toMap() {
    return {
      'nameCategory': nameCategory,
      'codeValue': color.toARGB32(),
      'iconCategory': {
        'codePoint': iconCategory['codePoint'],
        'iconFamilly': iconCategory['iconfamilly'],
      },
    };
  }
}
