// import 'package:flutter/material.dart';
// import 'package:meal_time/api_cal/model.dart';
//
// class api extends StatefulWidget {
//   const api({super.key});
//
//   @override
//   State<api> createState() => _apiState();
// }
//
// class _apiState extends State<api> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: call(),
//     );
//   }
// }
//
// class call extends StatefulWidget {
//   const call({super.key});
//
//   @override
//   State<call> createState() => _callState();
// }
//
// class _callState extends State<call> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("api_call"),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Music_App();
//               },
//               icon: Icon(Icons.add_circle))
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           MusicAppScreen();
//         },
//       ),
//       body: MusicAppScreen(),
//     );
//   }
// }
//
// class MusicAppScreen extends StatefulWidget {
//   @override
//   _MusicAppScreenState createState() => _MusicAppScreenState();
// }
//
// class _MusicAppScreenState extends State<MusicAppScreen> {
//   Music_App? musicAppData;
//
//   @override
//   void initState() {
//     super.initState();
//     // Fetch the data when the screen initializes
//     fetchMusicData();
//   }
//
//   Future<void> fetchMusicData() async {
//     Music_App? data = await Music_App.fetchMusicAppData();
//     setState(() {
//       musicAppData = data;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('Music App')),
//         body: musicAppData != null
//             ? Center(child: CircularProgressIndicator())
//             : Column(
//                 children: [
//                   Text('Name: ${musicAppData!.name}'),
//                   Text('Bio: ${musicAppData!.bio}'),
//                   Image.network(musicAppData!.artistImage ?? ''),
//                 ],
//               ));
//   }
// }
