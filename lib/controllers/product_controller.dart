import 'package:Saz/screens/search/search_delegate.dart';
import 'package:get/get.dart';

class Product {
  final int id;
  final String brand;
  final String name;
  final String image;
  final double price;
  final String description;
  final double salePrice;

  Product({
    required this.id,
    required this.brand,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.salePrice,
  });

  // Convert Product to Map (for storage)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'brand': brand,
      'name': name,
      'image': image,
      'price': price,
      'description': description,
      'salePrice': salePrice,
    };
  }

  // Convert Map to Product (for loading)
  static Product fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      brand: map['brand'],
      name: map['name'],
      image: map['image'],
      price: map['price'],
      description: map['description'],
      salePrice: map['salePrice'],
    );
  }
}


class ProductController extends GetxController {
  // List of products
  final products = <Product>[].obs;

  // Cart and Wishlist
  final cart = <Product>[].obs;
  final wishlist = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  final List<Brand> brands = [
 Brand(name: "Rolex", image: "assets/images/brands/rolex.png"),
  Brand(name: "Omega", image: "assets/images/brands/omega.png"),
  Brand(name: "Breitling", image: "assets/images/brands/breit.png"),
  Brand(name: "Hublot", image: "assets/images/brands/hublot.png"),
  Brand(name: "Tag Heuer", image: "assets/images/brands/tag.png"),
];





  List<Map<String, dynamic>> watches = [
  // Rolex
  {
    "id": 1,
    "brand": "Rolex",
    "name": "Rolex Submariner",
    "image": "assets/images/products/rolex_4.png",
    "price": 12500.0,
    "description": "The Rolex Submariner is a classic diving watch with unmatched precision.",
    "salePrice": 11800.0
  },
   {
    "id": 6,
    "brand": "Hublot",
    "name": "Hublot Classic Fusion",
    "image": "assets/images/products/hublot_2.png",
    "price": 14000.0,
    "description": "Hublot Classic Fusion offers understated luxury with modern design.",
    "salePrice": 13500.0
  },
    {
    "id": 13,
    "brand": "Tag Heuer",
    "name": "Tag Heuer Carrera",
    "image": "assets/images/products/tag_1.png",
    "price": 3200.0,
    "description": "The Tag Heuer Carrera is a sleek, sporty watch for professionals.",
    "salePrice": 3100.0
  },
  {
    "id": 3,
    "brand": "Rolex",
    "name": "Rolex Day-Date",
    "image": "assets/images/products/rolex_3.png",
    "price": 35000.0,
    "description": "Rolex Day-Date is a symbol of prestige and sophistication.",
    "salePrice": 34000.0
  },


  // Hublot
  {
    "id": 5,
    "brand": "Hublot",
    "name": "Hublot Big Bang",
    "image": "assets/images/products/hublot_1.png",
    "price": 22000.0,
    "description": "Hublot Big Bang features an innovative design and bold aesthetics.",
    "salePrice": 21000.0
  },
   {
    "id": 20,
    "brand": "Breitling",
    "name": "Breitling Avenger",
    "image": "assets/images/products/breitling_4.png",
    "price": 5800.0,
    "description": "Breitling Avenger combines precision and durability for adventurers.",
    "salePrice": 5600.0
  },
  {
    "id": 2,
    "brand": "Rolex",
    "name": "Rolex Datejust",
    "image": "assets/images/products/rolex_3.png",
    "price": 7500.0,
    "description": "Rolex Datejust is the epitome of timeless elegance and precision.",
    "salePrice": 7300.0
  },
 
  {
    "id": 8,
    "brand": "Hublot",
    "name": "Hublot MP-11",
    "image": "assets/images/products/hublot_5.png",
    "price": 90000.0,
    "description": "Hublot MP-11 showcases cutting-edge mechanics and luxurious design.",
    "salePrice": 88000.0
  },

  // Omega
  {
    "id": 9,
    "brand": "Omega",
    "name": "Omega Speedmaster",
    "image": "assets/images/products/omega_1.png",
    "price": 5200.0,
    "description": "The Omega Speedmaster is an iconic chronograph built for precision.",
    "salePrice": 5000.0
  },
  {
    "id": 10,
    "brand": "Omega",
    "name": "Omega Seamaster",
    "image": "assets/images/products/omega_2.png",
    "price": 4500.0,
    "description": "The Omega Seamaster is a favorite among divers and James Bond fans.",
    "salePrice": 4300.0
  },
  {
    "id": 11,
    "brand": "Omega",
    "name": "Omega Constellation",
    "image": "assets/images/products/omega_3.png",
    "price": 3800.0,
    "description": "Omega Constellation is a timeless classic with a sleek design.",
    "salePrice": 3650.0
  },
  {
    "id": 12,
    "brand": "Omega",
    "name": "Omega De Ville",
    "image": "assets/images/products/omega_4.png",
    "price": 6200.0,
    "description": "Omega De Ville offers sophisticated style and impeccable performance.",
    "salePrice": 6000.0
  },

  {
    "id": 4,
    "brand": "Rolex",
    "name": "Rolex Yacht-Master",
    "image": "assets/images/products/rolex_1.png",
    "price": 14500.0,
    "description": "Rolex Yacht-Master is a luxury sailing watch with outstanding performance.",
    "salePrice": 13800.0
  },
  // Tag Heuer

  {
    "id": 14,
    "brand": "Tag Heuer",
    "name": "Tag Heuer Monaco",
    "image": "assets/images/products/tag_2.png",
    "price": 6000.0,
    "description": "Tag Heuer Monaco is a bold square-shaped chronograph watch.",
    "salePrice": 5800.0
  },
  {
    "id": 15,
    "brand": "Tag Heuer",
    "name": "Tag Heuer Aquaracer",
    "image": "assets/images/products/tag_3.png",
    "price": 2500.0,
    "description": "Tag Heuer Aquaracer is a versatile watch with a sporty feel.",
    "salePrice": 2400.0
  },
  {
    "id": 16,
    "brand": "Tag Heuer",
    "name": "Tag Heuer Link",
    "image": "assets/images/products/tag_4.png",
    "price": 2900.0,
    "description": "Tag Heuer Link combines comfort and elegance seamlessly.",
    "salePrice": 2750.0
  },

  // Breitling
  {
    "id": 17,
    "brand": "Breitling",
    "name": "Breitling Navitimer",
    "image": "assets/images/products/breitling_1.png",
    "price": 8900.0,
    "description": "The Breitling Navitimer is an aviation icon with impeccable craftsmanship.",
    "salePrice": 8500.0
  },
  {
    "id": 18,
    "brand": "Breitling",
    "name": "Breitling Superocean",
    "image": "assets/images/products/breitling_2.png",
    "price": 4800.0,
    "description": "The Breitling Superocean is built for underwater exploration.",
    "salePrice": 4600.0
  },
  {
    "id": 19,
    "brand": "Breitling",
    "name": "Breitling Chronomat",
    "image": "assets/images/products/breitling_3.png",
    "price": 7200.0,
    "description": "Breitling Chronomat is a multi-functional chronograph with a bold design.",
    "salePrice": 6900.0
  },
   {
    "id": 7,
    "brand": "Hublot",
    "name": "Hublot Spirit of Big Bang",
    "image": "assets/images/products/hublot_3.png",
    "price": 30000.0,
    "description": "Hublot Spirit of Big Bang combines innovative materials and style.",
    "salePrice": 29000.0
  },

];


  // Load products into the list
void loadProducts() {
  // Loop through the watches list and add each watch to the products list
  watches.forEach((watch) {
    products.add(
      Product(
        id: watch['id'],
        brand: watch['brand'],
        name: watch['name'],
        image: watch['image'],
        price: (watch['price']as num).toDouble(),
        description: watch['description'],
        salePrice: (watch['salePrice']as num).toDouble(),
      ),
    );
  });
}


  // Add to cart
  void addToCart(Product product) {
    if (!cart.contains(product)) {
      cart.add(product);
    } else {
      Get.snackbar("Info", "Product already in cart!");
    }
  }

  // Remove from cart
  void removeFromCart(Product product) {
    cart.remove(product);
  }

  // Add to wishlist
  void addToWishlist(Product product) {
    if (!wishlist.contains(product)) {
      wishlist.add(product);
    } else {
      Get.snackbar("Info", "Product already in wishlist!");
    }
  }

  // Remove from wishlist
  void removeFromWishlist(Product product) {
    wishlist.remove(product);
  }
}
