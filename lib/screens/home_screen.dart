import 'package:flutter/material.dart';
import 'dart:math';
import '../models/todo_model.dart';
import '../widget/todo_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> _todos = [];
  final TextEditingController _todoController = TextEditingController();

  void _addTodo() {
    if (_todoController.text.isNotEmpty) {
      setState(() {
        _todos.add(Todo(
          id: Random().nextInt(1000000).toString(),
          title: _todoController.text,
        ));
        _todoController.clear();
      });
    }
  }

  void _toggleTodo(Todo todo, bool? value) {
    setState(() {
      todo.isCompleted = value ?? false;
    });
  }

  void _deleteTodo(Todo todo) {
    setState(() {
      _todos.remove(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: 'Enter a new todo',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addTodo,
                  child: Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                final todo = _todos[index];
                return TodoItem(
                  todo: todo,
                  onToggle: (value) => _toggleTodo(todo, value),
                  onDelete: () => _deleteTodo(todo),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}