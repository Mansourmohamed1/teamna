enum TaskStatus { todo, progress, blocked, done }

class CarpoolTask {
  final String title;
  final String category;
  final String owner;
  final String due;
  TaskStatus status;
  String reason;
  String note;

  CarpoolTask(
    this.title,
    this.category,
    this.owner,
    this.due,
    this.status,
    this.reason,
    this.note,
  );
}

class WorkspaceMember {
  final String initials;
  final String name;
  final String role;
  final String badge;
  final String status;
  final bool verified;
  final int avatarColorValue;

  const WorkspaceMember({
    required this.initials,
    required this.name,
    required this.role,
    this.badge = '',
    required this.status,
    required this.verified,
    required this.avatarColorValue,
  });
}
