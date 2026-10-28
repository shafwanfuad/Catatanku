import 'package:flutter/material.dart';
import '../models/note_model.dart';

class CategoryItem {
  final String name;
  final IconData icon;
  final Color color;

  const CategoryItem({
    required this.name,
    required this.icon,
    required this.color,
  });
}

class NotesRepository extends ChangeNotifier {
  static final NotesRepository _instance = NotesRepository._internal();
  factory NotesRepository() => _instance;

  NotesRepository._internal();

  List<NoteModel>? _notesList;

  List<NoteModel> get _notes {
    _notesList ??= <NoteModel>[];
    return _notesList!;
  }

  List<NoteModel> get notes => List.unmodifiable(_notes);

  void clearAll() {
    _notes.clear();
    notifyListeners();
  }

  static const List<CategoryItem> categories = [
    CategoryItem(name: 'Semua', icon: Icons.grid_view_rounded, color: Color(0xFF4F46E5)),
    CategoryItem(name: 'Ide', icon: Icons.lightbulb_outline_rounded, color: Color(0xFFF59E0B)),
    CategoryItem(name: 'Pekerjaan', icon: Icons.work_outline_rounded, color: Color(0xFF0EA5E9)),
    CategoryItem(name: 'Kuliah', icon: Icons.school_outlined, color: Color(0xFF8B5CF6)),
    CategoryItem(name: 'Pribadi', icon: Icons.person_outline_rounded, color: Color(0xFF10B981)),
    CategoryItem(name: 'Jurnal', icon: Icons.book_outlined, color: Color(0xFFEC4899)),
    CategoryItem(name: 'Keuangan', icon: Icons.account_balance_wallet_outlined, color: Color(0xFFF97316)),
  ];

  static List<String> get categoryNames =>
      categories.where((c) => c.name != 'Semua').map((c) => c.name).toList();

  void addNote(NoteModel note) {
    _notes.insert(0, note);
    notifyListeners();
  }

  void updateNote(NoteModel updatedNote) {
    final index = _notes.indexWhere((n) => n.id == updatedNote.id);
    if (index != -1) {
      _notes[index] = updatedNote;
      notifyListeners();
    }
  }

  void deleteNote(String id) {
    _notes.removeWhere((n) => n.id == id);
    notifyListeners();
  }

  void toggleFavorite(String id) {
    final index = _notes.indexWhere((n) => n.id == id);
    if (index != -1) {
      _notes[index] = _notes[index].copyWith(
        isFavorite: !_notes[index].isFavorite,
      );
      notifyListeners();
    }
  }

  void togglePin(String id) {
    final index = _notes.indexWhere((n) => n.id == id);
    if (index != -1) {
      _notes[index] = _notes[index].copyWith(
        isPinned: !_notes[index].isPinned,
      );
      notifyListeners();
    }
  }
}
