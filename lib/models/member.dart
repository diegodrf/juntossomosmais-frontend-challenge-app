import 'package:juntossomosmais_app/extensions/extensions.dart';

class Member {
  final String gender;
  final Name name;
  final Location location;
  final String email;

  // final Dob dob;
  // final Registered registered;
  final String phone;
  final String cell;
  final Picture picture;

  const Member({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    // required this.dob,
    // required this.registered,
    required this.phone,
    required this.cell,
    required this.picture,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      gender: json['gender'] as String,
      name: Name.fromJson(json['name']),
      location: Location.fromJson(json['location']),
      email: json['email'] as String,
      // dob: Dob.fromJson(json['dob']),
      // registered: Registered.fromJson(json['registered']),
      phone: json['phone'] as String,
      cell: json['cell'] as String,
      picture: Picture.fromJson(json['picture']),
    );
  }
}

class Name {
  final String title;
  final String first;
  final String last;

  String get fullName {
    return '$first $last'.toTitle();
  }

  const Name({required this.title, required this.first, required this.last});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }
}

class Location {
  final String street;
  final String city;
  final String state;
  final int postcode;
  final Coordinates coordinates;
  final TimeZone timezone;

  String get streetName {
    return street.split(' ').sublist(1).join(' ').toTitle();
  }

  String get addressNumber {
    return street.split(' ')[0];
  }

  const Location({
    required this.street,
    required this.city,
    required this.state,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      street: json['street'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      postcode: json['postcode'] as int,
      // coordinates: Coordinates.fromJson(json['coordinates']),
      coordinates: const Coordinates(latitude: 0.0, longitude: 0.0),
      timezone: TimeZone.fromJson(json['timezone']),
    );
  }

  String formattedAddress() {
    final String number = street.split(' ')[0];
    final String address = street.substring(number.length).toTitle();
    return '$address, $number';
  }
}

class Coordinates {
  final double latitude;
  final double longitude;

  const Coordinates({required this.latitude, required this.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

class TimeZone {
  final String offset;
  final String description;

  const TimeZone({required this.offset, required this.description});

  factory TimeZone.fromJson(Map<String, dynamic> json) {
    return TimeZone(
      offset: json['offset'],
      description: json['description'],
    );
  }
}

class Dob {
  // TODO
}

class Registered {
  // TODO
}

class Picture {
  final String large;
  final String medium;
  final String thumbnail;

  const Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      large: json['large'],
      medium: json['medium'],
      thumbnail: json['thumbnail'],
    );
  }

  @override
  String toString() {
    return 'Picture{large: $large, medium: $medium, thumbnail: $thumbnail}';
  }
}
