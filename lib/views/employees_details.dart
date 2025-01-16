import 'package:flutter/material.dart';
import '../models/employee_model.dart';

class EmployeeDetails extends StatelessWidget {
  const EmployeeDetails({super.key, required this.employee});

  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Employees detailed Info'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ID: ${employee.id}'),
          Text('Name: ${employee.firstName} ${employee.lastName}'),
          Text('Gender: ${employee.gender}'),
          Text('Email: ${employee.email}'),
          Text('Address: ${employee.address}'),
          Text('Phone: ${employee.phone}'),
          Text('Birth Date: ${employee.birthDate}'),
          Text('Department: ${employee.department}'),
          Text('Salary: \$${employee.salary}'),
        ],
      ),
    );
  }
}
