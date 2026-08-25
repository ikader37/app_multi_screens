import 'dart:convert';
import 'dart:async';
import 'package:app_multi_screens/customExceptions/ProductException.dart';
import 'package:app_multi_screens/models/Products.dart';
import 'package:app_multi_screens/repositories/Repository.dart';
import '../utilities/FileStorage.dart';

class Productrepositoryimpl implements Repository<Products>{
  FileStorage storage = new FileStorage();
  List<Products> _products=[];
  @override
  Future<void> addProduct(Products product) async{
    final maxId = _products.isEmpty
        ? 0
        : _products.map((t) => t.id).reduce((a, b) => a > b ? a : b);
    product.id = maxId + 1; // Assign a unique ID based on the current maximum ID
    _products.add(product);
    await storage.write(
      jsonEncode(_products.map((product) => product.toJson()).toList()) as List<Map<String, dynamic>>,
    );
  }

  @override
  Future<List<Products>> findAll() async{
    _products = [];

    try {
      final jsonString = await storage.read();
      print("LLLL:$jsonString");
      final decoded = jsonDecode(jsonString);

      if (decoded is! List) {
        throw const FormatException(
          'Le fichier doit contenir une liste de produits.',
        );
      }

      _products = decoded.map((json) {
        print("JJJJ:$json");
        if (json is! Map<String, dynamic>) {
          throw const FormatException(
            'Produit JSON invalide.',
          );
        }

        return Products.fromJson(json);
      }).toList();
      print('PRODUIT:::$_products');
      return _products;
    } on ProductFileReadException {
      rethrow;
    } on FormatException catch (e) {
      throw ProductFileReadException(
        'Le fichier products.json contient un JSON invalide : ${e.message}',
      );
    } catch (e) {
      print("EXCEPTTION:::${e}");
      throw ProductFileReadException(
        'Erreur lors du chargement des produits : ${e}',
      );
    }
  }

  @override
  Future<List<Products>> findMyFavorite() async{
    await init();

    return _products.where((prd)=>prd.isFavorite==true).toList();

  }

  @override
  Future<Products> findProductById(int id) async {
    await init();
    return _products.firstWhere(
          (prod) => prod.id == id,
      orElse: () => throw ProductNotFoundExecption(
        'Produit avec id $id non retrouvé',
      ),
    );
  }


  @override
  Future<void> init() async {
    _products = [];

    try {
      final jsonString = await storage.read();

      if (jsonString.trim().isEmpty) {
        return;
      }

      final decoded = jsonDecode(jsonString);

      if (decoded is! List) {
        throw const FormatException(
          'Le fichier doit contenir une liste de produits.',
        );
      }

      _products = decoded.map((json) {
        if (json is! Map<String, dynamic>) {
          throw const FormatException(
            'Produit JSON invalide.',
          );
        }

        return Products.fromJson(json);
      }).toList();
    } on ProductFileReadException {
      rethrow;
    } on FormatException catch (e) {
      throw ProductFileReadException(
        'Le fichier products.json contient un JSON invalide : ${e.message}',
      );
    } catch (e) {
      throw ProductFileReadException(
        'Erreur lors du chargement des produits : $e',
      );
    }
  }


  @override
  Future<List<Products>> searchByTitle(String title) async{
    await init();
    return _products.where((produit)=>produit.title.toLowerCase().contains(title.toLowerCase())).toList();
  }

  @override
  Future<void> addToFavorite(int productId) async{
    final jsonString = await storage.read();
    // final List<dynamic> products = jsonDecode(jsonString);
    final index = _products.indexWhere(
          (product) => product.id == productId,
    );
    if (index == -1) {
      return;
    }
    _products[index].isFavorite = true;
    await storage.write(
      jsonEncode(_products.map((product) => product.toJson()).toList()) as List<Map<String, dynamic>>,
    );
  }

  @override
  Future<void> removeFromFavorite(int productId) async{
    final jsonString = await storage.read();
    // final List<dynamic> products = jsonDecode(jsonString);
    final index = _products.indexWhere(
          (product) => product.id == productId,
    );
    if (index == -1) {
      return;
    }
    _products[index].isFavorite = false;
    await storage.write(
      jsonEncode(_products.map((product) => product.toJson()).toList()) as List<Map<String, dynamic>>,
    );
  }
  
}
