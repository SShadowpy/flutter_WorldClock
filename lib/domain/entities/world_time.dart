class WorldTime {
  final String city;
  final DateTime dateTime; // local time for the city
  final String? timeZone;

  WorldTime({
    required this.city,
    required this.dateTime,
    this.timeZone,
  });
}
