import 'package:cloud_firestore/cloud_firestore.dart';

class Log {
  String username;
  String status;
  String action;
  final DateTime? time;
  Log({
    required this.username,
    required this.action,
    required this.status,
    required this.time,
  });
  // serialistion des donnees
  factory Log.fromMap(Map<String, dynamic> data) {
    assert(data['username'] != null, "username manquant dans la firestore");
    assert(data['action'] != null, "action manqunant ou non requise");
    assert(data['status'] != null, "status non requis");
    return Log(
      username: data['username'],
      action: data['action'],
      status: data['status'],
      time: data['time'] != null ? (data['time'] as Timestamp).toDate() : null,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'action': action,
      'status': status,
      'time': FieldValue.serverTimestamp(),
    };
  }
}
