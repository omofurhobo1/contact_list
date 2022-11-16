import 'dart:convert';
import 'dart:io';

import 'package:contactlist/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContactProvider with ChangeNotifier {
  // store contacts from the internet
  List<ContactModel> apiContact = [];
  List<ContactModel> get apiContacts => apiContact;

  // store contacts to list of favorites
  List<ContactModel> favContact = [];
  List<ContactModel> get favContacts => apiContact;

  /// method to fetch contacts from the internet
  /// @return null
  Future<void> fetchContact() async {
    try {
      final resp = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      if (resp.statusCode == 200) {
        //decode the response data
        final jsonData = jsonDecode(resp.body);
        for (var data in jsonData) {
          apiContact.add(ContactModel(
              id: data['id'],
              name: data['name'],
              email: data['email'],
              phoneNumber: data['phone'],
              website: data['website'],
              address: data['address']['city'] +
                  "," +
                  data['address']['street'] +
                  "," +
                  data['address']['suite']));
        }
      }
    } on SocketException {
      //return a message that there is no internet connection

    }
    notifyListeners();
  }
}
