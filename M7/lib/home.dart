import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:m07/provider.dart';
import 'package:provider/provider.dart';

class m07 extends StatefulWidget {
  const m07({super.key});

  @override
  State<m07> createState() => _m07State();
}

class _m07State extends State<m07> {
  String title = "List item";
  bool _isVisible = true;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<belanja>(context);

    List<Widget> _widgeditem = prov.item
        .map(
          (e) => MyCard(text: e),
        )
        .toList();

    Widget _bodyaja() {
      if (_currentIndex == 1) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: _widgeditem,
          ),
        );
      } else if (_currentIndex == 0) {
        return Image.network(
            "https://upload.wikimedia.org/wikipedia/en/9/9a/Trollface_non-free.png");
      } else {
        return Container();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: _bodyaja(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: new Visibility(
        visible: _isVisible,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              prov.additem();
            });
          },
          child: Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Shop", icon: Icon(Icons.shop))
        ],
        onTap: (value) {
          if (value == 0) {
            _isVisible = false;
            title = "Home";
          }
          ;
          if (value == 1) {
            _isVisible = true;
            title = "Shop";
          }
          ;
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  String text = "";
  MyCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.shopping_bag),
      title: Text(text, style: TextStyle(color: Colors.red)),
    );
  }
}
