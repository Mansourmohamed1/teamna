enum ChatItemType { text, attachment, task }

class ChatMessageModel {
  final String id;
  final ChatItemType type;
  final String? senderName;
  final String? message;
  final String? time;
  final String? status;
  final bool isMe;
  final String? cardTitle;
  final String? cardSubtitle;

  const ChatMessageModel({
    required this.id,
    this.type = ChatItemType.text,
    this.senderName,
    this.message,
    this.time,
    this.status,
    this.isMe = false,
    this.cardTitle,
    this.cardSubtitle,
  });
}
