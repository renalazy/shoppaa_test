import 'package:sql_helper/sql_helper.dart';

class ProductEntity implements SQLEntity {
  int prodId;
  String title;
  String description;
  double price;
  String imageUrl;

  static final String tableName = 'Products';
  static final String columnProdId = 'id';
  static final String columnTitle = 'title';
  static final String columnDescription = 'description';
  static final String columnPrice = 'price';
  static final String columnImageUrl = 'imageUrl';

  static String createTable() {
    return '''CREATE TABLE $tableName (
      $columnProdId INTEGER PRIMARY KEY autoincrement,
      $columnTitle TEXT,
      $columnDescription TEXT,
      $columnPrice INTEGER,
      $columnImageUrl TEXT,
      )''';
  }

  // static String createTableNewMethod() {
  //   return SQLEntity.generateTable(tableName)
  //       .integer(columnProdId, primaryKey: true, autoincrement: true)
  //       .text(columnTitle)
  //       .text(columnDescription)
  //       .integer(columnPrice)
  //       .text(columnImageUrl)
  //       .build();
  // }

  ProductEntity();

  ProductEntity.fromMap(Map<String, dynamic> map) {
    prodId = map[columnProdId];
    title = map[columnTitle];
    description = map[columnDescription];
    price = map[columnPrice];
    imageUrl = map[columnImageUrl];
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      columnTitle: title,
      columnDescription: description,
      columnPrice: price,
      columnImageUrl: imageUrl
    };
    if (prodId != null) map[columnProdId] = prodId;
    return map;
  }
}
