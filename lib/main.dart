import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urban_match_assignment/repository/github_information_repository.dart';
import 'package:urban_match_assignment/ui/github_repository_screen.dart';
import 'package:urban_match_assignment/viewmodel/main_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => GithubInformationRepository()),
        ChangeNotifierProvider.value(
          value: MainViewModel(repository: GithubInformationRepository()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UrbanMatch Assignment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'UrbanMatch Assignment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: GithubRepositoryScreen()
      ),
    );
  }
}
