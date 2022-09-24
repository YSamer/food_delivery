import 'package:http/http.dart' as http;
import 'dart:developer';


class ApiService {
  Future<dynamic> getUsers() async {
    try {
      var response = await http.get(Uri.parse(''));
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

// class API {
//   API._internal() {
//     init();
//   }
//   static final API _instance = API._internal();
//   factory API() => _instance;

//   init() async {
//     fetchAlbum();
//     String endpoint = 'https://reqres.in/api/users?page=2';
//     http.Response _response = await http.get(Uri.parse(endpoint));
//   }

//   Future<http.Response> fetchAlbum() {
//     return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
//   }

//   late http.Response _response = http.Response('hh', 200);
//   late http.Response _response2 = http.Response('hh', 200);

//   get response => _response.body;
//   get response2 => _response2.body;
// }
