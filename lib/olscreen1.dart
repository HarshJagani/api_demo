import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'overlord1.dart';

class OverlordWidget extends StatefulWidget {
  const OverlordWidget({required Key key}) : super(key: key);

  @override
  State<OverlordWidget> createState() => _OverlordWidgetState();
}

class _OverlordWidgetState extends State<OverlordWidget> {
  List<Overlord> overlordList = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    overlordList = await getData();
    setState(() {});
  }

  Future<List<Overlord>> getData() async {
    final response = await http.get(Uri.parse('https://www.anapioficeandfire.com/api/houses/229'));
    if (response.statusCode == 200) {
      final dynamic data = jsonDecode(response.body);
      if (data is List) {
        return data.map((item) => Overlord.fromJson(item)).toList();
      } else if (data is Map<String, dynamic>) {
        return [Overlord.fromJson(data)];
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 201, 55, 55),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
         itemBuilder: (context, index) {
           return  Container(
             alignment: Alignment.center,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               color: Colors.white,
               boxShadow: const [
                 BoxShadow(
                   color: Colors.black45,
                   blurRadius: 10,
                   spreadRadius: 5,
                   offset: Offset(0, 6),
                 ),
               ],
             ),
           child: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   children: [
                     const Text(
                       'Name: ',
                       style: TextStyle(
                         fontFamily: 'JF',
                         color: Colors.black,
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     Text(
                       overlordList[index].name,
                       style: const TextStyle(
                         fontFamily: 'JF',
                         color: Colors.black,
                         fontSize: 18,
                       ),
                     ),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Text(
                       'Region: ',
                       style: TextStyle(
                         fontFamily: 'JF',
                         color: Colors.black,
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     Expanded(
                       child: Text(
                         overlordList[index].region,
                         style: const TextStyle(
                           fontFamily: 'JF',
                           color: Colors.black,
                           fontSize: 18,
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Text(
                       'Coat of arms: ',
                       style: TextStyle(
                         fontFamily: 'JF',
                         color: Colors.black,
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     Expanded(
                       child: Text(
                         overlordList[index].coatOfArms,
                         style: const TextStyle(
                           fontFamily: 'JF',
                           color: Colors.black,
                           fontSize: 18,
                         ),
                         maxLines: 3,
                       ),
                     ),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Text(
                       'Wods: ',
                       style: TextStyle(
                         fontFamily: 'JF',
                         color: Colors.black,
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     Expanded(
                       child: Text(
                         overlordList[index].words,
                         style: const TextStyle(
                           fontFamily: 'JF',
                           color: Colors.black,
                           fontSize: 18,
                         ),
                         maxLines: 3,
                       ),
                     ),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Text(
                       'Coat of arms: ',
                       style: TextStyle(
                         fontFamily: 'JF',
                         color: Colors.black,
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     Expanded(
                       child: Text(
                         overlordList[index].coatOfArms,
                         style: const TextStyle(
                           fontFamily: 'JF',
                           color: Colors.black,
                           fontSize: 18,
                         ),
                         maxLines: 3,
                       ),
                     ),
                   ],
                 ),
               ),  Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Text(
                       'Titles: ',
                       style: TextStyle(
                         fontFamily: 'JF',
                         color: Colors.black,
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     Expanded(
                       child: Text(
                         overlordList[index].titles.join(', '),
                         style: const TextStyle(
                           fontFamily: 'JF',
                           color: Colors.black,
                           fontSize: 18,
                         ),
                         maxLines: 3,
                       ),
                     ),
                   ],
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Text(
                       'Seats: ',
                       style: TextStyle(
                         fontFamily: 'JF',
                         color: Colors.black,
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     Expanded(
                       child: Text(
                         overlordList[index].seats.join(', '),
                         style: const TextStyle(
                           fontFamily: 'JF',
                           color: Colors.black,
                           fontSize: 18,
                         ),
                         maxLines: 3
                       ),
                     ),
                   ],
                 ),
               ),
               // Add more rows here based on your UI structure
             ],
           ),
           );
         },
         itemCount: overlordList.length,

        ),
      ),
    );
  }
}
