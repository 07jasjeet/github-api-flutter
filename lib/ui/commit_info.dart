import 'package:flutter/material.dart';

import '../model/commit.dart';
import '../utils/resource.dart';

class CommitInfo extends StatelessWidget {
  const CommitInfo({
    super.key,
    required this.index,
    required this.commits,
  });

  final Resource<List<Commit?>> commits;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          if (commits.isLoading()) {
            // Loading
            return const SizedBox(
              width: 10,
              height: 10,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (commits.isFailed()) {
            // Show error
            return Text("Error: Could not load commit: ${commits.message}");
          } else {
            return Container(
              alignment: Alignment.centerLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Latest commit: ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: Text(
                    convertToMessage(commits.data?[index]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ))
                ],
              ),
            );
          }
        }
    );
  }

  String convertToMessage(Commit? commit) {
    return commit?.message?.split('\n').first ?? "";
  }
}