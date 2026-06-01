class EmployeeModel {

  final int employeeId;
  final String employeeNumber;
  final String employeeName;
  final int employeeAge;
  final String employeeDesignation;
  final String? employeeOneLineAddress;
  final bool? employeeStatus;

  EmployeeModel({
    required this.employeeId,
    required this.employeeNumber,
    required this.employeeName,
    required this.employeeAge,
    required this.employeeDesignation,
    this.employeeOneLineAddress,
    this.employeeStatus,
  });

  // JSON -> Dart Object
  factory EmployeeModel.fromJson(Map<String, dynamic> json) {

    return EmployeeModel(
      employeeId: json['employeeId'],
      employeeNumber: json['employeeNumber'],
      employeeName: json['employeeName'],
      employeeAge: json['employeeAge'],
      employeeDesignation: json['employeeDesignation'],
      employeeOneLineAddress: json['employeeOneLineAddress'],
      employeeStatus: json['employeeStatus'],
    );
  }

  // Dart Object -> JSON
  Map<String, dynamic> toJson() {

    return {
      'employeeId': employeeId,
      'employeeNumber': employeeNumber,
      'employeeName': employeeName,
      'employeeAge': employeeAge,
      'employeeDesignation': employeeDesignation,
      'employeeOneLineAddress': employeeOneLineAddress,
      'employeeStatus': employeeStatus,
    };
  }
}