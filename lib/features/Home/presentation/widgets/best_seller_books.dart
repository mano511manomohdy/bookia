import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:bokkia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BestSellerBooks extends StatelessWidget {
  const BestSellerBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Best Sellers",
            style: getTitleTextStyle(context, color: AppColors.darkcolor),
          ),
          Gap(10),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              mainAxisExtent: 280,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.secondrycolor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          width: double.infinity,
                          "assets/images/welcom.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      "Book Name",
                      style: getSmallTextStyle(context, fontsize: 18),
                    ),
                    Row(
                      children: [
                        Text("40 \$"),
                        Spacer(),
                        CustomButton(
                          size: Size(70, 30),
                          color: AppColors.darkcolor,
                          text: Text(
                            "Buy",
                            style: getBodyTextStyle(
                              context,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          onpressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
