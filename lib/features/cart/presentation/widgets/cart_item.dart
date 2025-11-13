import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:bokkia/core/widgets/custom_button.dart';
import 'package:bokkia/features/cart/data/models/add_to_cart_response/add_to_cart_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.books, this.onPressed});

  final AddToCartResponse books;
  final Function()? onPressed;

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
            imageUrl: "assets/images/welcom.jpg",
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
                      "book name",
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
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/icons/Remove.svg",
                      width: 25,
                      height: 25,
                    ),
                  ),
                ],
              ),
              Text("130 \$", style: getBodyTextStyle(context)),
              const Gap(10),
              Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                  size: Size(140, 40),
                  text: Text(
                    "Add To Cart",
                    style: getBodyTextStyle(
                      context,
                      fontsize: 14,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  onpressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
