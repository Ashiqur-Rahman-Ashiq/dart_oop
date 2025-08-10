
class Employee {
  String name;
  int salary;

  Employee({required this.name, required this.salary});

  @override
  String toString() => 'Employee(name: $name, salary: $salary)';
}



void main () {

  List<Employee> employees = [
    Employee(name: 'Dolon', salary: 45000),
    Employee(name: 'Rafi', salary: 34000),
    Employee(name: 'Hasan', salary: 56000),
    Employee(name: 'Salma', salary: 45000),
  ];


  Employee minSalary = employees[0];
  Employee maxSalary = employees[0];

  for(Employee employee in employees) {
    if(minSalary.salary > employee.salary) {
      minSalary = employee;
    } 
    
    if(maxSalary.salary < employee.salary) {
      maxSalary = employee;
    }
  }

  print("MinSelary : $minSalary");
  print("MaxSelary : $maxSalary");

  print("MaxSelary : ${maxSalary.toString()}");
  

}