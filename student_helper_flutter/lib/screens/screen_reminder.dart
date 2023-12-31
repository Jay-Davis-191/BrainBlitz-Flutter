import 'package:flutter/material.dart';
import 'package:student_helper_flutter/widgets/reminder_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminder App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReminderScreen(),
    );
  }
}

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  List<Map<String, dynamic>> reminders = [
    {
      'task': 'Complete Assignment',
      'className': 'Math',
      'dueDate': DateTime.now().add(Duration(days: 2)),
      'isHighPriority': true,
    },
    {
      'task': 'Project Presentation',
      'className': 'Science',
      'dueDate': DateTime.now().add(Duration(days: 5)),
      'isHighPriority': false,
    },
    // Add more reminders as needed
  ];

  void _togglePriority(int index) {
    setState(() {
      reminders[index]['isHighPriority'] = !reminders[index]['isHighPriority'];
      _sortReminders();
    });
  }

  void _deleteReminder(int index) {
    setState(() {
      reminders.removeAt(index);
    });
  }

  void _sortReminders() {
    reminders.sort((a, b) => a['dueDate'].compareTo(b['dueDate']));
  }

  void _showAddReminderDialog() {
    TextEditingController taskController = TextEditingController();
    TextEditingController classController = TextEditingController();
    TextEditingController dueDateController = TextEditingController(text: DateTime.now().toString());

  DateTime? selectedDate;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Add Reminder'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: taskController,
              decoration: InputDecoration(labelText: 'Task'),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: classController,
              decoration: InputDecoration(labelText: 'Class (Optional)'),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: dueDateController,
              decoration: InputDecoration(labelText: 'Due Date (Tap to select)'),
              readOnly: true,  // Make it read-only to prevent direct editing
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365 * 100)),
                );
                if (pickedDate != null) {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    selectedDate = DateTime(
                      pickedDate.year,
                      pickedDate.month,
                      pickedDate.day,
                      pickedTime.hour,
                      pickedTime.minute,
                    );
                    dueDateController.text = selectedDate!.toLocal().toString();
                  }
                }
              },
            ),
          ],
        ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                // Parse the due date and add the reminder
                DateTime? dueDate = DateTime.tryParse(dueDateController.text);
                if (dueDate != null) {
                  setState(() {
                    reminders.add({
                      'task': taskController.text,
                      'className': classController.text.isNotEmpty ? classController.text : null,
                      'dueDate': dueDate,
                      'isHighPriority': true,  // Defaulting to high priority for new reminders
                    });
                    _sortReminders();
                  });
                  Navigator.of(context).pop();  // Close the dialog
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Invalid date format. Please enter YYYY-MM-DD.'),
                  ));
                }
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showAddReminderDialog,
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            child: _buildReminderList(true),
          ),
          Expanded(
            child: _buildReminderList(false),
          ),
        ],
      ),
    );
  }

  Widget _buildReminderList(bool isHighPriority) {
    final filteredReminders = reminders.where((r) => r['isHighPriority'] == isHighPriority).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            isHighPriority ? 'High Priority' : 'Low Priority',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredReminders.length,
            itemBuilder: (context, index) {
              final reminder = filteredReminders[index];
              final remainingDays = reminder['dueDate'].difference(DateTime.now()).inDays;
              return ReminderWidget(
                task: reminder['task'],
                className: reminder['className'],
                dueDate: reminder['dueDate'],
                remainingDays: remainingDays,
                isHighPriority: isHighPriority,
                onTogglePriority: () => _togglePriority(reminders.indexOf(reminder)),
                onDelete: () => _deleteReminder(reminders.indexOf(reminder)),
              );
            },
          ),
        ),
      ],
    );
  }
}
