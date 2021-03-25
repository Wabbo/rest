class EmployeeModel {
  String id;
  String employeeName;
  String employeeAge;
  String employeeSalary;
  String profileImage;

  EmployeeModel(this.id, this.employeeName, this.employeeSalary,
      this.employeeAge, this.profileImage);

  factory EmployeeModel.fromJson(var json) {
    return EmployeeModel(json["id"], json["employee_name"],
        json["employee_salary"], json["employee_age"], json["profile_image"]);
  }
}
