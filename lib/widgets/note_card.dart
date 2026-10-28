import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/note_model.dart';
import '../theme/app_colors.dart';
import 'priority_badge.dart';

class NoteCard extends StatelessWidget {
  final NoteModel note;
  final VoidCallback onTap;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onPinToggle;
  final VoidCallback? onDelete;

  const NoteCard({
    super.key,
    required this.note,
    required this.onTap,
    this.onFavoriteToggle,
    this.onPinToggle,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final colorOpt = note.colorOption;
    final formattedDate = DateFormat('d MMM yyyy, HH:mm', 'id_ID').format(note.createdAt);

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: colorOpt.displayColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: colorOpt.displayBorder,
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: colorOpt.accentColor.withValues(alpha: 0.08),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 6,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            splashColor: colorOpt.accentColor.withValues(alpha: 0.08),
            highlightColor: colorOpt.accentColor.withValues(alpha: 0.04),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Left Accent Indicator Strip
                  Container(
                    width: 5,
                    decoration: BoxDecoration(
                      color: colorOpt.accentColor.withValues(alpha: 0.75),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(18),
                        bottomLeft: Radius.circular(18),
                      ),
                    ),
                  ),

                  // Main Note Content
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 15, 16, 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Top row: Category, Priority, Pin button, Star
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.surface,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: colorOpt.accentColor.withValues(alpha: 0.22),
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.02),
                                      blurRadius: 4,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.folder_rounded,
                                      size: 13,
                                      color: colorOpt.accentColor,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      note.category,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: colorOpt.accentColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              PriorityBadge(
                                priority: note.priority,
                                compact: true,
                              ),
                              const Spacer(),

                              // Pin toggle button
                              if (onPinToggle != null)
                                GestureDetector(
                                  onTap: onPinToggle,
                                  child: Tooltip(
                                    message: note.isPinned ? 'Lepas Sematan' : 'Sematkan Catatan',
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 200),
                                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                                      margin: const EdgeInsets.only(right: 6),
                                      decoration: BoxDecoration(
                                        color: note.isPinned
                                            ? colorOpt.accentColor.withValues(alpha: 0.16)
                                            : AppColors.surface.withValues(alpha: 0.85),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: note.isPinned
                                              ? colorOpt.accentColor.withValues(alpha: 0.35)
                                              : AppColors.cardBorder,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            note.isPinned
                                                ? Icons.push_pin_rounded
                                                : Icons.push_pin_outlined,
                                            size: 14,
                                            color: note.isPinned
                                                ? colorOpt.accentColor
                                                : AppColors.textMuted,
                                          ),
                                          const SizedBox(width: 3),
                                          Text(
                                            note.isPinned ? 'Semat' : 'Sematkan',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700,
                                              color: note.isPinned
                                                  ? colorOpt.accentColor
                                                  : AppColors.textSecondary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                              // Star Favorite toggle button
                              if (onFavoriteToggle != null)
                                GestureDetector(
                                  onTap: onFavoriteToggle,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: AppColors.surface.withValues(alpha: 0.85),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: note.isFavorite
                                            ? const Color(0xFFF59E0B).withValues(alpha: 0.3)
                                            : AppColors.cardBorder,
                                      ),
                                    ),
                                    child: Center(
                                      child: AnimatedSwitcher(
                                        duration: const Duration(milliseconds: 200),
                                        child: Icon(
                                          note.isFavorite
                                              ? Icons.star_rounded
                                              : Icons.star_outline_rounded,
                                          key: ValueKey(note.isFavorite),
                                          size: 18,
                                          color: note.isFavorite
                                              ? const Color(0xFFF59E0B)
                                              : AppColors.textMuted,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          // Note Title
                          Text(
                            note.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                              height: 1.35,
                              letterSpacing: -0.2,
                            ),
                          ),
                          const SizedBox(height: 6),

                          // Content Snippet
                          Text(
                            note.content,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.textSecondary.withValues(alpha: 0.95),
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 12),

                          // Footer: Date & Read More icon
                          Row(
                            children: [
                              Icon(
                                Icons.schedule_rounded,
                                size: 13,
                                color: AppColors.textMuted,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                formattedDate,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textMuted,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: AppColors.surface.withValues(alpha: 0.85),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: colorOpt.accentColor.withValues(alpha: 0.15),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Buka',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: colorOpt.accentColor,
                                      ),
                                    ),
                                    const SizedBox(width: 2),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      size: 14,
                                      color: colorOpt.accentColor,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
