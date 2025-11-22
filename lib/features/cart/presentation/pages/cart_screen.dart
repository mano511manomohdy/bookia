import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:bokkia/core/widgets/custom_button.dart';
import 'package:bokkia/core/widgets/dialogs.dart';
import 'package:bokkia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bokkia/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.accentcolor,
          centerTitle: true,

          title: Text("Cart", style: getBodyTextStyle(context, fontsize: 24)),
        ),
        body: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is CartLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CartSuccessState) {
              var returnbook = context.read<CartCubit>().showdata;
              var books =
                  context.read<CartCubit>().showdata?.data?.cartItems ?? [];
              var total = context.read<CartCubit>().showdata?.data?.total ?? [];

              if (books.isEmpty) {
                return Center(
                  child: Text(
                    "Your cart is empty ❤️",
                    style: getBodyTextStyle(
                      context,
                      color: AppColors.darkcolor,
                    ),
                  ),
                );
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: books.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.accentcolor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: CartItemWidget(
                              onRemove: () {
                                if (books[index].itemQuantity! > 1) {
                                  context.read<CartCubit>().upDateCart(
                                    books[index].itemId ?? 0,
                                    (books[index].itemQuantity ?? 0) - 1,
                                  );
                                } else {
                                  showToast(context, "cannot remove more");
                                }
                              },
                              onAdd: () {
                                if ((books[index].itemQuantity ?? 0) <
                                    (books[index].itemProductStock ?? 0)) {
                                  context.read<CartCubit>().upDateCart(
                                    books[index].itemId ?? 0,
                                    (books[index].itemQuantity ?? 0) + 1,
                                  );
                                } else {
                                  showToast(context, "cannot added more");
                                }
                              },
                              books: returnbook!.data!.cartItems![index],
                              onPressed: () {
                                context.read<CartCubit>().removeFromCart(
                                  books[index].itemId ?? 0,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total:",
                            style: getBodyTextStyle(
                              context,
                              fontsize: 20,
                              color: AppColors.darkcolor,
                            ),
                          ),
                          Text(
                            "\$ ${(double.parse(total)).toStringAsFixed(2)}",
                            style: getBodyTextStyle(
                              context,
                              fontsize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: CustomButton(
                        size: const Size(double.infinity, 50),
                        text: Text(
                          "Checkout",
                          style: getBodyTextStyle(
                            context,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        onpressed: () {},
                      ),
                    ),
                    Gap(70),
                  ],
                );
              }
            } else if (state is CartFailureState) {
              var error = state.error;
              return Center(
                child: Text(error, style: getBodyTextStyle(context)),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
