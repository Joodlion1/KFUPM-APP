import 'dart:convert';

class Event {
  final String name;
  final String image;
  final String link;
  final String audiance;
  final int duration;
  final String place;
  Event({
    required this.name,
    required this.image,
    required this.link,
    required this.audiance,
    required this.duration,
    required this.place,
  });

  Event copyWith({
    String? name,
    String? image,
    String? link,
    String? audiance,
    int? duration,
    String? place,
  }) {
    return Event(
      name: name ?? this.name,
      image: image ?? this.image,
      link: link ?? this.link,
      audiance: audiance ?? this.audiance,
      duration: duration ?? this.duration,
      place: place ?? this.place,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'link': link,
      'audiance': audiance,
      'duration': duration,
      'place': place,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      name: map['name'] as String,
      image: map['image'] as String,
      link: map['link'] as String,
      audiance: map['audiance'] as String,
      duration: map['duration'] as int,
      place: map['place'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) =>
      Event.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Event(name: $name, image: $image, link: $link, audiance: $audiance, duration: $duration, place: $place)';
  }

  @override
  bool operator ==(covariant Event other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.image == image &&
        other.link == link &&
        other.audiance == audiance &&
        other.duration == duration &&
        other.place == place;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        image.hashCode ^
        link.hashCode ^
        audiance.hashCode ^
        duration.hashCode ^
        place.hashCode;
  }
}
