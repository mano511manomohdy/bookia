import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:bokkia/features/cart/data/models/add_to_cart_response/cart_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.books,
    this.onPressed,
    this.onAdd,
    this.onRemove,
  });

  final CartItem books;
  final Function()? onPressed;
  final Function()? onAdd;
  final Function()? onRemove;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            height: 120,
            width: 90,
            imageUrl: books.itemProductImage!,
          ),
        ),
        const Gap(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    //  Prevents text overflow if book name is too long
                    child: Text(
                      books.itemProductName!,
                      style: getBodyTextStyle(
                        context,
                        fontsize: 18,
                        color: AppColors.gray,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  //  Remove button on the right
                  IconButton(
                    onPressed: onPressed,
                    icon: SvgPicture.asset(
                      "assets/icons/Remove.svg",
                      width: 25,
                      height: 25,
                    ),
                  ),
                ],
              ),
              Text(
                "${books.itemProductPriceAfterDiscount} \$",
                style: getBodyTextStyle(context),
              ),
              const Gap(10),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    FloatingActionButton(
                      onPressed: onAdd,
                      backgroundColor: AppColors.accentcolor,
                      elevation: 0,
                      child: Icon(
                        Icons.add,
                        size: 32,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Gap(20),
                    Text(
                      books.itemQuantity.toString(),
                      style: getBodyTextStyle(
                        color: AppColors.darkcolor,
                        context,
                      ),
                    ),
                    Gap(20),
                    FloatingActionButton(
                      onPressed: onRemove,
                      backgroundColor: AppColors.accentcolor,
                      elevation: 0,
                      child: Icon(
                        Icons.remove,
                        size: 32,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
