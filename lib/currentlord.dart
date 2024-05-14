import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'currentlordmodel.dart';

class CurrenLord1 extends StatefulWidget {
  const CurrenLord1({super.key});

  @override
  State<CurrenLord1> createState() => _CurrenLord1State();
}

class _CurrenLord1State extends State<CurrenLord1> {

List<CurrentLord> currentlordlist = [];

@override
  void initState() {
  fetchData();
  super.initState();
}

fetchData() async {
  currentlordlist = await getData();
  setState(() {});
}

  Future<List<CurrentLord>> getData() async {
    final response = await http.get(Uri.parse('https://www.anapioficeandfire.com/api/characters/298'));
    if (response.statusCode == 200) {
      final dynamic data = jsonDecode(response.body);
      if (data is List) {
        return data.map((item) => CurrentLord.fromJson(item)).toList();
      } else if (data is Map<String, dynamic>) {
        return [CurrentLord.fromJson(data)];
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
                          currentlordlist[index].name,
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
                          'Gender: ',
                          style: TextStyle(
                            fontFamily: 'JF',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            currentlordlist[index].gender,
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
                          'Culture: ',
                          style: TextStyle(
                            fontFamily: 'JF',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            currentlordlist[index].culture,
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
                          'Born: ',
                          style: TextStyle(
                            fontFamily: 'JF',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            currentlordlist[index].born,
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
                          'Died: ',
                          style: TextStyle(
                            fontFamily: 'JF',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            currentlordlist[index].died,
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
                            currentlordlist[index].titles.join(', '),
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
                          'Alias: ',
                          style: TextStyle(
                            fontFamily: 'JF',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            currentlordlist[index].aliases.join(', '),
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
                          'Father: ',
                          style: TextStyle(
                            fontFamily: 'JF',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            currentlordlist[index].father,
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
                          'Mother: ',
                          style: TextStyle(
                            fontFamily: 'JF',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            currentlordlist[index].mother,
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
                          'Spouse: ',
                          style: TextStyle(
                            fontFamily: 'JF',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            currentlordlist[index].spouse,
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
                          'Alias: ',
                          style: TextStyle(
                            fontFamily: 'JF',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            currentlordlist[index].aliases.join(', '),
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
                  // Add more rows here based on your UI structure
                ],
              ),
            );
          },
          itemCount: currentlordlist.length,

        ),
      ),
    );
  }
}
