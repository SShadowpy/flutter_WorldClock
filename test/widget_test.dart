import 'package:flutter_test/flutter_test.dart';
import 'package:pj1/main.dart';

import 'package:pj1/domain/entities/world_time.dart';
import 'package:pj1/domain/repositories/world_time_repository.dart';

class FakeWorldTimeRepository implements WorldTimeRepository {
  @override
  Future<WorldTime> getWorldTime(String city) async {
    // Return some dummy data
    return WorldTime(city: city, dateTime: DateTime.now(), timeZone: 'UTC');
  }

  @override
  Future<void> addFavorite(String city) async {
    // Do nothing
  }

  @override
  Future<void> removeFavorite(String city) async {
    // Do nothing
  }

  @override
  Future<List<String>> getFavoriteCities() async {
    return [];
  }
}

void main() {
  testWidgets('HomePage displays initial text', (WidgetTester tester) async {
    final fakeRepository = FakeWorldTimeRepository();

    await tester.pumpWidget(MyApp(repository: fakeRepository));

    // Expect some initial text or widget on the HomePage
    expect(find.text('World Clock'), findsOneWidget);
  });
}

