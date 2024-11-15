import 'package:flutter/material.dart';

void main() {
  runApp(const ProductApp());
}

class ProductApp extends StatelessWidget {
  const ProductApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Catalog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: ProductListPage(),
    );
  }
}

class ProductListPage extends StatelessWidget {
  ProductListPage({super.key});

  final List<Map<String, dynamic>> products = [
    {
      'id': 1,
      'name': 'Product A',
      'description': 'Description of Product A',
      'price': 29.99,
      'photoUrl': 'https://via.placeholder.com/150'
    },
    {
      'id': 2,
      'name': 'Product B',
      'description': 'Description of Product B',
      'price': 49.99,
      'photoUrl': 'https://via.placeholder.com/150'
    },
    {
      'id': 3,
      'name': 'Product C',
      'description': 'Description of Product C',
      'price': 19.99,
      'photoUrl': 'https://via.placeholder.com/150'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(
                product['photoUrl'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(product['name']),
              subtitle: Text('\$${product['price']}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product['photoUrl'],
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
              const SizedBox(height: 16),
              Text(
                product['name'],
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                product['description'],
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                'Price: \$${product['price']}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
