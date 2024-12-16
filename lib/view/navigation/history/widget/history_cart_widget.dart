import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_color.dart';

class CartWidget extends StatefulWidget {
  final CartListModel cart;
  final VoidCallback onItemDeleted;

  const CartWidget({
    super.key,
    required this.cart,
    required this.onItemDeleted,
  });

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final cartVM = Get.put(CartViewModel());

  late String userId;
  late String apiKey;
  late int price;
  late int quantity;
  late double subTotal;

  @override
  void initState() {
    super.initState();
    UserPreference userPreference = UserPreference();
    userPreference.getUser().then((user) {
      userId = user.uid!;
      apiKey = user.apiKey!;
    });
    price = widget.cart.price;
    quantity = widget.cart.quantity;
    subTotal = price.toDouble() * quantity;
  }

  Future<void> _deleteItem() async {
    final isSuccess = await cartVM.removeFromCartApi(
      widget.cart.productId,
      userId,
      widget.cart.quantity,
      apiKey,
    );

    if (isSuccess) {
      widget.onItemDeleted(); // Notify parent to refresh
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('failed_to_delete_item'.tr)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Card(
        color: AppColor.whiteColor,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            Image(
              image: NetworkImage(widget.cart.imageUrl.isNotEmpty
                  ? widget.cart.imageUrl.first
                  : ''),
              width: 50,
              height: 90,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cart.productName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    '\$${price.toStringAsFixed(1)} × $quantity = \$${subTotal.toStringAsFixed(1)}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey, // Strikethrough effect
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: _deleteItem,
                  //     () {
                  //   cartVM.removeFromCartApi(widget.cart.productId, userId,
                  //       widget.cart.quantity, apiKey);
                  // },
                  icon: Icon(Icons.close),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
