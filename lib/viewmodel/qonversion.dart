import 'package:flutter/material.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';

class QonversionService extends ChangeNotifier {


  Future<void> initializeQonversion() async {
    final config = QonversionConfigBuilder('',
            QLaunchMode.subscriptionManagement)
        .setEntitlementsCacheLifetime(QEntitlementsCacheLifetime.year)
        .build();
    Qonversion.initialize(config);
  }

  Future<QOffering?> getMainOffering() async {

    try {
      QOfferings offerings = await Qonversion.getSharedInstance().offerings();
      QOffering? offering = offerings.main;
      return offering;
    } catch (e) {
      print("[QonversionService] Unexpected error $e");
    }
    return null;
  }

  Future<QProduct?> getProductById(String productId) async {

    try {
      final Map<String, QProduct?> productsMap =
          await Qonversion.getSharedInstance().products();
      final product = productsMap.values.first;
      return product;
    } catch (e) {
      print("[QonversionService] Unexpected error $e");
      return null;
    }
  }

  Future<void> purchaseProduct(QProduct product) async {

    try {
      await Qonversion.getSharedInstance().purchaseProduct(product);
      print("Successful purchased a product");
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Future<List<QProduct>> getPurchasedProducts() async {

    try {
      var map = await Qonversion.getSharedInstance().checkEntitlements();
      List<QProduct> products = [];
      for (final permission in map.values) {
        final product = await getProductById(permission.productId);
        products.add(product!);
      }
      return products;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<List<QProduct>> getProducts() async {

    final QOffering? offering = await getMainOffering();
    if (offering == null) {
      throw Error();
    }
    return offering.products;
  }
}

//     
//   }

//   Future<bool> purchaseProduct2(String productID) async {
//     bool isSuccess = false;
//     try {
//       await Qonversion.getSharedInstance().purchase(productID);
//       final Map<String, QEntitlement> entitlements =
//           await Qonversion.getSharedInstance().checkEntitlements();
//       final premium = entitlements['premium'];
//       if (premium != null && premium.isActive) {
//         return isSuccess = true;
//       }
//       // purchaseResult.success ile satın almanın başarılı olup olmadığını kontrol edebilirsiniz
//     } on QPurchaseException catch (e) {
//       // Satın alma işlemi sırasında bir hata oluştuğunda bu blok çalışacaktır
//       print('Purchase error: $e');
//     }
//     notifyListeners();
//     return isSuccess;
//   }

  // late final QOfferings offerings;
  // late final List<QProduct> products;
  // Future<QOfferings?> loadOfferings() async {
  //   try {
  //     QOfferings offerings = await Qonversion.getSharedInstance().offerings();
  //     notifyListeners();
  //     loadProducts();
  //     notifyListeners();
  //     return offerings;
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

  // Future<List<QProduct>> loadProducts() async {
  //   try {
  //     var mainOffering = await loadOfferings()?..offeringForIdentifier("purchase");

  //     notifyListeners();
  //     List<QProduct> products = await mainOffering!.main!.products;
  //     notifyListeners();
  //     return products;
  //   } catch (e) {
  //     print(e);
  //     return [];
  //   }
  // }
//   Future<void> loadProducts() async {
//     try {
//       final QOfferings offerings =
//           await Qonversion.getSharedInstance().offerings();
//       final List<QProduct> products = offerings.main!.products;
//       if (products.isNotEmpty) {
//         try {
//           final Map<String, QEntitlement> entitlements =
//               await Qonversion.getSharedInstance().purchaseProduct(products[0]);
//         } on QPurchaseException catch (e) {
//           print(e);
//         }
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }



  // void _initQonversion() async {
  //   final config = QonversionConfigBuilder('liN2bWGfO-pHWqygNH0ijR-vXlHoS3F5',
  //           QLaunchMode.subscriptionManagement)
  //       .build();
  //   await Qonversion.initialize(config);
  // }



  // Future<void> initializeQonversion() async {
  //   if (_debugMode) {
  //     final config = QonversionConfigBuilder('liN2bWGfO-pHWqygNH0ijR-vXlHoS3F5',
  //             QLaunchMode.subscriptionManagement)
  //         .build();
  //     await Qonversion.initialize(config);
  //   }
  // }

  // Future<QOffering?> getMainOffering() async {
  //   try {
  //     QOfferings offerings = await Qonversion.getSharedInstance().offerings();
  //     QOffering? offering = await offerings.main;
  //     notifyListeners();
  //     return offering;
  //   } catch (e) {
  //     print("[QonversionService] Unexpected error $e");
  //   }
  // }

  // Future<void> getMainProducts() async {
  //   QOfferings offerings = await Qonversion.getSharedInstance().offerings();
  //   final List<QProduct> products = offerings.main!.products;
  //   notifyListeners();
  //   if (offerings == null) {
  //     throw Error();
  //   }
  //   try {
  //     final Map<String, QEntitlement> entitlements =
  //         await Qonversion.getSharedInstance().purchaseProduct(products.first);
  //     notifyListeners();
  //   } on QPurchaseException catch (e) {
  //     if (e.isUserCancelled) {
  //       // Purchase canceled by the user
  //     }
  //     print(e);
  //   }
  // }

  // Future<QProduct> getProductById(String productId) async {
  //   await init;
  //   final QOffering? offering = await getMainOffering();
  //   final product = offering?.products.firstWhere(
  //     (element) => element.qonversionId == productId,
  //   );
  //   if (product == null) {
  //     throw Error();
  //   }

  //   return product;
  // }

  // Future<void> purchaseProduct2(QProduct product) async {
  //   try {
  //     await Qonversion.getSharedInstance().purchaseProduct(product);
  //     notifyListeners();
  //     print("Successful purchased a product");
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Future<List<QProduct>> getProducts() async {
  //   final QOffering? offering = await getMainOffering();
  //   products.add(offering!.products.first);
  //   if (offering == null) {
  //     throw Error();
  //   }
  //   notifyListeners();
  //   return products;
  // }


  // }

