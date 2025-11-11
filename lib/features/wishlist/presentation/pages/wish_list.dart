import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:bokkia/features/wishlist/presentation/cubit/wish_list_cubit.dart';
import 'package:bokkia/features/wishlist/presentation/widgets/wish_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishListCubit()..getWishlist(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.accentcolor,
          centerTitle: true,

          title: Text(
            "Wishlist",
            style: getBodyTextStyle(context, fontsize: 24),
          ),
        ),
        body: BlocConsumer<WishListCubit, WishListState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetWishListLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetWishListsuccess) {
              var books = context.read<WishListCubit>().getwishlist?.data ?? [];
              if (books.isEmpty) {
                return Center(
                  child: Text(
                    "Your wishlist is empty ❤️",
                    style: getBodyTextStyle(
                      context,
                      color: AppColors.darkcolor,
                    ),
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
                      child: WishListItem(
                        books: books[index],
                        onPressed: () {
                          context.read<WishListCubit>().removeWishlist(
                            books[index].id ?? 0,
                          );
                        },
                      ),
                    );
                  },
                );
              }
            } else if (state is GetWishListfailure) {
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
