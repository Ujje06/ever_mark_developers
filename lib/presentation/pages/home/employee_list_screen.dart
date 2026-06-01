import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../database_api/providers/employee_provider.dart';






class EmployeeListScreen
    extends StatefulWidget {

  const EmployeeListScreen({
    super.key,
  });

  @override
  State<EmployeeListScreen>
  createState() =>
      _EmployeeListScreenState();
}

class _EmployeeListScreenState
    extends State<EmployeeListScreen> {

  @override
  void initState() {

    super.initState();

    Future.microtask(() {

      context
          .read<EmployeeProvider>()
          .fetchEmployees();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Employees",
        ),
      ),

      body: Consumer<EmployeeProvider>(

        builder: (
            context,
            provider,
            child,
            ) {

          // Loading
          if (provider.isLoading &&
              provider.employees.isEmpty) {

            return const Center(
              child:
              CircularProgressIndicator(),
            );
          }

          // Error
          if (provider.errorMessage
              .isNotEmpty) {

            return Center(
              child: Text(
                provider.errorMessage,
              ),
            );
          }

          // Empty
          if (provider.employees.isEmpty) {

            return const Center(
              child: Text(
                "No Employees Found",
              ),
            );
          }

          // Employee List
          return RefreshIndicator(

            onRefresh: () async {

              await provider
                  .fetchEmployees();
            },

            child: ListView.builder(

              itemCount:
              provider.employees.length,

              itemBuilder: (
                  context,
                  index,
                  ) {

                final employee =
                provider.employees[index];

                return Card(

                  margin:
                  const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),

                  child: ListTile(

                    leading: CircleAvatar(
                      child: Text(
                        employee.employeeId
                            .toString(),
                      ),
                    ),

                    title: Text(
                      employee.employeeName,
                    ),

                    subtitle: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                      children: [

                        Text(
                          employee
                              .employeeDesignation,
                        ),

                        Text(
                          employee
                              .employeeNumber,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}