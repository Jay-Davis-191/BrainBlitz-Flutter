import 'package:flutter/material.dart';

class ReminderWidget extends StatelessWidget {
  final String task;
  final String? className;
  final DateTime dueDate;
  final int remainingDays;
  final bool isHighPriority;
  final VoidCallback onTogglePriority;
  final VoidCallback onDelete;

  ReminderWidget({
    required this.task,
    this.className,
    required this.dueDate,
    required this.remainingDays,
    required this.isHighPriority,
    required this.onTogglePriority,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isOverdue = DateTime.now().isAfter(dueDate);

    return ListTile(
      tileColor: isOverdue ? Colors.red.withOpacity(0.1) : null,
      title: Text(task),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (className != null) Text(className!),
          Text('Due Date: ${dueDate.toLocal()}'),
          Text('Remaining Days: $remainingDays'),
        ],
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: onDelete,
      ),
      onTap: onTogglePriority,
    );
  }
}
