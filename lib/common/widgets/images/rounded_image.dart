import 'package:Saz/utils/constants/colors.dart';
import 'package:Saz/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TRoundedBorderImage extends StatelessWidget {
  const TRoundedBorderImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.applyImageRadius = true,
    this.borderRadius = TSizes.md,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
          color: backgroundColor,
        ),
        child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: Center(
              child: Image(fit: fit,
                  image:AssetImage("$imageUrl")),
            )),
      ),
    );
  }
}
// class TRoundedProductImage extends StatelessWidget {
//   const TRoundedProductImage({
//     super.key,
//     this.width,
//     this.height,
//     required this.imageUrl,
//     this.border,
//     this.backgroundColor,
//     this.fit = BoxFit.contain,
//     this.padding,
//     this.isNetworkImage = false,
//     this.onPressed,
//     this.applyImageRadius = true,
//     this.borderRadius = TSizes.md,
//   });

//   final double? width, height;
//   final String imageUrl;
//   final bool applyImageRadius;
//   final BoxBorder? border;
//   final Color? backgroundColor;
//   final BoxFit? fit;
//   final EdgeInsetsGeometry? padding;
//   final bool isNetworkImage;
//   final VoidCallback? onPressed;
//   final double borderRadius;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         width: width,
//         height: height,
//         padding: padding,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(borderRadius),
//           border: border,
//           color: backgroundColor,
//         ),
//         child: ClipRRect(
//             borderRadius: applyImageRadius
//                 ? BorderRadius.circular(borderRadius)
//                 : BorderRadius.zero,
//             child: Image(fit: fit,
//                 image:AssetImage("assets/$imageUrl"))),
//       ),
//     );
//   }
// }
