import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:bokkia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bokkia/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            if (books.isEmpty) {
              return Center(
                child: Text(
                  "Your cart is empty ❤️",
                  style: getBodyTextStyle(context, color: AppColors.darkcolor),
                ),
              );
            } else {
              return ListView.separated(
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
                    child: CartItem(
                      books: returnbook!,
                      onPressed: () {
                        context.read<CartCubit>().removeFromCart(
                          books[index].itemId ?? 0,
                        );
                      },
                    ),
                  );
                },
              );
            }
          } else if (state is CartFailureState) {
            var error = state.error;
            return Center(child: Text(error, style: getBodyTextStyle(context)));
          }
          return Container();
        },
      ),
    );
  }
}
