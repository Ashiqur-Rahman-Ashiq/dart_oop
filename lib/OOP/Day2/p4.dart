// homework.dart

class Homework {
  // Private fields (data hiding)
  String _title;
  DateTime _dueDate;
  List<String> _tasks;
  List<String> _resources;

  // Constructor
  Homework(this._title, this._dueDate, this._tasks, this._resources);

  // Properties (getters and setters)
  String get title => _title;
  set title(String value) => _title = value;

  DateTime get dueDate => _dueDate;
  set dueDate(DateTime value) => _dueDate = value;

  List<String> get tasks => _tasks;
  List<String> get resources => _resources;
}

class Student {
  String name;
  List<Submission> submissions = [];

  Student(this.name);

  void submitHomework(Homework hw, String answer) {
    submissions.add(Submission(this, hw, answer));
    print('$name submitted homework: ${hw.title}');
  }
}

class Teacher {
  String name;
  List<Homework> assignedHomework = [];

  Teacher(this.name);

  void assignHomework(Homework hw) {
    assignedHomework.add(hw);
    print('$name assigned homework: ${hw.title}');
  }

  void gradeHomework(Submission submission, int grade) {
    submission.grade = grade;
    print('${submission.student.name} received grade $grade for ${submission.homework.title}');
  }
}

class Submission {
  Student student;
  Homework homework;
  String answer;
  int? grade; // Nullable, not graded yet

  Submission(this.student, this.homework, this.answer);
}

void main() {
  // Create teacher and students
  Teacher mrAli = Teacher('Mr. Ali');
  Student s1 = Student('Rahim');
  Student s2 = Student('Karim');

  // Create homework
  Homework mathHw = Homework(
      'Math Homework 1',
      DateTime(2025, 8, 20),
      ['Q1', 'Q2', 'Q3'],
      ['Chapter 5 PDF', 'Lecture Notes']
  );

  // Teacher assigns homework
  mrAli.assignHomework(mathHw);

  // Students submit homework
  s1.submitHomework(mathHw, 'Answers by Rahim');
  s2.submitHomework(mathHw, 'Answers by Karim');

  // Teacher grades homework
  mrAli.gradeHomework(s1.submissions[0], 90);
  mrAli.gradeHomework(s2.submissions[0], 85);
}
