class CateKind {
  String local;
  String kindName;

  CateKind(this.local, this.kindName);
}

// 手写声明
class Movie {
  int count;
  int start;
  int total;
  List<Subject> subjects;

  Movie({
    this.count,
    this.start,
    this.total,
    this.subjects
  });

  factory Movie.fromJson(Map<String, dynamic> json) {

    var subjects = json['subjects'] as List;
    List<Subject> subjectsList = subjects.map((s) => Subject.fromJson(s)).toList();

    print(subjectsList.map((sub) {
      print(sub.year);
    }));

    return Movie(
      count: json['count'] as int,
      start: json['start'] as int,
      total: json['total'] as int,
      subjects: subjectsList
    );
  }
}

class Subject {
  List<Cast> casts;
  int comments_count;
  List<String> countries;
  List<Cast> directors;
  int id;
  List<String> genres;
  Size images;
  String original_title;
  Rating rating;
  int reviews_count;
  String summary;
  String title;
  String warning;
  int wish_count;
  int year;

  Subject({
    this.casts,
    this.comments_count,
    this.countries,
    this.directors,
    this.genres,
    this.id,
    this.images,
    this.original_title,
    this.rating,
    this.reviews_count,
    this.summary,
    this.title,
    this.warning,
    this.wish_count,
    this.year,
  });

  factory Subject.fromJson (Map<String, dynamic> json) {
    var casts = json['casts'] as List;
    List<Cast> castsList = casts.map((c) => Cast.fromJson(c)).toList();

    var countries = json['countries'] as List;
    List<String> countriesList = List<String>.from(countries);

    var directors = json['directors'] as List;
    List<Cast> directorsList = directors.map((d) => Cast.fromJson(d)).toList();

    var genres = json['genres'] as List;
    List<String> genresList = List<String>.from(genres);


    return Subject(
      comments_count: json['comments_count'],
      countries: countriesList,
      casts: castsList,
      directors: directorsList,
      genres: genresList,
      id: json['id'],
      images: Size.fromJson(json['images']),
      original_title: json['original_title'],
      rating: Rating.fromJson(json['rating']),
      reviews_count: json['reviews_count'],
      summary: json['summary'],
      title: json['title'],
      warning: json['warning'],
      wish_count: json['wish_count'],
      year: json['year']
    );
  }
}

class Cast {
  String name;
  Size avatars;

  Cast({
    this.avatars,
    this.name
  });

  factory Cast.fromJson (Map<String, dynamic> json ) {
    return Cast(
      name: json['name'],
      avatars: Size.fromJson(json['avatars'])
    );
  }
}

class Size {
  String large;
  String small;
  String normal;

  Size({this.large, this.small, this.normal});

  factory Size.fromJson (Map<String, dynamic> json) {
    return Size(large: json['large'], small: json['small'], normal: json['normal']);
  }
}

class Rating {
  double average;
  int max;
  int min;
  String stars;

  Rating({
    this.average,
    this.max,
    this.min,
    this.stars
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: json['average'],
      max: json['max'],
      min: json['min'],
      stars: json['stars']
    );
  }
}
