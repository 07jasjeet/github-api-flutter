import 'package:urban_match_assignment/model/commit_data.dart';
import 'package:urban_match_assignment/model/github_repository.dart';
import 'package:urban_match_assignment/utils/exceptions.dart';
import 'package:urban_match_assignment/utils/response_parser.dart';

class GithubInformationRepository {
  final String _users = "users/";
  final String _repos = "repos";
  final String _commits = "commits";

  final ResponseParser _parser = ResponseParser();

  Future<List<GithubRepository>> getRepositories(String? user) async {
    if (user == null) {
      throw BadRequestException("User cannot be null.");
    }
    final response = await _parser.get("$_users$user/$_repos");

    final List<GithubRepository> list = [];
    response.forEach((repo) {
      list.add(GithubRepository.fromJson(repo));
    });

    return list;
  }

  Future<List<CommitData>> getCommits(String? user, String? repository) async {
    if (user == null || repository == null) {
      throw BadRequestException("User or repository cannot be null.");
    }
    final response = await _parser.get("$_repos/$user/$repository/$_commits");

    final List<CommitData> list = [];
    response.forEach((repo) {
      list.add(CommitData.fromJson(repo));
    });

    return list;
  }
}