import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import '../customExceptions/ProductException.dart';

class FileStorage {
  static const String assetPath = 'assets/data/products.json';
  static const String fileName = 'products.json';

  /// Retourne le fichier local de l'application.
  Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();

    return File('${directory.path}/$fileName');
  }

  /// Initialise le fichier local à partir de l'asset.
  Future<File> _initializeFile() async {
    final file = await _getLocalFile();

    if (!await file.exists()) {
      final initialData = await rootBundle.loadString(assetPath);
      await file.writeAsString(initialData);
    }

    return file;
  }

  /// Lire les données.
  Future<String> read() async {
    try {
      final file = await _initializeFile();

      return await file.readAsString();
    } catch (e) {
      throw ProductFileReadException(
        'Impossible de lire products.json : $e',
      );
    }
  }

  /// Écrire les données.
  Future<void> write(List<Map<String, dynamic>> data) async {
    try {
      final file = await _initializeFile();

      final jsonString = jsonEncode(data);

      await file.writeAsString(
        jsonString,
        flush: true,
      );
    } catch (e) {
      throw ProductFileReadException(
        'Impossible d\'écrire products.json : $e',
      );
    }
  }
}