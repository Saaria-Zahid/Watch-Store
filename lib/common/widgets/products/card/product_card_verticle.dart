import 'package:Saz/common/styles/shadows.dart';
import 'package:Saz/common/widgets/Icons/icons.dart';
import 'package:Saz/common/widgets/favorites/favorite_icon.dart';
import 'package:Saz/common/widgets/images/rounded_image.dart';
import 'package:Saz/common/widgets/products/details/product_details.dart';
import 'package:Saz/common/widgets/shapes/containers/rounded_container.dart';
import 'package:Saz/controllers/cart_controller.dart';
import 'package:Saz/controllers/product_controller.dart';
import 'package:Saz/utils/constants/colors.dart';
import 'package:Saz/utils/constants/image_strings.dart';
import 'package:Saz/utils/constants/sizes.dart';
import 'package:Saz/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardVerticle extends StatelessWidget {
  final Product product;

  const TProductCardVerticle({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());

    final darkMode = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetails(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: darkMode ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
            // Thumbnail, Wishlist, Discount
            TRoundedContainer(
              height: 180,
              padding: EdgeInsets.all(TSizes.sm),
              backgroundColor: darkMode ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  TRoundedBorderImage(
                    width: double.infinity,
                    imageUrl: product.image,
                  ),
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '${((1 - product.salePrice / product.price) * 100).toStringAsFixed(0)}% OFF',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 0, right: 0, child: FavoriteIcon(product: product)),
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: TSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TProductTitleText(
                      title: product.name,
                      smallSize: true,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    Row(
                      children: [
                        Text(
                          product.brand,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(
                          width: TSizes.xs,
                        ),
                        const Icon(
                          Iconsax.verify5,
                          color: TColors.primary,
                          size: TSizes.iconXs,
                        ),
                      ],
                    ),
                    const Spacer(), // Pushes the content above towards the top
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product.salePrice}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Add product to the cart
                            cartController.addToCart(product);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content:
                                      Text('${product.name} added to cart')),
                            );
                          },
                          child: Obx(() {
                            final isProductInCart =
                                cartController.isInCart(product);

                            return Container(
                              decoration: BoxDecoration(
                                color: isProductInCart
                                    ? TColors.primary
                                    : TColors.dark,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(TSizes.cardRadiusMd),
                                  bottomRight: Radius.circular(
                                      TSizes.productImageRadius),
                                ),
                              ),
                              child: SizedBox(
                                width: TSizes.iconLg * 1.2,
                                height: TSizes.iconLg * 1.2,
                                child: Center(
                                  child:
                                      // Check if the product is in the cart

                                      isProductInCart
                                          ? Icon(
                                              Iconsax
                                                  .tick_circle, // Icon to show if the product is in the cart
                                              color: TColors.white,
                                            )
                                          : GestureDetector(
                                              onTap: () {
                                                cartController.addToCart(
                                                    product); // Add product to cart on tap
                                              },
                                              child: Icon(
                                                Iconsax
                                                    .add, // Icon to show if the product is not in the cart
                                                color: TColors.white,
                                              ),
                                            ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TProductTitleText extends StatelessWidget {
  const TProductTitleText(
      {super.key,
      required this.title,
      this.smallSize = false,
      this.maxLine = 2,
      this.textAlign = TextAlign.left});

  final String title;
  final bool smallSize;
  final int maxLine;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine,
      textAlign: textAlign,
    );
  }
}
