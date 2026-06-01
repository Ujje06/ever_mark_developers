// What This File Does
//
// This file creates a:
//
// Common response structure
//
// for API operations.
//
// Instead of randomly handling:
//
// success
// loading
// error
//
// everywhere differently.






//
// WHAT IS <T>
//
// VERY IMPORTANT GENERIC CONCEPT.
//
// <T>
//
// means:
//
// This class can store ANY datatype
//
// Example:
//
// ApiResponse<List<EmployeeModel>>
//
// OR
//
// ApiResponse<String>
//
// OR
//
// ApiResponse<int>
//
// Flexible reusable design.
//
// Professional coding concept.









class ApiResponse<T> {

  final bool success;

  final String message;

  final T? data;

  ApiResponse({
    required this.success,
    required this.message,
    this.data,
  });
}


