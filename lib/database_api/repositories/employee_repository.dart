// STEP 5 → employee_repository.dart
//
// Path:
//
// lib/database_api/repositories/employee_repository.dart
// What This File Does
//
// This file is the:
//
// Middleman layer
//
// between:
//
// Provider/UI
// Service/API
// FLOW
// UI
// ↓
// Provider
// ↓
// Repository
// ↓
// Service
// ↓
// API
// Why Repository Exists
//
// Right now you only use:
//
// API
//
// But later you may use:
//
// local database
// cache
// offline storage
// Firebase
// SQLite
//
// Repository decides:
//
// where data should come from
//
// Professional architecture.




// SIMPLE UNDERSTANDING
//
// Currently repository mostly forwards calls:
//
// Repository → Service
//
// But later this becomes powerful.




import '../models/employee_model.dart';
import '../services/employee_service.dart';

class EmployeeRepository {

  final EmployeeService _employeeService =
  EmployeeService();

  // GET Employees
  Future<List<EmployeeModel>>
  fetchEmployees() async {

    return await _employeeService
        .fetchEmployees();
  }

  // ADD Employee
  Future<dynamic> addEmployee({
    required EmployeeModel employee,
  }) async {

    return await _employeeService
        .addEmployee(
      employee: employee,
    );
  }

  // UPDATE Employee
  Future<dynamic> updateEmployee({
    required EmployeeModel employee,
  }) async {

    return await _employeeService
        .updateEmployee(
      employee: employee,
    );
  }

  // DELETE Employee
  Future<dynamic> deleteEmployee({
    required int employeeId,
  }) async {

    return await _employeeService
        .deleteEmployee(
      employeeId: employeeId,
    );
  }
}