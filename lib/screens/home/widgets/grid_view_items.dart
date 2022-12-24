import 'package:flutter/material.dart';
import 'package:ios_reminders/models/category/category.dart';
import 'package:ios_reminders/models/category/category_collection.dart';

class GridViewItems extends StatelessWidget {
  const GridViewItems({
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 16 / 9,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.all(10),
      children: categories
          .map(
            (category) => Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1A191D),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        category.icon,
                        Text(
                          '0',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                    Text(
                      category.name,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
