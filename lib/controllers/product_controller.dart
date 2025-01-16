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
 Brand(name: "Rolex", image: "images/brands/rolex.png"),
  Brand(name: "Omega", image: "images/brands/omega.png"),
  Brand(name: "Breitling", image: "images/brands/breit.png"),
  Brand(name: "Hublot", image: "images/brands/hublot.png"),
  Brand(name: "Tag Heuer", image: "images/brands/tag.png"),
];





  List<Map<String, dynamic>> watches = [
  // Rolex
  {
    "id": 1,
    "brand": "Rolex",
    "name": "Rolex Submariner",
    "image": "images/products/rolex_4.png",
    "price": 12500,
    "description": "The Rolex Submariner is a classic diving watch with unmatched precision.",
    "salePrice": 11800
  },
   {
    "id": 6,
    "brand": "Hublot",
    "name": "Hublot Classic Fusion",
    "image": "images/products/hublot_2.png",
    "price": 14000,
    "description": "Hublot Classic Fusion offers understated luxury with modern design.",
    "salePrice": 13500
  },
    {
    "id": 13,
    "brand": "Tag Heuer",
    "name": "Tag Heuer Carrera",
    "image": "images/products/tag_1.png",
    "price": 3200,
    "description": "The Tag Heuer Carrera is a sleek, sporty watch for professionals.",
    "salePrice": 3100
  },
  {
    "id": 3,
    "brand": "Rolex",
    "name": "Rolex Day-Date",
    "image": "images/products/rolex_3.png",
    "price": 35000,
    "description": "Rolex Day-Date is a symbol of prestige and sophistication.",
    "salePrice": 34000
  },


  // Hublot
  {
    "id": 5,
    "brand": "Hublot",
    "name": "Hublot Big Bang",
    "image": "images/products/hublot_1.png",
    "price": 22000,
    "description": "Hublot Big Bang features an innovative design and bold aesthetics.",
    "salePrice": 21000
  },
   {
    "id": 20,
    "brand": "Breitling",
    "name": "Breitling Avenger",
    "image": "images/products/breitling_4.png",
    "price": 5800,
    "description": "Breitling Avenger combines precision and durability for adventurers.",
    "salePrice": 5600
  },
  {
    "id": 2,
    "brand": "Rolex",
    "name": "Rolex Datejust",
    "image": "images/products/rolex_3.png",
    "price": 7500,
    "description": "Rolex Datejust is the epitome of timeless elegance and precision.",
    "salePrice": 7300
  },
 
  {
    "id": 8,
    "brand": "Hublot",
    "name": "Hublot MP-11",
    "image": "images/products/hublot_5.png",
    "price": 90000,
    "description": "Hublot MP-11 showcases cutting-edge mechanics and luxurious design.",
    "salePrice": 88000
  },

  // Omega
  {
    "id": 9,
    "brand": "Omega",
    "name": "Omega Speedmaster",
    "image": "images/products/omega_1.png",
    "price": 5200,
    "description": "The Omega Speedmaster is an iconic chronograph built for precision.",
    "salePrice": 5000
  },
  {
    "id": 10,
    "brand": "Omega",
    "name": "Omega Seamaster",
    "image": "images/products/omega_2.png",
    "price": 4500,
    "description": "The Omega Seamaster is a favorite among divers and James Bond fans.",
    "salePrice": 4300
  },
  {
    "id": 11,
    "brand": "Omega",
    "name": "Omega Constellation",
    "image": "images/products/omega_3.png",
    "price": 3800,
    "description": "Omega Constellation is a timeless classic with a sleek design.",
    "salePrice": 3650
  },
  {
    "id": 12,
    "brand": "Omega",
    "name": "Omega De Ville",
    "image": "images/products/omega_4.png",
    "price": 6200,
    "description": "Omega De Ville offers sophisticated style and impeccable performance.",
    "salePrice": 6000
  },

  {
    "id": 4,
    "brand": "Rolex",
    "name": "Rolex Yacht-Master",
    "image": "images/products/rolex_1.png",
    "price": 14500,
    "description": "Rolex Yacht-Master is a luxury sailing watch with outstanding performance.",
    "salePrice": 13800
  },
  // Tag Heuer

  {
    "id": 14,
    "brand": "Tag Heuer",
    "name": "Tag Heuer Monaco",
    "image": "images/products/tag_2.png",
    "price": 6000,
    "description": "Tag Heuer Monaco is a bold square-shaped chronograph watch.",
    "salePrice": 5800
  },
  {
    "id": 15,
    "brand": "Tag Heuer",
    "name": "Tag Heuer Aquaracer",
    "image": "images/products/tag_3.png",
    "price": 2500,
    "description": "Tag Heuer Aquaracer is a versatile watch with a sporty feel.",
    "salePrice": 2400
  },
  {
    "id": 16,
    "brand": "Tag Heuer",
    "name": "Tag Heuer Link",
    "image": "images/products/tag_4.png",
    "price": 2900,
    "description": "Tag Heuer Link combines comfort and elegance seamlessly.",
    "salePrice": 2750
  },

  // Breitling
  {
    "id": 17,
    "brand": "Breitling",
    "name": "Breitling Navitimer",
    "image": "images/products/breitling_1.png",
    "price": 8900,
    "description": "The Breitling Navitimer is an aviation icon with impeccable craftsmanship.",
    "salePrice": 8500
  },
  {
    "id": 18,
    "brand": "Breitling",
    "name": "Breitling Superocean",
    "image": "images/products/breitling_2.png",
    "price": 4800,
    "description": "The Breitling Superocean is built for underwater exploration.",
    "salePrice": 4600
  },
  {
    "id": 19,
    "brand": "Breitling",
    "name": "Breitling Chronomat",
    "image": "images/products/breitling_3.png",
    "price": 7200,
    "description": "Breitling Chronomat is a multi-functional chronograph with a bold design.",
    "salePrice": 6900
  },
   {
    "id": 7,
    "brand": "Hublot",
    "name": "Hublot Spirit of Big Bang",
    "image": "images/products/hublot_3.png",
    "price": 30000,
    "description": "Hublot Spirit of Big Bang combines innovative materials and style.",
    "salePrice": 29000
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
        price: watch['price'],
        description: watch['description'],
        salePrice: watch['salePrice'],
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
