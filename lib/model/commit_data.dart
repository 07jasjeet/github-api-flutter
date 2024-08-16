import 'package:urban_match_assignment/model/parents.dart';

import 'author.dart';
import 'commit.dart';

class CommitData {
  String? sha;
  String? nodeId;
  Commit? commit;
  String? url;
  String? htmlUrl;
  String? commentsUrl;
  Author? author;
  Author? committer;
  List<Parents>? parents;

  CommitData(
      {this.sha,
        this.nodeId,
        this.commit,
        this.url,
        this.htmlUrl,
        this.commentsUrl,
        this.author,
        this.committer,
        this.parents});

  CommitData.fromJson(Map<String, dynamic> json) {
    sha = json['sha'];
    nodeId = json['node_id'];
    commit =
    json['commit'] != null ? new Commit.fromJson(json['commit']) : null;
    url = json['url'];
    htmlUrl = json['html_url'];
    commentsUrl = json['comments_url'];
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    committer = json['committer'] != null
        ? new Author.fromJson(json['committer'])
        : null;
    if (json['parents'] != null) {
      parents = <Parents>[];
      json['parents'].forEach((v) {
        parents!.add(new Parents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sha'] = this.sha;
    data['node_id'] = this.nodeId;
    if (this.commit != null) {
      data['commit'] = this.commit!.toJson();
    }
    data['url'] = this.url;
    data['html_url'] = this.htmlUrl;
    data['comments_url'] = this.commentsUrl;
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    if (this.committer != null) {
      data['committer'] = this.committer!.toJson();
    }
    if (this.parents != null) {
      data['parents'] = this.parents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}