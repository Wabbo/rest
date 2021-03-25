import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'AddNewEmployee.dart';
import 'EmployeeModel.dart';

Future<List<EmployeeModel>> fetch() async {
  String API = "http://dummy.restapiexample.com/api/v1/employees";
  List<EmployeeModel> employees = new List<EmployeeModel>();
  Dio dio = new Dio();
  Response response = await dio.get(API);
  var res = response.data;
  var allData = res["data"];
  for (var obj in allData) {
    EmployeeModel emp = new EmployeeModel.fromJson(obj);
    employees.add(emp);
  }
  return employees;
}

class EmployeeListView extends StatefulWidget {
  @override
  _EmployeeListViewStat createState() => _EmployeeListViewStat();
}

class _EmployeeListViewStat extends State<EmployeeListView> {
  Future<List<EmployeeModel>> employees;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    employees = fetch();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Employees',
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<EmployeeModel>>(
          future: employees,
          builder: (context, snapShot) {
            if (snapShot.hasError) {
              return ErrorWidget('exception');
            }
            List<EmployeeModel> employees = snapShot.data ?? [];
            return ListView.builder(
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  EmployeeModel employee = employees[index];
                  return new Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Align(
                          child: Text(
                            ' ${employee.employeeName}\n',
                            style: TextStyle(fontSize: 25),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        Align(
                          child: Text(
                            '     Age : ${employee.employeeAge}',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          alignment: Alignment.centerLeft,
                        )
                      ],
                    ),
                  );
                });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => AddNewEmployee()));
          },
          child: Icon(Icons.add)),
    );
  }
}
