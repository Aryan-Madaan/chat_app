class ChatModel {
  String? timestamp;
  String? userId;
  String? name;
  String? text;

  ChatModel({
    this.timestamp,
    this.userId,
    this.name,
    this.text,
  });

  ChatModel.fromJson(Map<String, dynamic> json) {
    timestamp = json["timestamp"];
    userId = json["userId"];
    name = json["name"];
    text = json["text"];
  }
}
