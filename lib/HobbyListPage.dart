import 'package:flutter/material.dart';
import 'package:flutter_api_app/models/ApiResponse.dart';
import 'package:flutter_api_app/utils/ApiManager.dart';

import 'models/Hobby.dart';

class HobbyListPage extends StatefulWidget {
  const HobbyListPage({super.key});

  @override
  State<HobbyListPage> createState() => _HobbyListPageState();
}

class _HobbyListPageState extends State<HobbyListPage> {
  List<Hobby> hobbyList = <Hobby>[];

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  getData() async {
    ApiResponse<List<Hobby>> response = await ApiManager().getHobbyList();
    hobbyList = response.data!;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hobbly List"),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: hobbyList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(hobbyList[index].name),
              );
            }),
      ),
    );
  }
}
