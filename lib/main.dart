import 'package:flutter/material.dart';

class Food {
  final String name;
  final String category;
  final String description;
  final String price;
  final IconData icon;
  final Color color;

  const Food({
    required this.name,
    required this.category,
    required this.description,
    required this.price,

    required this.icon,
    required this.color,
  });
}

const List<Food> menuItems = [
  Food(
    name: 'Grilled Chicken Rice',
    category: 'Main Course',
    price: 'RM 12.00',
    description: 'Juicy grilled chicken served with fragrant rice, fresh cucumber and chilli sauce.',
    icon: Icons.rice_bowl,
    color: Color(0xFFFFE0B2),
  ),
  Food(
    name: 'Cheese Pizza',
    category: 'Fast Food',
    description:
        'Delicious cheese pizza with a crispy crust and melted mozzarella.',
    price: 'RM 18.00',
    icon: Icons.local_pizza,
    color: Color(0xFFFFCDD2),
  ),
  Food(
    name: 'Chocolate Cake',
    category: 'Dessert',
    description:
        'Rich and moist chocolate cake with a decadent chocolate ganache.',
    price: 'RM 9.50',
    icon: Icons.cake,
    color: Color(0xFFD7CCC8),
  ),
];

void main() {
  runApp(const RestaurantMenuApp());
}

class RestaurantMenuApp extends StatelessWidget {
  const RestaurantMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Menu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 11, 14, 106),
        ),
        useMaterial3: true,
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 55, 141),
      appBar: AppBar(
        title: const Text('Restaurant Menu'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: menuItems.length,
        itemBuilder: (context, index) => FoodCard(food: menuItems[index]),
      ),
    );
  }
}


class FoodCard extends StatelessWidget {
  final Food food;

  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      color: food.color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => FoodDetailScreen(food: food)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: const Color.fromARGB(255, 24, 13, 90),
                child: Icon(food.icon, size: 36, color: Colors.deepOrange),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(food.category),
                    const SizedBox(height: 8),
                    Text(
                      food.price,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodDetailScreen extends StatelessWidget {
  final Food food;

  const FoodDetailScreen({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(food.name)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundColor: food.color,
                child: Icon(food.icon, size: 80, color: Colors.deepOrange),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              food.name,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Chip(label: Text(food.category)),
            const SizedBox(height: 16),
            Text(food.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            Text(
              food.price,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.deepOrange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
