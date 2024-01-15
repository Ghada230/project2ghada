import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
//const String _baseURL = 'mobileproject.000webhostapp.com';
//final List<String> books = [];
class BooksList extends StatefulWidget {
  const BooksList({Key? key}) : super(key: key);

  @override
  State<BooksList> createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  final List<Book> books = [];
  bool _load = false;
  double _totalPrice = 0;

  @override
  void initState() {
    super.initState();
    updateBooks();
  }

  void updateBooks() async {
    try {
      final url = Uri.https('mobileproject.000webhostapp.com', 'getBooks.php');
      final response = await http.get(url).timeout(const Duration(seconds: 20));

      if (response.statusCode == 200) {
        final jsonResponse = convert.jsonDecode(response.body);
        for (var row in jsonResponse) {
          books.add(Book(
            name: row['name'],
            price: double.parse(row['price']),
            image: row['image'],
          ));
        }
        setState(() {
          _load = true;
        });
      }
    } catch (e) {
      // Handle error if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Books'),
        centerTitle: true,
      ),
      body: _load
          ? Container(
        color: Colors.lightGreen.shade200,
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              ' ${_totalPrice.toStringAsFixed(2)}  السعر الجمالي  :ل.ل',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20), // Adjust the spacing as needed
            Expanded(
              child: Center(
                child: ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                          children: [
                            SizedBox(width: 50),
                            Checkbox(
                              value: books[index].selected,
                              onChanged: (bool? e) {
                                if (e != null) {
                                  setState(() {
                                    books[index].selected = e;
                                    if (books[index].selected) {
                                      _totalPrice += books[index].price;
                                    } else {
                                      _totalPrice -= books[index].price;
                                    }
                                  });
                                }
                              },
                              activeColor: Colors.green,
                            ),
                            Center(
                              child: Text(
                                books[index].toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Add the image widget here if needed
                        Image.network(
                          books[index].image,
                          height: 100,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      )
          : const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class Book {
  String name;
  double price;
  bool selected;
  String image;

  Book({
    required this.name,
    required this.price,
    this.selected = false,
    required this.image,
  });

  @override
  String toString() {
    return 'name: $name, price: $price';
  }
}