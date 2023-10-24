import 'package:qara/page1/data/product_module.dart';

class Pagestate{
  bool isloading;
  List<ProductModule> products;
  Pagestate({
    this.isloading = false, 
    this.products = const [],

  });
  Pagestate copywith({
    bool? isloading,
    List<ProductModule>? products,
  })
  {
    return Pagestate(
      isloading: isloading ?? this.isloading,
      products: products ?? this.products,
    );
  }
}