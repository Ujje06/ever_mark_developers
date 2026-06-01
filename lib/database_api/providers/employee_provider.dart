
// What This File Does
//
// This file handles:
//
// State Management
//
// It:
//
// stores employee list
// stores loading state
// calls repository
// updates UI automatically
//
// using:
//
// notifyListeners()










//
//
//
// VERY IMPORTANT CONCEPTS
// 1. ChangeNotifier
//
// This gives:
//
// notifyListeners()
//
// which automatically rebuilds UI.
//
// 2. notifyListeners()
//
// Whenever data changes:
//
// notifyListeners();
//
// tells Flutter UI:
//
// "Refresh yourself"
//
// VERY IMPORTANT.
//
// 3. _employees
//
// Stores employee list in memory.
//
// 4. _isLoading
//
// Used for:
//
// loading spinner
// shimmer
// progress indicator
// 5. _errorMessage
//
// Stores API/network errors.
//
// Useful for Snackbar/dialog.
//
// 6. Why fetchEmployees() after add/update/delete
//
// Because after CRUD operation:
// we refresh latest database data.
//
// Simple and reliable.







import 'package:flutter/material.dart';

import '../models/employee_model.dart';
import '../repositories/employee_repository.dart';

class EmployeeProvider
    extends ChangeNotifier {

  final EmployeeRepository
  _employeeRepository =
  EmployeeRepository();

  // Employee List
  List<EmployeeModel> _employees = [];

  List<EmployeeModel> get employees =>
      _employees;

  // Loading State
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  // Error Message
  String _errorMessage = "";

  String get errorMessage =>
      _errorMessage;

  // FETCH Employees
  Future<void> fetchEmployees() async {

    try {

      _isLoading = true;

      notifyListeners();

      _employees =
      await _employeeRepository
          .fetchEmployees();

      _errorMessage = "";

    } catch (e) {

      _errorMessage = e.toString();
    }

    _isLoading = false;

    notifyListeners();
  }

  // ADD Employee
  Future<void> addEmployee({
    required EmployeeModel employee,
  }) async {

    try {

      _isLoading = true;

      notifyListeners();

      await _employeeRepository
          .addEmployee(
        employee: employee,
      );

      await fetchEmployees();

    } catch (e) {

      _errorMessage = e.toString();
    }

    _isLoading = false;

    notifyListeners();
  }

  // UPDATE Employee
  Future<void> updateEmployee({
    required EmployeeModel employee,
  }) async {

    try {

      _isLoading = true;

      notifyListeners();

      await _employeeRepository
          .updateEmployee(
        employee: employee,
      );

      await fetchEmployees();

    } catch (e) {

      _errorMessage = e.toString();
    }

    _isLoading = false;

    notifyListeners();
  }

  // DELETE Employee
  Future<void> deleteEmployee({
    required int employeeId,
  }) async {

    try {

      _isLoading = true;

      notifyListeners();

      await _employeeRepository
          .deleteEmployee(
        employeeId: employeeId,
      );

      await fetchEmployees();

    } catch (e) {

      _errorMessage = e.toString();
    }

    _isLoading = false;

    notifyListeners();
  }
}