import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urban_match_assignment/model/github_repository.dart';
import 'package:urban_match_assignment/viewmodel/main_viewmodel.dart';

import 'commit_info.dart';

class GithubRepositoryScreen extends StatefulWidget {
  const GithubRepositoryScreen({super.key});

  @override
  State<GithubRepositoryScreen> createState() => _GithubReposScreenState();
}

class _GithubReposScreenState extends State<GithubRepositoryScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Consumer<MainViewModel>(
        builder: (context, viewModel, _) {
          if (viewModel.repos.isLoading()) {
            // Loading
            return const Center(child: CircularProgressIndicator());
          } else if (viewModel.repos.isFailed()) {
            // Show error
            return Center(child: Text("${viewModel.repos.message}"));
          } else {
            // Show list
            List<GithubRepository> repos = viewModel.repos.data as List<GithubRepository>;
            return ListView.builder(
              itemCount: repos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    repos[index].name ?? "NA",
                    style: const TextStyle(fontWeight: FontWeight.bold)
                  ),
                  subtitle: Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        repos[index].description ?? "No description available",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      CommitInfo(commits: viewModel.commits, index: index)
                    ],
                  )
                );
              },
            );
          }
        },
      ),
    );
  }
}

