import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'currentlord.dart';
import 'model.dart';
import 'olscreen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 201, 55, 55),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Welcome> welcomeList = [];
  @override
  void initState() {
    getd();
    super.initState();
  }

  getd()
  async {
    welcomeList = await getData();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: welcomeList.isNotEmpty?
      ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(color: Colors.black45,
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: Offset(0, 6)
                ),
              ]
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text('Name: ',
                      style: TextStyle(
                        fontFamily: 'JF',
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                      Text(welcomeList[index].name,
                        style: const TextStyle(
                            fontFamily: 'JF',
                            color: Colors.black,
                            fontSize: 18,
                        ),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Rigion: ',
                        style: TextStyle(
                            fontFamily: 'JF',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),),
                      Expanded(
                        child: Text(welcomeList[index].region,
                          style: const TextStyle(
                              fontFamily: 'JF',
                              color: Colors.black,
                              fontSize: 18
                          ),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Coat of arms: ',
                        style: TextStyle(
                            fontFamily: 'JF',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),),
                      Expanded(
                        child: Text(welcomeList[index].coatOfArms,
                          maxLines: 3,
                          style: const TextStyle(
                              fontFamily: 'JF',
                              color: Colors.black,
                              fontSize: 18
                          ),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text('Words: ',
                        style: TextStyle(
                            fontFamily: 'JF',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),),
                      Text(welcomeList[index].words,
                        style: const TextStyle(
                            fontFamily: 'JF',
                            color: Colors.black,
                            fontSize: 18
                        ),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Current lord: ',
                        style: TextStyle(
                            fontFamily: 'JF',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      welcomeList[index].currentLord.isNotEmpty? GestureDetector(
                        child: const Text('Go to Current lord',
                          style: TextStyle(
                              fontFamily: 'JF',
                              color: Colors.blue,
                              fontSize: 18,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const CurrenLord1(),));
                        },
                      ) : const Text(''),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Overlord: ',
                        style: TextStyle(
                            fontFamily: 'JF',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),),
                      Expanded(
                        child:
                        welcomeList[index].overlord.isNotEmpty? GestureDetector(
                          child: const Text('Go to Overlord',
                            style: TextStyle(
                                fontFamily: 'JF',
                                color: Colors.blue,
                                fontSize: 18,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue
                          ),
                          ),onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const OverlordWidget(key: Key('')),));
                          },
                        ) : const Text(''),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Founded: ',
                        style: TextStyle(
                            fontFamily: 'JF',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),),
                      Expanded(
                        child: Text('${welcomeList[index].founded}',
                          style: const TextStyle(
                              fontFamily: 'JF',
                              color: Colors.black,
                              fontSize: 18
                          ),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Founder: ',
                        style: TextStyle(
                            fontFamily: 'JF',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),),
                      Expanded(
                        child:
                        welcomeList[index].overlord.isNotEmpty? const Text('Go to Founder',
                          style: TextStyle(
                              fontFamily: 'JF',
                              color: Colors.blue,
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue
                          ),
                        ) : const Text(''),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        );
      }, separatorBuilder: (context, index) {
        return const SizedBox(height: 20,);
      }, itemCount: welcomeList.length):const Center(child: CircularProgressIndicator())
    );
  }
  Future<List<Welcome>> getData() async{
    final response = await http.get(Uri.parse('https://www.anapioficeandfire.com/api/houses'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map <String, dynamic> index in data){
        welcomeList.add(Welcome.fromJson(index));
        print(welcomeList);
      }
      return welcomeList;
    }
    else{
      return welcomeList;
    }
  }
}

