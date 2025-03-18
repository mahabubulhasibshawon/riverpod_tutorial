class Product {
  final String id;
  final String name;
  final double price;
  final String category;

  Product({required this.id, required this.name, required this.price, required this.category});
}

final List<Product> allProducts = [
  Product(id: '1', name: 'Laptop', price: 1200.0, category: 'Electronics'),
  Product(id: '2', name: 'Smartphone', price: 800.0, category: 'Electronics'),
  Product(id: '3', name: 'T-shirt', price: 25.0, category: 'Clothing'),
  Product(id: '4', name: 'Jeans', price: 50.0, category: 'Clothing'),
  Product(id: '5', name: 'Book', price: 15.0, category: 'Books'),
  Product(id: '6', name: 'Tablet', price: 300.0, category: 'Electronics'),
];