class CommitAuthor {
  String? name;
  String? email;
  String? date;

  CommitAuthor({this.name, this.email, this.date});

  CommitAuthor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['date'] = this.date;
    return data;
  }
}