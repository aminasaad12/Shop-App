

// class HomeModels
// {
//
//   bool? status;
//   HomeDataModels? data;
//
//   HomeModels.fromJson(Map<String, dynamic> json){
//   status = json['status'];
//   data = json['data'];
//   }
//
// }
//
// class HomeDataModels
// {
//   List<BannerModel>? banners = [];
//   List<ProducstModel>? producst = [];
//   HomeDataModels.fromJson(Map<String, dynamic> json)
//   {
//     json['banners'].forEach((element)
//     {
//       banners!.add(element);
//     });
//     json['producst'].forEach((element)
//     {
//       producst!.add(element);
//     });
//
//   }
//
// }
//
//
// class BannerModel
// {
//   int? id;
//   String? image;
//
//   BannerModel.fromJson(Map<String, dynamic> json)
//   {
//     id = json['id'];
//     image = json['image'];
//
//   }
// }
//
// class ProducstModel
// {
//   int? id;
//   String? image;
//   dynamic price;
//   dynamic old_price;
//   dynamic discount;
//   String? name;
//   bool? in_favorites;
//   bool? in_cart;
//
//   ProducstModel.fromJson(Map<String, dynamic> json)
//   {
//     id = json['id'];
//     image = json['image'];
//     price = json['price'];
//     old_price = json['old_price'];
//     discount = json['discount'];
//     name = json['name'];
//     in_favorites = json['in_favorites'];
//     in_cart = json['in_cart'];
//
//   }
// }







class HomeModel {
  late bool status;
  Data? data;
  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  List<Banners>? banners;

  List<Products>? products;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((element) {
        banners!.add(Banners.fromJson(element));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((element) {
        products!.add(Products.fromJson(element));
      });
    }
  }
}

class Banners {
  late int id;
  late String image;

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class Products {
  late int id;
  dynamic price;
  dynamic oldPrice;
  dynamic disCount;
  late String image;
  late String name;
  late String description;
  late bool inFavorites;
  late bool inCart;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    disCount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}