import 'dart:convert';
import 'package:http/http.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class UsersFirebase {
    Client client = Client();
    final String _collection = "/users";
  getUserByID(String id) async {
    var user = Firestore.instance.collection(this._collection).document(id).snapshots();
    return user;
  }
}