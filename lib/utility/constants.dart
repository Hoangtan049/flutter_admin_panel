import 'package:flutter/material.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);
const defaultPadding = 16.0;

const MAIN_URL = 'http://localhost:8080';
class ApiPath{
  static getAllCategory() => 'api/get-all-categories?id=ALL';
  static getCategoryById(String id) => 'api/get-all-categories?id=$id';
  static updateCategory() => 'api/edit-categories';
  static deleteCategory() => 'api/delete-categories';
  static getAllProduct() => 'api/get-all-products?id=ALL';
  static getProductByCategory(String categoryId) => 'api/get-all-products?id=ALL&idCate=$categoryId';

}