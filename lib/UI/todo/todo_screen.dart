import 'package:blflutter/bloc/todo/todoBloc.dart';
import 'package:blflutter/bloc/todo/todoEvents.dart';
import 'package:blflutter/bloc/todo/todoState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todoList.isEmpty) {
            return const Center(
              child: Text('No todos yet.'),
            );
          } else if (state.todoList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todoList[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      BlocProvider.of<TodoBloc>(context).add(RemoveTodoEvent(state.todoList[index]));
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('Unknown state.'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 10; i++) {
            BlocProvider.of<TodoBloc>(context).add(AddTodoEvent('Task $i'));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
