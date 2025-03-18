class Item {
  final Map<String, dynamic> data;

  Item(this.data);

  String get name => data['name'] ?? 'unknown';
  String get description => data['description'] ?? 'no description';
}

final List<Map<String, dynamic>> allItemsData = [
  {'name': 'Apple', 'description': 'A red fruit.'},
  {'name': 'Banana', 'description': 'A yellow fruit.'},
  {'name': 'Cherry', 'description': 'A small red fruit.'},
  {'name': 'Date', 'description': 'A sweet brown fruit.'},
  {'name': 'Elderberry', 'description': 'A dark purple fruit.'},
  {'name': 'Fig', 'description': 'A soft, sweet fruit.'},
  {'name': 'Grape', 'description': 'A small, juicy fruit.'},
];

