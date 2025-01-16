import 'package:Saz/common/widgets/appbar/appbar_screen.dart';
import 'package:Saz/common/widgets/image_text_vertical_slide/image_text_verticle_slide.dart';
import 'package:Saz/common/widgets/images/rounded_image.dart';
import 'package:Saz/common/widgets/products/card/product_card_verticle.dart';
import 'package:Saz/common/widgets/shapes/containers/circular_container.dart';
import 'package:Saz/common/widgets/shapes/containers/custom_curved.dart';
import 'package:Saz/common/widgets/shapes/containers/custom_search_container.dart';
import 'package:Saz/controllers/cart_controller.dart';
import 'package:Saz/controllers/product_controller.dart';
import 'package:Saz/controllers/theme_controller.dart';
import 'package:Saz/data/repositories/authentication_repo.dart';
import 'package:Saz/screens/search/search.dart';
import 'package:Saz/screens/user/cart/cart.dart';
import 'package:Saz/utils/constants/colors.dart';
import 'package:Saz/utils/constants/image_strings.dart';
import 'package:Saz/utils/constants/sizes.dart';
import 'package:Saz/utils/constants/text_strings.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final product_controller = Get.put(ProductController());
  String? selectedBrand;
  String searchQuery = ''; // Variable to hold the search query
  bool isSearching = true; // Toggle for showing the search bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  const THomeAppBar(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Hero(
                    tag: "search_bar",
                    child: TSearchBarContainer(
                      text: "Search in Store",
                      onTap: () => Get.to(SearchPage()),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        const TSectionHeading(
                          title: "Popular Categories",
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        SizedBox(
                          height: 80,
                          child: Hero(
                            tag: '_Brand',
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: product_controller.brands
                                  .length, // Use the list of brands from ProductController
                              itemBuilder: (context, index) {
                                final brand = product_controller.brands[
                                    index]; // Correctly fetching brand from controller
                                return Container(
                                  width: MediaQuery.of(context).size.width /
                                      product_controller.brands
                                          .length, // Equal width for each item
                                  child: TVerticleImageText(
                                    text: brand
                                        .name, // Assuming brand has a 'name' key
                                    image: brand
                                        .image, // Assuming brand has an 'image' key
                                    onTap: () {
                                      Get.to(SearchPage());
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),

            // make section of rounded image
            Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                // padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                          viewportFraction: 1,
                          animateToClosest: true,
                          autoPlay: true,
                          autoPlayAnimationDuration:
                              const Duration(seconds: 3)),
                      items: const [
                        SizedBox(
                            height: 250,
                            child:
                                TRoundedBorderImage(imageUrl: TImages.banner1)),
                        SizedBox(
                            height: 250,
                            child: TRoundedBorderImage(
                              imageUrl: TImages.banner4,
                            )),
                        SizedBox(
                            height: 250,
                            child:
                                TRoundedBorderImage(imageUrl: TImages.banner3)),
                        // SizedBox(
                        //     height: 250,
                        //     child:
                        //         TRoundedBorderImage(imageUrl: TImages.banner4)),
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    TGridLayout(
                      itemBuilder: (_, index) {
                        final product = product_controller.products[index];

                        return Hero(
                            tag: "product_id_${product.id}",
                            child: TProductCardVerticle(product: product));
                      },
                      itemCount: product_controller.products.length,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TCustomCurvedEdgeWidget(
      child: Container(
        color: TColors.primary,
        child: Stack(
          children: [
            Positioned(
                top: -150,
                right: -250,
                child: TCircularContainer(
                  bgColor: TColors.white.withOpacity(0.1),
                  child: Container(),
                )),
            Positioned(
                top: 100,
                right: -300,
                child: TCircularContainer(
                  bgColor: TColors.white.withOpacity(0.1),
                  child: Container(),
                )),
            child
          ],
        ),
      ),
    );
  }
}

class TGridLayout extends StatelessWidget {
  const TGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 288,
    required this.itemBuilder,
  });

  final int itemCount;
  final double mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: TSizes.gridViewSpacing,
            crossAxisSpacing: TSizes.gridViewSpacing,
            mainAxisExtent: mainAxisExtent),
        itemBuilder: itemBuilder);
  }
}

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = "View All",
    this.onPressed,
    this.textColor,
    this.showActionButton = true,
  });

  final String title, buttonTitle;
  final bool showActionButton;
  final Color? textColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = AuthenticationRepository.instance;
    final cartController = Get.put(CartController());
    final _auth = FirebaseAuth.instance;
    final _user = _auth.currentUser!.uid;
    final ThemeController themeController = Get.put(ThemeController());
    return SAppBar(
      leadingIcon: null,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder<Map<String, dynamic>>(
            future: controller.fetchUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                final data = snapshot.data!;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good day for shopping',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: TColors.grey),
                    ),
                    Text(
                      ' ${data['firstName']} ${data['lastName']}',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: TColors.white),
                    )
                  ],
                );
              } else {
                return Text('No data available');
              }
            },
          ),
        ],
      ),
      actions: [
        IconButton(onPressed: ()=> themeController.toggleTheme(),
         icon: themeController.isDarkMode.value? Icon(Icons.sunny): Icon(Icons.nights_stay, color: Colors.white,)
        ),
        Stack(
          children: [
            IconButton(
                onPressed: () => Get.to((CartPage())),
                icon: const Icon(
                  Iconsax.bag,
                  color: TColors.white,
                )),
            Obx(
              () => Positioned(
                right: 0,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                      color: TColors.black,
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                      child: Text(
                    '${cartController.totalCount()}',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: TColors.white, fontSizeFactor: 0.8),
                  )),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
