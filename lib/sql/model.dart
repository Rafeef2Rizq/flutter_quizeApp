class Question {
  late int id;
  late String name;
  late String A;
  late String B;
  late String C;
  late String D;
  late String S;

  Question. fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.A = map['A'];
    this.B = map['B'];
    this.C = map['C'];
    this.S = map['S'];
    this.D = map['D'];
  }
 Question({

    required this.name,
    required this.A,
    required this.B,
    required this.C,
    required this.D,
    required this.S,
  });
  // Question(int i);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'A': A,
      'B': B,
      'C': C,
      'D': D,
      'S': S,
    };
  }
}