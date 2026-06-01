// What This File Does
//
// This file converts:
//
// Ugly technical errors
//
// into:
//
// Readable user-friendly messages
//
// Example:
//
// Instead of showing:
//
// SocketException: Failed host lookup
//
// you can show:
//
// No Internet Connection
//
// Much cleaner.






// SIMPLE UNDERSTANDING
//
// This file is basically:
//
// Error Translator
//
// Technical Error:
//
// SocketException
//
// Readable Error:
//
// No Internet Connection









class ExceptionHandler {

  static String handleError(
      dynamic error,
      ) {

    final errorMessage =
    error.toString();

    // No Internet
    if (errorMessage.contains(
      "SocketException",
    )) {

      return "No Internet Connection";
    }

    // Timeout
    else if (errorMessage.contains(
      "TimeoutException",
    )) {

      return "Request Timeout";
    }

    // Server Error
    else if (errorMessage.contains(
      "500",
    )) {

      return "Server Error";
    }

    // Not Found
    else if (errorMessage.contains(
      "404",
    )) {

      return "API Not Found";
    }

    // Unauthorized
    else if (errorMessage.contains(
      "401",
    )) {

      return "Unauthorized Access";
    }

    // Default Error
    else {

      return "Something Went Wrong";
    }
  }
}












