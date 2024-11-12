import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app_with_bloc/bloc/task_event.dart';
import 'package:task_manager_app_with_bloc/bloc/task_state.dart';

import '../data/model/task_model.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final Dio _dio;

  TaskBloc(this._dio) : super(TaskInitial()) {
    // Register the FetchTasks event handler
    on<FetchTasks>(_onFetchTasks);
  }

  // Handler function for FetchTasks event
  Future<void> _onFetchTasks(FetchTasks event, Emitter<TaskState> emit) async {
    emit(TaskLoading()); // Emit loading state

    try {
      // Example API call to fetch tasks
      final response = await _dio.get('https://dummyjson.com/todos');

      if (response.statusCode == 200) {
        // Assuming response data contains a list of tasks
        final tasks = (response.data['todos'] as List<dynamic>)
            .map((json) => TaskModel.fromJson(json))
            .toList();

        emit(TaskLoaded(tasks: tasks)); // Emit loaded state with tasks
      } else {
        emit(TaskError(
          errorMessage: 'Failed to load tasks',
        ));
      }
    } catch (e) {
      emit(TaskError(errorMessage: 'An error occurred while fetching tasks'));
    }
  }
}
