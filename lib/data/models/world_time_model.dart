import '../../domain/entities/world_time.dart';

class WorldTimeModel extends WorldTime {
  WorldTimeModel({
    required String city,
    required DateTime dateTime,
    String? timeZone,
  }) : super(
          city: city,
          dateTime: dateTime,
          timeZone: timeZone,
        );

  factory WorldTimeModel.fromJson(Map<String, dynamic> json, String city) {
    // Assume we are using an API response from something like worldtimeapi.org
    return WorldTimeModel(
      city: city,
      dateTime: DateTime.parse(json['datetime']),
      timeZone: json['timezone'],
    );
  }
}
