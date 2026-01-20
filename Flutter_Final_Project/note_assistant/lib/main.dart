import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'config/theme.dart';
import 'features/auth/login_page.dart';
import 'features/notes/notes_list_view.dart';

// Global Theme Notifier
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase (Same config as before)
  await Supabase.initialize(
    url: 'https://ruvdlmgadsocoqcbuobq.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ1dmRsbWdhZHNvY29xY2J1b2JxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjY1OTc5ODIsImV4cCI6MjA4MjE3Mzk4Mn0.wfGmQjQ8D1EoouzF_WR_jdn9_7yX6Ed2hx2Pr2V6nC0',
  );

  runApp(const StudentNotesApp());
}

class StudentNotesApp extends StatelessWidget {
  const StudentNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentMode, child) {
        return MaterialApp(
          title: 'Student Notes',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: currentMode,

          // Auth State Check
          home: Supabase.instance.client.auth.currentSession != null
              ? const NotesListView()
              : const LoginPage(),
        );
      },
    );
  }
}
