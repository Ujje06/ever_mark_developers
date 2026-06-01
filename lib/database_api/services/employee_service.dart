// What This File Does
//
// This file handles:
//
// Employee-specific API operations
//
// Such as:
//
// fetch employees
// add employee
// update employee
// delete employee
//
// This file uses:
//
// ApiService
//
// internally.









//
//
//
// VERY IMPORTANT THINGS HERE
// 1. fetchEmployees()
//
// This:
//
// (response as List)
//
// because API returns:
//
// [
// {},
// {},
// {}
// ]
//
// which is a List.
//
// 2. .map()
//
// Converts:
//
// JSON List
//
// into:
//
// List<EmployeeModel>
//
// VERY IMPORTANT concept.
//
// 3. EmployeeModel.fromJson()
//
// Each JSON object becomes Dart object.
//
// Example:
//
// {
// "employeeId": 1
// }
//
// becomes:
//
// EmployeeModel(...)
// 4. employee.toJson()
//
// Converts Dart object back to JSON when:
//
// adding
// updating

















import '../config/api_constants.dart';
import '../models/employee_model.dart';
import 'api_service.dart';

class EmployeeService {

  final ApiService _apiService =
  ApiService();

  // GET Employees
  Future<List<EmployeeModel>>
  fetchEmployees() async {

    final response =
    await _apiService.getApi(

      url:
      "${ApiConstants.baseUrl}"
          "${ApiConstants.employees}",
    );

    List<EmployeeModel> employees =

    (response as List).map((employee) {

      return EmployeeModel.fromJson(
        employee,
      );

    }).toList();

    return employees;
  }

  // ADD Employee
  Future<dynamic> addEmployee({
    required EmployeeModel employee,
  }) async {

    return await _apiService.postApi(

      url:
      "${ApiConstants.baseUrl}"
          "${ApiConstants.employees}",

      body: employee.toJson(),
    );
  }

  // UPDATE Employee
  Future<dynamic> updateEmployee({
    required EmployeeModel employee,
  }) async {

    return await _apiService.putApi(

      url:
      "${ApiConstants.baseUrl}"
          "${ApiConstants.employees}"
          "/${employee.employeeId}",

      body: employee.toJson(),
    );
  }

  // DELETE Employee
  Future<dynamic> deleteEmployee({
    required int employeeId,
  }) async {

    return await _apiService.deleteApi(

      url:
      "${ApiConstants.baseUrl}"
          "${ApiConstants.employees}"
          "/$employeeId",
    );
  }
}


