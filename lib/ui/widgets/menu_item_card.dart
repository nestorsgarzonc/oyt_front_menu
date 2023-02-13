import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oyt_front_core/theme/theme.dart';

class MenuItemCard extends ConsumerWidget {
  const MenuItemCard({
    required this.isSelected,
    required this.title,
    required this.onTap,
    this.leading,
    this.onEdit,
    super.key,
  });

  final bool isSelected;
  final String title;
  final VoidCallback onTap;
  final VoidCallback? onEdit;
  final Widget? leading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: CustomTheme.cardMargin,
      elevation: isSelected ? 3 : null,
      child: ListTile(
        selected: isSelected,
        leading: leading,
        title: Text(
          title,
          style: isSelected ? ref.watch(themeProvider.notifier).selectedItemTextStyle : null,
        ),
        onTap: onTap,
        trailing: onEdit == null
            ? null
            : IconButton(
                onPressed: onEdit,
                icon: const Icon(Icons.edit),
              ),
      ),
    );
  }
}
