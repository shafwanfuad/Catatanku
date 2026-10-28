import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:catatanku/screens/splash_screen.dart';
import 'package:catatanku/screens/login_screen.dart';
import 'package:catatanku/screens/home_screen.dart';
import 'package:catatanku/screens/add_note_screen.dart';
import 'package:catatanku/screens/note_detail_screen.dart';
import 'package:catatanku/data/dummy_data.dart';
import 'package:catatanku/theme/app_theme.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('id_ID', null);
  });

  Widget createTestWidget(Widget child) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: child,
    );
  }

  testWidgets('1. Test SplashScreen renders branding and slogan', (tester) async {
    await tester.pumpWidget(createTestWidget(const SplashScreen()));

    expect(find.text('CatatanKu'), findsOneWidget);
    expect(find.textContaining('Simpan setiap ide'), findsOneWidget);
    expect(find.text('Lanjutkan ke Masuk'), findsOneWidget);

    // Let animation timer finish cleanly
    await tester.pump(const Duration(milliseconds: 3000));
  });

  testWidgets('2. Test LoginScreen renders inputs, buttons, and social options', (tester) async {
    await tester.pumpWidget(createTestWidget(const LoginScreen()));

    expect(find.text('CatatanKu'), findsOneWidget);
    expect(find.text('Alamat Email'), findsOneWidget);
    expect(find.text('Kata Sandi'), findsOneWidget);
    expect(find.text('Masuk Sekarang'), findsOneWidget);
    expect(find.text('Masuk dengan Google'), findsOneWidget);
    expect(find.text('Daftar Sekarang'), findsOneWidget);
  });

  testWidgets('3. Test HomeScreen displays notes list, categories, search, and FAB', (tester) async {
    await tester.pumpWidget(createTestWidget(const HomeScreen()));

    // Verify user greeting
    expect(find.text('Halo, Shafwan'), findsOneWidget);

    // Verify category chips
    expect(find.text('Semua'), findsOneWidget);
    expect(find.text('Ide'), findsWidgets);
    expect(find.text('Pekerjaan'), findsWidgets);

    // Verify Notes list
    expect(find.text('Ide Fitur Aplikasi CatatanKu'), findsOneWidget);

    // Verify FloatingActionButton
    expect(find.text('Catatan Baru'), findsOneWidget);
  });

  testWidgets('4. Test AddNoteScreen form inputs, color options, and priority', (tester) async {
    await tester.pumpWidget(createTestWidget(const AddNoteScreen()));

    expect(find.text('Tambah Catatan'), findsOneWidget);
    expect(find.text('Judul Catatan'), findsOneWidget);
    expect(find.text('Isi Catatan'), findsOneWidget);
    expect(find.text('Kategori Catatan'), findsOneWidget);
    expect(find.text('Warna Aksen Catatan'), findsOneWidget);
    expect(find.text('Tingkat Prioritas'), findsOneWidget);
    expect(find.text('Simpan Catatan'), findsOneWidget);
  });

  testWidgets('5. Test NoteDetailScreen displays note content and actions', (tester) async {
    final noteId = NotesRepository().notes.first.id;
    await tester.pumpWidget(createTestWidget(NoteDetailScreen(noteId: noteId)));

    expect(find.text('Detail Catatan'), findsOneWidget);
    expect(find.text('Ide Fitur Aplikasi CatatanKu'), findsOneWidget);
    expect(find.text('Isi Catatan'), findsOneWidget);
    expect(find.text('Jumlah Kata'), findsOneWidget);
    expect(find.text('Karakter'), findsOneWidget);
    expect(find.text('Edit Catatan'), findsOneWidget);
    expect(find.text('Bagikan'), findsOneWidget);
  });
}
