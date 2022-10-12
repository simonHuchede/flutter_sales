import 'package:flutter/material.dart';

import 'avis_model.dart';

class ProductModel {
  var id;
  var nom;
  var image;
  var description;
  var prix;
  var category;
  List<AvisModel> avis = [
    AvisModel(1, "simon", 4, "très bon produit"),
    AvisModel(2, "xavier", 3, "bon produit"),
    AvisModel(3, "quentin", 4.5, "très très bon produit"),
    AvisModel(4, "inès", 5, "très très très bon produit"),
  ];

  ProductModel(
      this.id, this.nom, this.prix, this.description, this.category, this.image,this.avis);

  displayPrice() {
    print(' ${prix} €');
  }

  ProductModel.fromJson(Map<String, dynamic> map)
      : id = map["id"],
        nom = map["title"],
        prix = map["price"],
        description = map["description"],
        category = map["category"],
        image = map["image"];


}
