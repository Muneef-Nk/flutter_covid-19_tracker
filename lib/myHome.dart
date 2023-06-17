import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<Covid?> fetchData()async{
  final response = await http.get('https://corona.lmao.ninja/v2/all?yesterday=false');
  if(response.statusCode==200){
    return Covid.fromJson(json.decode(response.body));
  }else{
    throw Exception('Failed to load covid');
  }
}

class Covid {
  final int cases;
  final int death;
  final int recovered;
  final int active;
  final int update;

  Covid({ required this.cases,
    required this.death,
    required this.recovered,
    required this.active,
    required this.update,}
      );

  factory Covid.fromJson(Map<String, dynamic> jsno){
    return Covid(cases: jsno['cases'],
        death:jsno['deaths'],
        recovered:jsno['recovered'],
        active:jsno['active'],
        update:jsno['update']
    );
  }
}


class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late Future<Covid?> futureCovid;
  @override
  void initState() {
    futureCovid=fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: FutureBuilder<Covid?>(
       builder: (context, snapshot){

         if(snapshot.hasData){
           return
           Column(
             children: [
               Text('${snapshot.data?.cases}'),
             ],
           );
         }else if(snapshot.hasError){
           return Text('${snapshot.hasError}');
         }
         throw Exception('Failed to load covid');
       },
     ),
    );
  }
}
