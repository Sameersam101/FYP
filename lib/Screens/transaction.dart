import 'package:flutter/material.dart';

class TransactionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFA726),
        title: Text('Transaction', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _filterButton('7 Days'),
                _filterButton('15 Days'),
                _filterButton('7 Days'),
                _filterButton('Filter', icon: Icons.filter_list),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                _transactionDateHeader('Dec 4 - 2024'),
                _transactionItem('Noodles, Apples, Eggs + 1', 1000, true),
                _transactionItem('Noodles, Apples, Eggs + 1', 1000, false),
                _transactionDateHeader('Dec 3 - 2024'),
                _transactionItem('Noodles, Apples, Eggs + 1', 1000, true),
                _transactionItem('Noodles, Apples, Eggs + 1', 1000, false),
                _transactionDateHeader('Dec 2 - 2024'),
                _transactionItem('Noodles, Apples, Eggs + 1', 1000, true),
                _transactionItem('Noodles, Apples, Eggs + 1', 1000, false, note: 'BILL'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: Icon(Icons.home, color: Colors.black), onPressed: () {}),
            IconButton(icon: Icon(Icons.shopping_bag, color: Colors.black), onPressed: () {}),
            SizedBox(width: 40),
            IconButton(icon: Icon(Icons.receipt, color: Colors.black), onPressed: () {}),
            IconButton(icon: Icon(Icons.analytics, color: Colors.black), onPressed: () {}),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.apps, color: Colors.white),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _filterButton(String text, {IconData? icon}) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: icon != null ? Icon(icon, size: 18) : SizedBox.shrink(),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        side: BorderSide(color: Colors.black),
      ),
    );
  }

  Widget _transactionDateHeader(String date) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        date,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _transactionItem(String title, int amount, bool isIncome, {String? note}) {
    return Card(
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Cash In - 3883318191' + (note != null ? '\n$note' : '')),
        trailing: Text(
          (isIncome ? '+\$' : '-\$') + amount.toString(),
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isIncome ? Colors.green : Colors.red),
        ),
      ),
    );
  }
}