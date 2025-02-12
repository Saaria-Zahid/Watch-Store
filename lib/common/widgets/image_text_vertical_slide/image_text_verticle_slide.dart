import 'package:Saz/utils/constants/colors.dart';
import 'package:Saz/utils/constants/sizes.dart';
import 'package:Saz/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TVerticleImageText extends StatelessWidget {
  const TVerticleImageText({
    super.key, required this.image, required this.text,  this.textColor = TColors.white , this.backgroundColor = TColors.white, this.onTap,
  });

final String image, text;
final Color textColor;
final Color? backgroundColor;
final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final darkMode =THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
            right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular Icon
            Container(
              width: 56,
              height: 56,
              padding:
                  const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (darkMode ? TColors.black: TColors.white),
                borderRadius:
                    BorderRadius.circular(100),
              ), // BoxDecoration
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color: ( TColors.black),
                ),
              ), // Center
            ), // Container
      
            /// Text
            const SizedBox(
                height: TSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
