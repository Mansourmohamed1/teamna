class PrivateChatModel {
  final String id;
  final String userName;
  final String userImage;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final bool isOnline;

  const PrivateChatModel({
    required this.id,
    required this.userName,
    required this.userImage,
    required this.lastMessage,
    required this.time,
    this.unreadCount = 0,
    this.isOnline = false,
  });
}

class TeamChatModel {
  final String id;
  final String teamName;
  final String lastSender;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final int? membersCount;

  const TeamChatModel({
    required this.id,
    required this.teamName,
    required this.lastSender,
    required this.lastMessage,
    required this.time,
    this.unreadCount = 0,
    this.membersCount,
  });
}