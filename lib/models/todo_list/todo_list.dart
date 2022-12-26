class TodoList {
  final String id;
  final String title;
  final Map icon;
  final int reminderCount;

  TodoList({
    required this.id,
    required this.title,
    required this.icon,
    required this.reminderCount,
  });

  //convert data to json for firebase!
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'icon': icon,
        'reminder_count': reminderCount,
      };
  //named constructor
  TodoList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        icon = json['icon'],
        reminderCount = json['reminder_count'];
}
