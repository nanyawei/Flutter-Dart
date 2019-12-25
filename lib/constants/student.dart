String jsonString = ''' 
  { 
    "id":"123", 
    "name":"张三", 
    "score" : 95, 
    "teachers": [ 
      { 
        "name": "李四", 
        "age" : 40 
      }, 
      {
        "name": "王五", 
        "age" : 45 
      } 
    ] 
  } 
''';
class Teacher {
  String name;
  int age;

  Teacher({this.age, this.name});

  factory Teacher.formJson(Map<String, dynamic> json) {
    return Teacher(
      name: json['name'],
      age: json['age']
    );
  }
}

class Student {
  String id;
  String name;
  double score;
  List<Teacher> teacher;

  Student({
    this.name,
    this.id,
    this.score,
    this.teacher
  });

  factory Student.formJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      score: json['score'],
      teacher: json['teacher'].map((t) => Teacher.formJson(t)).toList() 
    );
  }
}