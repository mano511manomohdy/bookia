import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:bokkia/core/widgets/custom_button.dart';
import 'package:bokkia/core/widgets/dialogs.dart';
import 'package:bokkia/features/Home/data/models/best_seller_response/product.dart';
import 'package:bokkia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class WishListItem extends StatelessWidget {
  const WishListItem({super.key, required this.books, required this.onPressed});

  final Product books;
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
            imageUrl: books.image ?? '',
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
                      "${books.name}",
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
                "${books.priceAfterDiscount} \$",
                style: getBodyTextStyle(context),
              ),
              const Gap(10),
              Align(
                alignment: Alignment.centerRight,
                child: BlocConsumer<CartCubit, CartState>(
                  listener: (context, state) {
                    if (state is CartLoadingState) {
                      showLoadingDialog(context);
                    } else if (state is CartSuccessState) {
                      Navigator.pop(context);
                      showToast(
                        context,
                        "book added successfuly",
                        ToastType.success,
                      );
                    } else if (state is CartFailureState) {
                      Navigator.pop(context);
                      showToast(context, state.error);
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      size: Size(140, 40),
                      text: Text(
                        "Add To Cart",
                        style: getBodyTextStyle(
                          context,
                          fontsize: 14,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      onpressed: () {
                        if (books.id != null) {
                          context.read<CartCubit>().addToCart(books.id ?? 0);
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
