import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:bokkia/core/widgets/custom_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentcolor,
        centerTitle: true,

        title: Text("Wishlist", style: getBodyTextStyle(context, fontsize: 24)),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.accentcolor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    height: 120,
                    width: 90,
                    imageUrl:
                        "https://codingarabic.online/storage/slider/UOtz83Ow0ChFQOZYeDp48yWreuvBYjRwb8BNUexc.jpg",
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
                              "Book Name",
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
                      Text("285 \$", style: getBodyTextStyle(context)),
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
            ),
          );
        },
      ),
    );
  }
}
