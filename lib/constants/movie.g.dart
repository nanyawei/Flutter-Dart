// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

movie _$movieFromJson(Map<String, dynamic> json) {
  return movie(
      json['count'] as int,
      json['start'] as int,
      (json['subjects'] as List)
          ?.map((e) =>
              e == null ? null : Subjects.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['total'] as int);
}

Map<String, dynamic> _$movieToJson(movie instance) => <String, dynamic>{
      'count': instance.count,
      'start': instance.start,
      'subjects': instance.subjects,
      'total': instance.total
    };

Subjects _$SubjectsFromJson(Map<String, dynamic> json) {
  return Subjects(
      (json['casts'] as List)
          ?.map((e) =>
              e == null ? null : Casts.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['comments_count'] as int,
      (json['countries'] as List)?.map((e) => e as String)?.toList(),
      (json['directors'] as List)
          ?.map((e) =>
              e == null ? null : Directors.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['genres'] as List)?.map((e) => e as String)?.toList(),
      json['id'] as int,
      json['images'] == null
          ? null
          : Images.fromJson(json['images'] as Map<String, dynamic>),
      json['original_title'] as String,
      json['rating'] == null
          ? null
          : Rating.fromJson(json['rating'] as Map<String, dynamic>),
      json['reviews_count'] as int,
      json['summary'] as String,
      json['title'] as String,
      json['warning'] as String,
      json['wish_count'] as int,
      json['year'] as int);
}

Map<String, dynamic> _$SubjectsToJson(Subjects instance) => <String, dynamic>{
      'casts': instance.casts,
      'comments_count': instance.commentsCount,
      'countries': instance.countries,
      'directors': instance.directors,
      'genres': instance.genres,
      'id': instance.id,
      'images': instance.images,
      'original_title': instance.originalTitle,
      'rating': instance.rating,
      'reviews_count': instance.reviewsCount,
      'summary': instance.summary,
      'title': instance.title,
      'warning': instance.warning,
      'wish_count': instance.wishCount,
      'year': instance.year
    };

Casts _$CastsFromJson(Map<String, dynamic> json) {
  return Casts(
      json['avatars'] == null
          ? null
          : Avatars.fromJson(json['avatars'] as Map<String, dynamic>),
      json['name'] as String);
}

Map<String, dynamic> _$CastsToJson(Casts instance) =>
    <String, dynamic>{'avatars': instance.avatars, 'name': instance.name};

Avatars _$AvatarsFromJson(Map<String, dynamic> json) {
  return Avatars(json['large'] as String);
}

Map<String, dynamic> _$AvatarsToJson(Avatars instance) =>
    <String, dynamic>{'large': instance.large};

Directors _$DirectorsFromJson(Map<String, dynamic> json) {
  return Directors(
      json['avatars'] == null
          ? null
          : Avatars.fromJson(json['avatars'] as Map<String, dynamic>),
      json['name'] as String);
}

Map<String, dynamic> _$DirectorsToJson(Directors instance) =>
    <String, dynamic>{'avatars': instance.avatars, 'name': instance.name};

Images _$ImagesFromJson(Map<String, dynamic> json) {
  return Images(json['large'] as String);
}

Map<String, dynamic> _$ImagesToJson(Images instance) =>
    <String, dynamic>{'large': instance.large};

Rating _$RatingFromJson(Map<String, dynamic> json) {
  return Rating((json['average'] as num)?.toDouble(), json['max'] as int,
      json['min'] as int, json['stars'] as String);
}

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'average': instance.average,
      'max': instance.max,
      'min': instance.min,
      'stars': instance.stars
    };
