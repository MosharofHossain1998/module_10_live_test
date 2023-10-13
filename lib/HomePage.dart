import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> item = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  List<bool> isSelected = List.filled(5, false);
  int selectedCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selection screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: item.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (isSelected[index]) {
                      selectedCount--;
                    } else {
                      selectedCount++;
                    }
                    isSelected[index] = !isSelected[index];

                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected[index] ? Colors.blue : Colors.white,
                    ),
                    height: 50,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(item[index],style: TextStyle(fontSize: 18),),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 4,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Selected Item'),
                content: Text('Number Of Select Item : $selectedCount'),
                actions: [
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Close',style: TextStyle(color: Colors.blue),),
                      ))
                ],

              );
            },
          );
        },
        child: Icon(Icons.check), // Right arrow icon
      ),
    );
  }
}
