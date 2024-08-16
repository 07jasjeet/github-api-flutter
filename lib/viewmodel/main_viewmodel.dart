import 'package:flutter/cupertino.dart';
import 'package:urban_match_assignment/model/commit_data.dart';
import 'package:urban_match_assignment/model/github_repository.dart';
import 'package:urban_match_assignment/utils/resource.dart';

import '../model/commit.dart';
import '../repository/github_information_repository.dart';

class MainViewModel extends ChangeNotifier {
  final GithubInformationRepository repository;
  final user = "freeCodeCamp";
  Resource<List<GithubRepository>> _repos = Resource.loading();
  Resource<List<Commit?>> _commits = Resource.loading();

  Resource<List<GithubRepository>> get repos {
    return _repos;
  }

  Resource<List<Commit?>> get commits {
    return _commits;
  }

  MainViewModel({required this.repository}) {
    init();
  }

  Future<void> init() async {
    await getRepositories(user);
    getLatestCommits(
        user,
        repos.data?.map((repo) => repo.name ?? "").toList() ?? []
    );
  }

  Future<void> getRepositories(String user) async {
    _repos = Resource.loading();
    notifyListeners();
    try {
      List<GithubRepository> result = await repository.getRepositories(user);
      _repos = Resource.success(result);
    } catch (e) {
      _repos = Resource.error(e.toString());
    }
    notifyListeners();
  }

  Future<void> getLatestCommits(String user, List<String> repoNames) async {
    _commits = Resource.loading();
    notifyListeners();
    try {
      List<Commit?> result = [];
      for (final repo in repoNames) {
        List<CommitData> commitData = await repository.getCommits(user, repo);
        result.add(commitData.firstOrNull?.commit);
      }
      _commits = Resource.success(result);
    } catch (e) {
      _commits = Resource.error(e.toString());
    }
    notifyListeners();
  }
}