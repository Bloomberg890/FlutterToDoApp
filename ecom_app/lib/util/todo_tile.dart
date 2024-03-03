import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Color.fromARGB(227, 218, 248, 250),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  //checkbox
                  Checkbox(
                    value: taskCompleted,
                    onChanged: onChanged,
                    activeColor: Colors.black,
                  ),
                  Text(
                    taskName,
                    style: TextStyle(
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
              FutureBuilder<String>(
                future: _fetchRandomQuote(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Display a loading indicator while fetching the quote
                    return CircularProgressIndicator();
                  } else {
                    if (snapshot.hasError) {
                      // Display an error message if the quote couldn't be fetched
                      return Text('Failed to fetch quote');
                    } else {
                      // Display the fetched quote
                      return Text(
                        snapshot.data ?? '',
                        semanticsLabel: taskName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      );
                    }
                  }
                },
              ),

              //task name
            ],
          ),
        ),
      ),
    );
  }

  Future<String> _fetchRandomQuote() async {
    final response =
        await http.get(Uri.parse('https://api.quotable.io/random'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['content'];
    } else {
      throw Exception('Failed to fetch quote');
    }
  }
}
