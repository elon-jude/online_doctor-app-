import 'package:flutter_test/flutter_test.dart';
import 'package:online_doctor/main.dart';

void main() {
  testWidgets('MediConnect app starts', (WidgetTester tester) async {
    await tester.pumpWidget(const OnlineDoctorApp());

    expect(find.text('MediConnect'), findsOneWidget);
    expect(find.text('Your Health, Our Priority'), findsOneWidget);
  });
}
