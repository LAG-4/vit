class FeedbackModel {
  String profilePic;
  String name;
  String source;

  FeedbackModel(
      {this.name,  this.profilePic, this.source,});

  factory FeedbackModel.fromJson(dynamic json) {
    return FeedbackModel(
      name: "${json['name']}",
      profilePic: "${json['profile_pic']}",
      source: "${json['source']}",
    );
  }

  Map toJson() => {
    "profile_pic": profilePic,
    "source": source,
    "name": name,
  };
}
