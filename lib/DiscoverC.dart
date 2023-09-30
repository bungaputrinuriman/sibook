import 'package:flutter/material.dart';
import 'DatabaseHelper.dart';
import 'Detailbook.dart';
import 'DiscoverB.dart';
import 'discover.dart';
import 'book.dart';

class DiscoverCPage extends StatefulWidget {
  @override
  _DiscoverCPageState createState() => _DiscoverCPageState();
}

class _DiscoverCPageState extends State<DiscoverCPage> {
  List<Book> bookmarkedBooks = [];
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    _loadBookmarkedBooks();
  }

  Future<void> _loadBookmarkedBooks() async {
    final List<Map<String, dynamic>> rows =
    await DatabaseHelper.instance.queryAllBooks();

    final List<Book> books = rows.map((row) {
      return Book(
        id: row['id'],
        title: row['title'],
        author: row['author'],
        image: row['image'],
        language: row['language'],
        releaseDate: row['releaseDate'],
        pageCount: row['pageCount'],
        genre: row['genre'],
        categori: row['categori'],
        rating: row['rating'],
        sinopsis: row['sinopsis'],
        bookPages: row['bookPages'],
        isBookmarked: true, // Setel status bookmark sebagai true karena buku sudah disimpan
      );
    }).toList();

    setState(() {
      bookmarkedBooks = books;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF2FA),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 45.0, right: 15.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/Bookmarks.jpg',
                width: 189.0,
                height: 56.0,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: bookmarkedBooks.length,
              itemBuilder: (context, index) {
                final book = bookmarkedBooks[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailBookPage(book: book),
                      ),
                    );
                  },
                  child: ListTile(
                    leading: Image.asset(
                      book.image,
                      width: 80.0,
                      height: 120.0,
                    ),
                    title: Text(book.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Genre: ${book.genre}'),
                        Text('Penulis: ${book.author}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _removeBook(book);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save),
            label: 'Bookmarks',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF064789),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          if (index == 0) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DiscoverPage(),
              ),
            );
          } else if (index == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DiscoverBPage(),
              ),
            );
          } else if (index == 2) {
            // Jika sudah berada di halaman DiscoverC, tidak perlu navigasi ulang.
          }
        },
      ),
    );
  }

  void _removeBook(Book book) async {
    setState(() {
      bookmarkedBooks.remove(book);
    });

    await DatabaseHelper.instance.deleteBook(book.id);
  }
}
