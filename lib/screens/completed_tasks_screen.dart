import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app/widgets/tasks_list.dart';

import '../blocs/tasks_blocs/tasks_bloc.dart';
import '../models/task.dart';


class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({super.key});

  static const id = 'tasks_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.completedTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text("${tasksList.length} Tasks"),
              ),
            ),
            TasksList(taskList: tasksList),
          ],
        );
      },
    );
  }
}
