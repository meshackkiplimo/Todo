import 'package:flutter/material.dart';
import '../models/todo_model.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(bool?) onToggle;
  final Function() onDelete;

  const TodoItem({
    Key? key,
    required this.todo,
    required this.onToggle,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: onToggle,
      ),
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.isCompleted 
            ? TextDecoration.lineThrough 
            : TextDecoration.none,
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.red),
        onPressed: onDelete,
      ),
    );
  }
}