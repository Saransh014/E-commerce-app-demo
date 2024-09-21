import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-commerce App'),
        backgroundColor: const Color.fromARGB(255, 128, 194, 248),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add search functionality here
            },
          ),
          IconButton(
            // {{ edit_1 }}
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CartScreen()), // Navigate to CartScreen
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          CategoryList(),
          Expanded(child: ProductGrid()), // {{ edit_1 }}
          PromotionalBanner(),
        ],
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  // {{ edit_3 }}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Text('Your cart is empty!'), // Placeholder for cart content
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  final List<String> categories = ['Fruits', 'Vegetables', 'Meat', 'Drinks'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            // {{ edit_1 }}
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductListScreen(category: categories[index]),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 6, 197,
                    165), // Changed to give background color of grey
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                categories[index],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  // {{ edit_2 }}
  final String category;

  ProductListScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    // Simulated product data
    List<Map<String, dynamic>> products = [
      {
        'name': 'Product 1',
        'price': 9.99,
        'image': 'https://via.placeholder.com/150'
      },
      {
        'name': 'Product 2',
        'price': 14.99,
        'image': 'https://via.placeholder.com/150'
      },
      {
        'name': 'Product 3',
        'price': 19.99,
        'image': 'https://via.placeholder.com/150'
      },
      // Add more products as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Image.network(products[index]['image'],
                    height: 100, fit: BoxFit.cover),
                Text(products[index]['name'],
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('\$${products[index]['price']}'),
                ElevatedButton(
                  onPressed: () {
                    // Add to cart functionality
                  },
                  child: Text('Add to Cart'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  // {{ edit_2 }}
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Redbull',
      'price': 1.99,
      'image':
          'https://www.msrmarket.in/cdn/shop/products/51Bp30CR3IL._SL1080.jpg?v=1610366094.jpg'
    },
    {
      'name': 'Oreo',
      'price': 0.99,
      'image':
          'https://5.imimg.com/data5/SELLER/Default/2023/7/329269380/XR/ND/XF/48534106/719rjslxsxl-sl1500.jpg'
    },
    {
      'name': 'Eggs',
      'price': 1.49,
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2VOYFH7f-S_RtqAy27uS4XWG87EwKX8gJ6w&s.jpg'
    },
    {
      'name': 'Grapes',
      'price': 2.99,
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3YGPy8ylP9G_bBHw52sUv_3AX91Fp3W0pLA&s.jpg'
    },
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(
                  products[index]['image'],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      products[index]['name'],
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '\$${products[index]['price'].toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.green, fontSize: 14),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Add to cart functionality
                      },
                      child: Text('Add to Cart'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 36),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PromotionalBanner extends StatelessWidget {
  // {{ edit_1 }}
  @override
  Widget build(BuildContext context) {
    return Stack(
      // {{ edit_2 }}
      children: [
        Container(
          // {{ edit_3 }}
          height: 150, // Set height for the banner
          decoration: BoxDecoration(
            // {{ edit_4 }}
            border: Border.all(
                color: Colors.grey, width: 2), // Border color and width
            borderRadius: BorderRadius.circular(10), // Rounded corners
            boxShadow: [
              // Optional shadow for depth
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            // {{ edit_5 }}
            borderRadius: BorderRadius.circular(10), // Match border radius
            child: Image.network(
              // {{ edit_6 }}
              'https://www.apple.com/newsroom/images/2024/09/apple-introduces-iphone-16-and-iphone-16-plus/article/geo/Apple-iPhone-16-hero-geo-240909_inline.jpg.large.jpg', // Replace with your image URL
              fit:
                  BoxFit.cover, // Ensures the image covers the entire container
            ),
          ),
        ),
        Positioned(
          // {{ edit_7 }}
          right: 0.2, // Positioning from the right
          top: 0.2, // Positioning from the top
          child: IconButton(
            // {{ edit_8 }}
            icon: Icon(Icons.close,
                color: const Color.fromARGB(255, 0, 0, 0)), // Close icon
            onPressed: () {
              // Add functionality to close the banner
            },
          ),
        ),
      ],
    );
  }
}
