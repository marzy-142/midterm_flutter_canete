import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MidtermExam(),
      theme: ThemeData(
          primaryColor: Colors.blueAccent, fontFamily: 'Merriweather'),
    );
  }
}

class MidtermExam extends StatefulWidget {
  @override
  _MidtermExamState createState() => _MidtermExamState();
}

class _MidtermExamState extends State<MidtermExam> {
  List<Item> items = [
    Item(name: 'Apple 🍏', details: 'A sweet red fruit.'),
    Item(name: 'Banana 🍌', details: 'A long yellow fruit.'),
    Item(name: 'Cherry 🍒', details: 'A small red fruit.'),
    Item(name: 'Date 🧆', details: 'A sweet brown fruit.'),
    Item(
        name: 'Grape 🍇', details: 'A small round fruit, can be red or green.'),
    Item(name: 'Mango 🥭', details: 'A tropical stone fruit.'),
    Item(name: 'Orange 🍊', details: 'A citrus fruit, usually orange.'),
    Item(name: 'Pineapple 🍍', details: 'A tropical fruit with spiky skin.'),
    Item(
        name: 'Strawberry 🍓',
        details: 'A red fruit with seeds on the outside.'),
    Item(
        name: 'Watermelon 🍉',
        details: 'A large fruit with green skin and red flesh.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        title: const Text('Mariella Doreen Cañete_MidtermExam'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemCard(
            item: items[index],
            onDetailsPressed: () {
              print(items[index].details);
            },
            onAddPressed: () {
              setState(() {
                items[index].isAdded = !items[index].isAdded;
              });
            },
          );
        },
      ),
    );
  }
}

class Item {
  final String name;
  final String details;
  bool isAdded = false;

  Item({required this.name, required this.details});
}

class ItemCard extends StatelessWidget {
  final Item item;
  final VoidCallback onDetailsPressed;
  final VoidCallback onAddPressed;

  ItemCard({
    required this.item,
    required this.onDetailsPressed,
    required this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: item.isAdded ? Colors.deepOrangeAccent : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Text(item.name),
            ),
            ElevatedButton(
              onPressed: onDetailsPressed,
              child: const Text('Details'),
            ),
            const SizedBox(width: 5),
            ElevatedButton(
              onPressed: onAddPressed,
              child: Text(
                item.isAdded ? 'Added' : 'Add',
                style: const TextStyle(fontFamily: 'BebasNeue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
