import 'package:ios_reminders/common/widgets/category_icon.dart';

class Category {
  final String id;
  final String name;
  bool isChecked;
  final CategoryIcon icon;

  Category({
    required this.icon,
    required this.id,
    required this.name,
    this.isChecked = true,
  });

    void toggleIsChecked() {
    isChecked = !isChecked;
  }
}

//var category = Category('1', 'All', true);

//var category = Category(id: '1', name: 'All');
