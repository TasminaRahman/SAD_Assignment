import 'dart:io';

void main() {
  List<String> tasks = [];

  while (true) {
    print("\n--- Simple To-Do App ---");
    print("1. Add Task");
    print("2. Remove Task");
    print("3. View All Tasks");
    print("4. Exit");
    stdout.write("Choose an option: ");
    String? choice = stdin.readLineSync();

    if (choice == '1') {
      stdout.write("Enter task name: ");
      String? task = stdin.readLineSync();
      if (task != null && task.isNotEmpty) {
        tasks.add(task);
        print("Task added!");
      }
    } else if (choice == '2') {
      stdout.write("Enter task name to remove: ");
      String? task = stdin.readLineSync();
      if (tasks.remove(task)) {
        print("Task removed!");
      } else {
        print("Task not found!");
      }
    } else if (choice == '3') {
      print("\nYour Tasks:");
      if (tasks.isEmpty) {
        print("No tasks yet.");
      } else {
        for (int i = 0; i < tasks.length; i++) {
          print("${i + 1}. ${tasks[i]}");
        }
      }
    } else if (choice == '4') {
      print("Exiting To-Do App. Goodbye!");
      break;
    } else {
      print("Invalid option! Please try again.");
    }
  }
}
