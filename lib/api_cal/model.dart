// class Music_App {
//   dynamic id;
//   dynamic name;
//   dynamic bio;
//   dynamic artistImage;
//
//   Music_App({this.id, this.name, this.bio, this.artistImage});
//
//   Music_App.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     bio = json['bio'];
//     artistImage = json['Artist_image'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['bio'] = this.bio;
//     data['Artist_image'] = this.artistImage;
//     return data;
//   }
// }
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class Music_App {
//   dynamic id;
//   dynamic name;
//   dynamic bio;
//   dynamic artistImage;
//
//   Music_App({this.id, this.name, this.bio, this.artistImage});
//
//   // Factory constructor to create Music_App from a JSON object
//   factory Music_App.fromJson(Map<String, dynamic> json) {
//     return Music_App(
//       id: json['id'],
//       name: json['name'],
//       bio: json['bio'],
//       artistImage: json['Artist_image'],
//     );
//   }
//
//   // Converts the Music_App object to JSON
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['bio'] = this.bio;
//     data['Artist_image'] = this.artistImage;
//     return data;
//   }
//
//   // Static method to make an API call and return a Music_App object
//   static Future<Music_App?> fetchMusicAppData() async {
//     // Replace with your actual API endpoint URL
//     final String apiUrl = 'https://your-api-endpoint.com/music_app_data';
//
//     try {
//       final response = await http.get(Uri.parse(apiUrl));
//
//       if (response.statusCode == 200) {
//         // Decode the JSON response and convert it to a Music_App object
//         Map<String, dynamic> jsonData = jsonDecode(response.body);
//         return Music_App.fromJson(jsonData);
//       } else {
//         print('Failed to load data. Status code: ${response.statusCode}');
//         return null;
//       }
//     } catch (e) {
//       print('Error fetching data: $e');
//       return null;
//     }
//   }
// }
