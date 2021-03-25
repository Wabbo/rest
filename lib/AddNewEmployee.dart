import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewEmployee extends StatefulWidget {
  @override
  _AddNewEmployeeStat createState() => _AddNewEmployeeStat();
}

class _AddNewEmployeeStat extends State<AddNewEmployee> {
  final name = TextEditingController();
  final age = TextEditingController();

  void postRequest() async {
    String API = "http://dummy.restapiexample.com/api/v1/create";
    Dio dio = new Dio();
    Response response = await dio
        .post(API, data: {"name": "${name.text}", "age": "${age.text}"});
    print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Add Employee',
          style: TextStyle(fontSize: 35, color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
              controller: name,
              decoration: InputDecoration(hintText: 'Employee Name')),
          TextField(
              controller: age,
              decoration: InputDecoration(hintText: 'Employee age')),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
            child: Text(
              'ADD',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () {
              postRequest();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
