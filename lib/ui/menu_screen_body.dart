import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oyt_front_menu/ui/widgets/menu_app_bar.dart';
import 'package:oyt_front_menu/ui/widgets/product_item_card.dart';
import 'package:oyt_front_menu/ui/widgets/toppings_carrousel_option.dart';
import 'package:oyt_front_restaurant/models/restaurant_model.dart';

class MenuScreenBody extends ConsumerStatefulWidget {
  const MenuScreenBody({required this.restaurantData, required this.onTapProduct, super.key});

  final RestaurantModel restaurantData;
  final VoidCallback onTapProduct;

  @override
  ConsumerState<MenuScreenBody> createState() => _MenuScreenBodyState();
}

class _MenuScreenBodyState extends ConsumerState<MenuScreenBody> {
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        MenuAppBar(restaurantData: widget.restaurantData),
        ToppingsCarrouselOption(
          onSelectTopping: (value) => setState(() => _selectedCategoryIndex = value),
          restaurantData: widget.restaurantData,
          selectedIndex: _selectedCategoryIndex,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            widget.restaurantData.categories[_selectedCategoryIndex].menuItems
                .map((e) => ProductItemCard(menuItem: e, onTap: widget.onTapProduct))
                .toList(),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 60)),
      ],
    );
  }
}
