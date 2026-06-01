// It handles:
//
// GET requests
// POST requests
// PUT requests
// DELETE requests
//
// instead of writing HTTP code again and again everywhere.





//
//
// What You Learned Here
// http.get()
//
// Fetch data.
//
// http.post()
//
// Send new data.
//
// http.put()
//
// Update existing data.
//
// http.delete()
//
// Delete data.
//
// _handleResponse()
//
// Very important.
//
// Instead of checking status code everywhere:





import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {

  // GET API
  Future<dynamic> getApi({
    required String url,
  }) async {

    try {

      final response = await http.get(
        Uri.parse(url),
      );

      return _handleResponse(response);

    } catch (e) {

      throw Exception(e.toString());
    }
  }

  // POST API
  Future<dynamic> postApi({
    required String url,
    required Map<String, dynamic> body,
  }) async {

    try {

      final response = await http.post(
        Uri.parse(url),

        headers: {
          "Content-Type": "application/json",
        },

        body: jsonEncode(body),
      );

      return _handleResponse(response);

    } catch (e) {

      throw Exception(e.toString());
    }
  }

  // PUT API
  Future<dynamic> putApi({
    required String url,
    required Map<String, dynamic> body,
  }) async {

    try {

      final response = await http.put(
        Uri.parse(url),

        headers: {
          "Content-Type": "application/json",
        },

        body: jsonEncode(body),
      );

      return _handleResponse(response);

    } catch (e) {

      throw Exception(e.toString());
    }
  }

  // DELETE API
  Future<dynamic> deleteApi({
    required String url,
  }) async {

    try {

      final response = await http.delete(
        Uri.parse(url),
      );

      return _handleResponse(response);

    } catch (e) {

      throw Exception(e.toString());
    }
  }

  // Common Response Handler
  dynamic _handleResponse(http.Response response) {

    switch (response.statusCode) {

      case 200:
      case 201:

        return jsonDecode(response.body);

      case 400:

        throw Exception("Bad Request");

      case 401:

        throw Exception("Unauthorized");

      case 404:

        throw Exception("Not Found");

      case 500:

        throw Exception("Server Error");

      default:

        throw Exception(
          "Something Went Wrong",
        );
    }
  }
}