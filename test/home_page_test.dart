import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app/domain/providers/task_provider.dart';
import 'package:task_manager_app/presentation/pages/home_page.dart';

void main() {
  testWidgets('Task app launches and can add a task', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => TaskProvider(),
        child: const MaterialApp(
          home: HomePage(),
        ),
      ),
    );

    // Verify no tasks at start
    expect(find.byType(ListTile), findsNothing);

    // Tap on FAB to add task
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Fill the form
    await tester.enterText(find.byType(TextFormField).first, 'Test Task');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    // Now we should see one task
    expect(find.text('Test Task'), findsOneWidget);
  });
}
