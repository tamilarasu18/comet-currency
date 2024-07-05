import 'package:comet_currency/routers/app_routers.dart';
import 'package:comet_currency/store/remove_store.dart';
import 'package:get/route_manager.dart';

import '../../model/product_model.dart';

class LandingPageViewModel {

  List<Product> productList = [
    Product(
        id: 1,
        name: 'Product 1',
        image:
            'https://cdn.pixabay.com/photo/2020/06/16/10/30/camera-5305154_640.jpg',
        price: 19.99,
        description: 'This is the description for product 1.'),
    Product(
        id: 2,
        name: 'Product 2',
        image:
            'https://cdn.pixabay.com/photo/2020/06/16/10/30/camera-5305154_640.jpg',
        price: 29.99,
        description: 'This is the description for product 2.'),
    Product(
        id: 3,
        name: 'Product 3',
        image:
            'https://cdn.pixabay.com/photo/2020/06/16/10/30/camera-5305154_640.jpg',
        price: 39.99,
        description: 'This is the description for product 3.'),
    Product(
        id: 4,
        name: 'Product 4',
        image:
            'https://cdn.pixabay.com/photo/2020/06/16/10/30/camera-5305154_640.jpg',
        price: 49.99,
        description: 'This is the description for product 4.'),
    Product(
        id: 5,
        name: 'Product 5',
        image:
            'https://cdn.pixabay.com/photo/2020/06/16/10/30/camera-5305154_640.jpg',
        price: 59.99,
        description: 'This is the description for product 5.'),
    Product(
        id: 6,
        name: 'Product 6',
        image:
            'https://cdn.pixabay.com/photo/2020/06/16/10/30/camera-5305154_640.jpg',
        price: 69.99,
        description: 'This is the description for product 6.'),
    Product(
        id: 7,
        name: 'Product 7',
        image:
            'https://cdn.pixabay.com/photo/2020/06/16/10/30/camera-5305154_640.jpg',
        price: 79.99,
        description: 'This is the description for product 7.'),
    Product(
        id: 8,
        name: 'Product 8',
        image:
            'https://cdn.pixabay.com/photo/2020/06/16/10/30/camera-5305154_640.jpg',
        price: 89.99,
        description: 'This is the description for product 8.'),
    Product(
        id: 9,
        name: 'Product 9',
        image:
            'https://cdn.pixabay.com/photo/2020/06/16/10/30/camera-5305154_640.jpg',
        price: 99.99,
        description: 'This is the description for product 9.'),
    Product(
        id: 10,
        name: 'Product 10',
        image:
            'https://cdn.pixabay.com/photo/2020/06/16/10/30/camera-5305154_640.jpg',
        price: 109.99,
        description: 'This is the description for product 10.'),
  ];

  logOut(){
    RemoveStore().removeUserData();
    Get.offAllNamed(AppRoutes.loginPage);
  }
}
