# task_manager_app_with_bloc

Hello there, Flutter enthusiasts! 👋

This repository contains the source code for the tutorial **[BLoC Journey to the Next Milestone: Crafting a Task Manager App with DIO and API Integration](https://medium.com/@tech.ramakant/bloc-journey-to-the-next-milestone-crafting-a-task-manager-app-with-dio-and-api-integration-eef60a51391a)** published on Medium. This code demonstrates how to build a task management app using **BLoC architecture**, **DIO for networking**, and **API integration**, making it easier to handle state, organize code, and manage asynchronous data.

## Table of Contents
- [Overview](#Overview)
- [Features](#Features)
- [Installation](#Installation)
- [Usage](#Usage)
- [Contributing](#Contributing)
- [License](#License)
- [Contact](#Contact)

## Overview
Managing state and asynchronous data in Flutter can become challenging as apps grow. This project explores how to effectively use **BLoC architecture** and **DIO** for API integration, separating concerns and creating a modular, maintainable structure. It’s ideal for Flutter developers looking to enhance their state management skills and handle network calls efficiently with BLoC and DIO.

This repository accompanies my [article on Medium](https://medium.com/@tech.ramakant/bloc-journey-to-the-next-milestone-crafting-a-task-manager-app-with-dio-and-api-integration-eef60a51391a), guiding you through building a task manager app from scratch, integrating a mock API, and using BLoC to manage state effectively.

## Features
- **Clean Architecture**: Separates code into data, domain, and presentation layers.
- **Repository Pattern**: Makes it easy to swap out data sources or add new ones.
- **Scalable Structure**: The app’s structure allows it to grow without sacrificing code quality.
- **Detailed Documentation**: Code is documented for easy understanding with helpful comments.

## Features
- **BLoC Architecture**: Uses BLoC for structured state management.
- **DIO Networking with Interceptors**: Handles API calls and manages responses with DIO interceptors.
- **API Integration**: Connects to a mock API to retrieve and manage task data.
- **Task Management**: View and update task statuses.
- **Clean Code Structure**: Organized folder structure for scalability and maintenance.

## Installation
1. Clone the repository:

    ```bash
    git clone https://github.com/tech-ramakant/task_manager_app_with_bloc.git
    ```

2. Navigate to the project directory:

    ```bash
    cd task_manager_app_with_bloc
    ```

3. Install the dependencies:

    ```bash
    flutter pub get
    ```

4. Generate code for JSON serialization (if applicable):

    ```bash
    dart run build_runner build
    ```

5. Run the app:

    ```bash
    flutter run
    ```

## Usage

Explore the code in the `lib/` folder to see how BLoC, DIO, and API integration are implemented step-by-step. This app serves as a reference for managing asynchronous data using BLoC, organizing code for readability and maintainability, and leveraging DIO interceptors.

Example - TaskBloc to Fetch Task Data:

```dart
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final DioClient dioClient;

  TaskBloc(this.dioClient) : super(TaskInitial()) {
    on<FetchTasks>((event, emit) async {
      try {
        emit(TaskLoading());
        final tasks = await dioClient.fetchTasks();
        emit(TaskLoaded(tasks: tasks));
      } catch (e) {
        emit(TaskError("Failed to load tasks"));
      }
    });
  }
}
```
In this example, TaskBloc listens for a FetchTasks event, fetches task data from the API, and emits states to manage loading, loaded, and error conditions. This setup keeps the UI reactive and the logic organized.

## Contributing
Feel free to open issues or make pull requests to improve this project. Contributions are always welcome!

Fork the repo
- Create your branch: git checkout -b my-new-feature
- Commit your changes: git commit -am 'Add some feature'
- Push to the branch: git push origin my-new-feature
- Submit a pull request

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Contact
For any inquiries, feel free to reach out to me via:

- Email: [tech.ramakanttiwari@gmail.com](mailto:tech.ramakanttiwari@gmail.com)
- Medium: [@tech.ramakant](https://medium.com/@tech.ramakant)
- LinkedIn: [@tech-ramakant](https://www.linkedin.com/in/ramakant-tiwari-593479128)
- YouTube: [@Tech.Ramakant](https://www.youtube.com/@Tech.Ramakant)

