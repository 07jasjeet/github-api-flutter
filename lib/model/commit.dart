import 'package:urban_match_assignment/model/tree.dart';
import 'package:urban_match_assignment/model/verification.dart';

import 'commit_author.dart';

class Commit {
  CommitAuthor? author;
  CommitAuthor? committer;
  String? message;
  Tree? tree;
  String? url;
  int? commentCount;
  Verification? verification;

  Commit(
      {this.author,
        this.committer,
        this.message,
        this.tree,
        this.url,
        this.commentCount,
        this.verification});

  Commit.fromJson(Map<String, dynamic> json) {
    author =
    json['author'] != null ? new CommitAuthor.fromJson(json['author']) : null;
    committer = json['committer'] != null
        ? new CommitAuthor.fromJson(json['committer'])
        : null;
    message = json['message'];
    tree = json['tree'] != null ? new Tree.fromJson(json['tree']) : null;
    url = json['url'];
    commentCount = json['comment_count'];
    verification = json['verification'] != null
        ? new Verification.fromJson(json['verification'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    if (this.committer != null) {
      data['committer'] = this.committer!.toJson();
    }
    data['message'] = this.message;
    if (this.tree != null) {
      data['tree'] = this.tree!.toJson();
    }
    data['url'] = this.url;
    data['comment_count'] = this.commentCount;
    if (this.verification != null) {
      data['verification'] = this.verification!.toJson();
    }
    return data;
  }
}
