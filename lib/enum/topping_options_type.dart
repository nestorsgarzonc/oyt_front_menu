import 'package:collection/collection.dart';

enum ToppingOptionsType {
  single(widgetLabel: 'radioButton', label: 'Opción única'),
  multiple(widgetLabel: 'checkBox', label: 'Opción múltiple');

  const ToppingOptionsType({
    required this.widgetLabel,
    required this.label,
  });

  final String widgetLabel;
  final String label;

  static ToppingOptionsType? fromString(String? value) =>
      values.firstWhereOrNull((e) => e.widgetLabel == value);
}
