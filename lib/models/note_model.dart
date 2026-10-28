import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

enum NotePriority {
  low,
  medium,
  high;

  String get label {
    switch (this) {
      case NotePriority.low:
        return 'Rendah';
      case NotePriority.medium:
        return 'Sedang';
      case NotePriority.high:
        return 'Tinggi';
    }
  }

  Color get color {
    switch (this) {
      case NotePriority.low:
        return AppColors.priorityLow;
      case NotePriority.medium:
        return AppColors.priorityMedium;
      case NotePriority.high:
        return AppColors.priorityHigh;
    }
  }

  Color get backgroundColor {
    switch (this) {
      case NotePriority.low:
        return AppColors.priorityLowBg;
      case NotePriority.medium:
        return AppColors.priorityMediumBg;
      case NotePriority.high:
        return AppColors.priorityHighBg;
    }
  }
}

class NoteModel {
  final String id;
  String title;
  String content;
  String category;
  String colorId;
  NotePriority priority;
  DateTime createdAt;
  bool isFavorite;
  bool isPinned;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    this.colorId = 'indigo',
    this.priority = NotePriority.medium,
    required this.createdAt,
    this.isFavorite = false,
    this.isPinned = false,
  });

  ColorOption get colorOption {
    return AppColors.noteColors.firstWhere(
      (opt) => opt.id == colorId,
      orElse: () => AppColors.noteColors.first,
    );
  }

  NoteModel copyWith({
    String? id,
    String? title,
    String? content,
    String? category,
    String? colorId,
    NotePriority? priority,
    DateTime? createdAt,
    bool? isFavorite,
    bool? isPinned,
  }) {
    return NoteModel(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      category: category ?? this.category,
      colorId: colorId ?? this.colorId,
      priority: priority ?? this.priority,
      createdAt: createdAt ?? this.createdAt,
      isFavorite: isFavorite ?? this.isFavorite,
      isPinned: isPinned ?? this.isPinned,
    );
  }
}
