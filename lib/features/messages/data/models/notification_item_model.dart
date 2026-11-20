enum NotificationCategory { invitation, message, project }

class NotificationItemModel {
  final String id;
  final NotificationCategory category;
  final String title;
  final String subtitle;
  final bool isUnread;
  final bool showArrow;

  const NotificationItemModel({
    required this.id,
    required this.category,
    required this.title,
    required this.subtitle,
    this.isUnread = false,
    this.showArrow = false,
  });

  NotificationItemModel copyWith({bool? isUnread}) {
    return NotificationItemModel(
      id: id,
      category: category,
      title: title,
      subtitle: subtitle,
      isUnread: isUnread ?? this.isUnread,
      showArrow: showArrow,
    );
  }
}