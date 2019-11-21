// 工具生成声明
import 'package:json_annotation/json_annotation.dart'; 
  
part 'movie.g.dart';


@JsonSerializable()
  class movie extends Object {

  @JsonKey(name: 'count')
  int count;

  @JsonKey(name: 'start')
  int start;

  @JsonKey(name: 'subjects')
  List<Subjects> subjects;

  @JsonKey(name: 'total')
  int total;

  movie(this.count,this.start,this.subjects,this.total,);

  factory movie.fromJson(Map<String, dynamic> srcJson) => _$movieFromJson(srcJson);

}

  
@JsonSerializable()
  class Subjects extends Object {

  @JsonKey(name: 'casts')
  List<Casts> casts;

  @JsonKey(name: 'comments_count')
  int commentsCount;

  @JsonKey(name: 'countries')
  List<String> countries;

  @JsonKey(name: 'directors')
  List<Directors> directors;

  @JsonKey(name: 'genres')
  List<String> genres;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'images')
  Images images;

  @JsonKey(name: 'original_title')
  String originalTitle;

  @JsonKey(name: 'rating')
  Rating rating;

  @JsonKey(name: 'reviews_count')
  int reviewsCount;

  @JsonKey(name: 'summary')
  String summary;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'warning')
  String warning;

  @JsonKey(name: 'wish_count')
  int wishCount;

  @JsonKey(name: 'year')
  int year;

  Subjects(this.casts,this.commentsCount,this.countries,this.directors,this.genres,this.id,this.images,this.originalTitle,this.rating,this.reviewsCount,this.summary,this.title,this.warning,this.wishCount,this.year,);

  factory Subjects.fromJson(Map<String, dynamic> srcJson) => _$SubjectsFromJson(srcJson);

}

  
@JsonSerializable()
  class Casts extends Object {

  @JsonKey(name: 'avatars')
  Avatars avatars;

  @JsonKey(name: 'name')
  String name;

  Casts(this.avatars,this.name,);

  factory Casts.fromJson(Map<String, dynamic> srcJson) => _$CastsFromJson(srcJson);

}

  
@JsonSerializable()
  class Avatars extends Object {

  @JsonKey(name: 'large')
  String large;

  Avatars(this.large,);

  factory Avatars.fromJson(Map<String, dynamic> srcJson) => _$AvatarsFromJson(srcJson);

}

  
@JsonSerializable()
  class Directors extends Object {

  @JsonKey(name: 'avatars')
  Avatars avatars;

  @JsonKey(name: 'name')
  String name;

  Directors(this.avatars,this.name,);

  factory Directors.fromJson(Map<String, dynamic> srcJson) => _$DirectorsFromJson(srcJson);

}

@JsonSerializable()
  class Images extends Object {

  @JsonKey(name: 'large')
  String large;

  Images(this.large,);

  factory Images.fromJson(Map<String, dynamic> srcJson) => _$ImagesFromJson(srcJson);

}

  
@JsonSerializable()
  class Rating extends Object {

  @JsonKey(name: 'average')
  double average;

  @JsonKey(name: 'max')
  int max;

  @JsonKey(name: 'min')
  int min;

  @JsonKey(name: 'stars')
  String stars;

  Rating(this.average,this.max,this.min,this.stars,);

  factory Rating.fromJson(Map<String, dynamic> srcJson) => _$RatingFromJson(srcJson);

}

  
