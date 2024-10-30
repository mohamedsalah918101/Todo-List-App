import 'package:flutter/material.dart';
import 'package:tasks_app/models/task.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislike;
  final VoidCallback editTaskCallback;
  final VoidCallback restoreTaskCallback;
  const PopupMenu({super.key,
    required this.cancelOrDeleteCallback,
    required this.task,
    required this.likeOrDislike,
    required this.editTaskCallback,
    required this.restoreTaskCallback});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false ? ((context) => [
          PopupMenuItem(
            onTap: editTaskCallback,
            child: TextButton.icon(
              onPressed: null,
              icon: const Icon(Icons.edit),
              label: const Text("Edit"),
            ),
          ),
          PopupMenuItem(
            onTap: likeOrDislike,
            child: TextButton.icon(
              onPressed: null,
              icon: task.isFavorite == false
                  ? const Icon(Icons.bookmark_add_outlined)
                  : const Icon(Icons.bookmark_remove),
              label: task.isFavorite == false
                  ? const Text("Add to \nBookmarks")
                  : const Text("Remove from \nBenchmarks"),
            ),
          ),
          PopupMenuItem(
            onTap: cancelOrDeleteCallback,
            child: TextButton.icon(
              onPressed: null,
              icon: const Icon(Icons.delete),
              label: const Text("Delete"),
            ),
          ),
        ]) : (context) => [
          PopupMenuItem(
            onTap: restoreTaskCallback,
            child: TextButton.icon(
              onPressed: null,
              icon: const Icon(Icons.restore_from_trash),
              label: const Text("Restore"),
            ),
          ),
          PopupMenuItem(
            onTap: cancelOrDeleteCallback,
            child: TextButton.icon(
              onPressed: null,
              icon: const Icon(Icons.delete_forever),
              label: const Text("Delete Forever"),
            ),
          ),
        ]);
  }
}
