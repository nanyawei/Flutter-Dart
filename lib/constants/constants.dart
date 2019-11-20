class CateKind {
  String local;
  String kindName;

  CateKind(this.local, this.kindName);
}

class Movie {
  int count;
  int start;
  List<Subject> subjects;

  Movie({
    this.count,
    this.start,
    this.subjects
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    print(json);
    print(';;;;;;;;;;;;;;;;;;;;;;;');

    return Movie(
      count: json['count'] as int,
      start: json['start'] as int,
      subjects: json['subjects'] as List<Subject>
    );
  }


}

class Subject {
  int comments_count;
  List<String> countries;
  List<Cast> casts;
  List<Cast> directors;
  int id;

  Subject({
    this.casts,
    this.comments_count,
    this.countries,
    this.directors,
    this.id
  });

  factory Subject.fromJson (Map<String, dynamic> json) {
    return Subject(
      casts: json['casts'],
      comments_count: json['comments_count'],
      countries: json['countries'],
      directors: json['directors'],
      id: json['id']
    );
  }
}

class Cast {
  String name;
  List<Avatar> avatars;

  Cast({
    this.avatars,
    this.name
  });
}

class Avatar {
  String large;
  String small;

  Avatar({this.large, this.small});

}