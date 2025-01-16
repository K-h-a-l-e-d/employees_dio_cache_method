import 'dart:convert';
import 'package:employees_dio_cache_method/services/employee_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/employee_model.dart';
import 'employees_details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Employee> employees = [];
  bool isDataFound = false; //this flag will be used to suppress
  // the cacheData button after caching the data

  //retrieving cached Data if Found
  //and if not the cirular loading indicator
  //keeps spinning untill the button is pressed
  Future<void> getCachedEmployeesData() async {
    var prefs = await SharedPreferences.getInstance();
    String responseAsString = prefs.getString("cachedEmployeesData") ?? '';
    if (responseAsString != '') {
      var responseAsJson = jsonDecode(responseAsString);
      //we only need the list of employees Info which the is in the
      //the key ["employees"], then we loop through the list
      //and convert our json employee map to our defined employee class model & then store it in a list
      responseAsJson["employees"].forEach((map) {
        employees.add(Employee.fromJson(map));
      });
      isDataFound = true;
      setState(() {});
    }
  }

  // caching then displaying the data
  void cacheThenDisplayEmployeesData() async {
    await EmployeeService().fetchAndCacheEmployees();
    await getCachedEmployeesData();
  }

  //initiating the function once the UI is built
  @override
  void initState() {
    super.initState();
    getCachedEmployeesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Center(
            heightFactor: 1.5,
            child: !isDataFound
                ? FilledButton(
                    onPressed: () => cacheThenDisplayEmployeesData(),
                    child: Text('Click to Cache data locally'),
                  )
                : Text('Data Fetched & Cached Successfully!'),
          ),
          employees.isEmpty
              ? Expanded(
                  child: Center(
                      child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    CircularProgressIndicator(),
                    Text('No Data found! click the button above to cache Data'),
                    Text('then display it')
                  ],
                )))
              : Expanded(
                  child: ListView.builder(
                    itemCount: employees.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EmployeeDetails(employee: employees[index]),
                            )),
                        child: ListTile(
                          leading: Text(employees[index].id.toString()),
                          title: Text(
                              '${employees[index].firstName} ${employees[index].lastName}'),
                          subtitle: Text(
                              '${employees[index].department} | Salary: \$${employees[index].salary}'),
                          trailing: Icon(Icons.person),
                        ),
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}
