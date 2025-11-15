import 'dart:ui';
import 'package:bokkia/core/extenstions/navigator.dart';
import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:bokkia/core/widgets/back_button.dart';
import 'package:bokkia/core/widgets/custom_button.dart';
import 'package:bokkia/core/widgets/dialogs.dart';
import 'package:bokkia/features/Home/data/models/best_seller_response/product.dart';
import 'package:bokkia/features/Home/presentation/cubit/home_cubit.dart';
import 'package:bokkia/features/main_app_screen/main_app_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is AddWishlistLoadingState) {
            showLoadingDialog(context);
          } else if (state is AddWishlistSuccessState) {
            Navigator.pop(context);
            showToast(context, state.message, ToastType.success);
          } else if (state is AddWishlistFailureState) {
            Navigator.pop(context);
            showToast(context, state.error);
          } else if (state is AddCartLoadingState) {
            showLoadingDialog(context);
          } else if (state is AddCartSuccessState) {
            Navigator.pop(context);
            showToast(
              context,
              "Book added to cart successfully",
              ToastType.success,
            );
          } else if (state is AddCartFailureState) {
            Navigator.pop(context);
            showToast(context, state.error);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: false,
              title: IconButton(
                onPressed: () {
                  context.pushReplacement(MainAppScreen());
                },
                icon: ButtonBack(),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    onPressed: () {
                      if (product.id != null) {
                        context.read<HomeCubit>().addToWishlist(
                          product.id ?? 0,
                        );
                      } else {
                        showToast(
                          context,
                          "Invalid product id",
                          ToastType.error,
                        );
                      }
                    },
                    icon: SvgPicture.asset(
                      "assets/icons/Bookmark.svg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                // Scrollable content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(22.0),
                    child: Column(
                      children: [
                        Hero(
                          tag: product.id ?? '',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            clipBehavior: Clip.antiAlias,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: product.image.toString(),
                              height: 270,
                              width: 180,
                            ),
                          ),
                        ),
                        const Gap(11),
                        Text(
                          textAlign: TextAlign.center,
                          product.name ?? "",
                          style: getTitleTextStyle(context),
                        ),
                        const Gap(10),
                        Text(
                          product.category ?? "",
                          style: getTitleTextStyle(
                            context,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const Gap(16),
                        Text(
                          textAlign: TextAlign.justify,
                          product.description
                                  ?.split('<p>')
                                  .join('')
                                  .split('</p>')
                                  .join('') ??
                              "",
                          style: getSmallTextStyle(context),
                        ),
                      ],
                    ),
                  ),
                ),

                // 🧊 Glassy bottom bar
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22.0,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        border: Border(
                          top: BorderSide(
                            color: Colors.white.withOpacity(0.3),
                            width: 0.8,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "${product.priceAfterDiscount} \$",
                            style: getTitleTextStyle(context),
                          ),
                          const Spacer(),
                          CustomButton(
                            size: const Size(200, 45),
                            color: AppColors.darkcolor,
                            text: Text(
                              "Add To Cart",
                              style: getTitleTextStyle(
                                context,
                                color: AppColors.whiteColor,
                              ),
                            ),
                            onpressed: () {
                              if (product.id != null) {
                                context.read<HomeCubit>().addToCart(
                                  product.id ?? 0,
                                );
                              } else {
                                showToast(
                                  context,
                                  "Invalid product id",
                                  ToastType.error,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
