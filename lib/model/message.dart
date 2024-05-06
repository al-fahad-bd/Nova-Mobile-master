class Message {
  final String id;
  final String senderId;
  final String receiverId;
  final String message;
  final DateTime timestamp;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.timestamp,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['_id'],
      senderId: json['sender'],
      receiverId: json['receiver'],
      message: json['message'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
