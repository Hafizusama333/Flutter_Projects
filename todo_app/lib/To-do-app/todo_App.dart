import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/To-do-app/to-do.dart';
// Make sure this is the correct path to your provider file

class TodoScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Add Todo',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<TodoProvider>(context, listen: false).fetchTodos();
              _controller.clear();
            },
            child: Text('Fetch Todos'),
          ),
          Expanded(
            child: Consumer<TodoProvider>(
              builder: (context, todoProvider, child) {
                return ListView.builder(
                  itemCount: todoProvider.todos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title:
                          Text(todoProvider.todos[index]['first_name'] ?? ''),
                      subtitle: Text(todoProvider.todos[index]['email'] ?? ''),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
