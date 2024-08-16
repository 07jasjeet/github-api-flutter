class Verification {
  bool? verified;
  String? reason;
  String? signature;
  String? payload;

  Verification({this.verified, this.reason, this.signature, this.payload});

  Verification.fromJson(Map<String, dynamic> json) {
    verified = json['verified'];
    reason = json['reason'];
    signature = json['signature'];
    payload = json['payload'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['verified'] = this.verified;
    data['reason'] = this.reason;
    data['signature'] = this.signature;
    data['payload'] = this.payload;
    return data;
  }
}