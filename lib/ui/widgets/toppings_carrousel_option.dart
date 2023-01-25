import 'package:flutter/material.dart';
import 'package:oyt_front_restaurant/models/restaurant_model.dart';
import 'package:oyt_front_widgets/image/image_api_widget.dart';

class ToppingsCarrouselOption extends StatelessWidget {
  const ToppingsCarrouselOption({
    required this.restaurantData,
    required this.onSelectTopping,
    required this.selectedIndex,
    super.key,
  });

  final RestaurantModel restaurantData;
  final void Function(int index) onSelectTopping;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 120,
        alignment: Alignment.center,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: restaurantData.categories.length,
          itemBuilder: (context, index) {
            final cat = restaurantData.categories[index];
            final isSelected = selectedIndex == index;
            return CarrouselItemCard(
              index: index,
              onSelectTopping: onSelectTopping,
              isSelected: isSelected,
              menu: cat,
            );
          },
        ),
      ),
    );
  }
}

class CarrouselItemCard extends StatelessWidget {
  const CarrouselItemCard({
    required this.index,
    required this.onSelectTopping,
    required this.isSelected,
    required this.menu,
    super.key,
  });

  final int index;
  final void Function(int index) onSelectTopping;
  final bool isSelected;
  final Menu menu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15, top: 2, bottom: 2, left: index == 0 ? 10 : 0),
      child: Material(
        child: InkWell(
          onTap: () => onSelectTopping(index),
          child: Ink(
            width: 100,
            height: 120,
            decoration: BoxDecoration(
              color: isSelected ? Colors.grey : Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: isSelected ? Colors.grey : Colors.grey.shade300, width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                ImageApi(
                  menu.imgUrl,
                  height: isSelected ? 48 : 45,
                  width: 100,
                  fit: BoxFit.fitHeight,
                ),
                const Spacer(),
                Text(
                  menu.name,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: isSelected ? FontWeight.w600 : null,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
