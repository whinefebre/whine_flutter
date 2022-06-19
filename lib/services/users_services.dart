import 'package:http/http.dart' as http;
import '../models.dart/users.dart';
import 'dart:convert';

Future<List<Users>> fetchUsers() async {
  final response = await http
      .get(Uri.parse('https://gorest.co.in/public/v2/users'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List jsonResponse = json.decode(response.body); 
    return jsonResponse.map((data) => Users.fromJson(data)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Users');
  }
}