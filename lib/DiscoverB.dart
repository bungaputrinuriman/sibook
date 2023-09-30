import 'package:flutter/material.dart';
import 'DatabaseHelper.dart';
import 'Detailbook.dart';
import 'DiscoverC.dart';
import 'discover.dart';
import 'book.dart'; // Import kelas Book


class DiscoverBPage extends StatefulWidget {
  @override
  _DiscoverBPageState createState() => _DiscoverBPageState();
}

class _DiscoverBPageState extends State<DiscoverBPage> {
  int _selectedIndex = 1; // Indeks item yang dipilih (Discover)
  String _selectedcategori = '';
  String searchQuery = ''; // Query pencarian
  List<String> categori = [
    'Novel',
    'Komik',
    'Agama',
    'Edukasi'
  ];
  List<Book> books = [];

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  Future<void> _loadBooks() async {
    final List<Map<String, dynamic>> rows = await DatabaseHelper.instance
        .queryAllBooks();

    final List<Book> loadedBooks = rows.map((row) {
      final bool isBookmarked = row['isBookmarked'] ==
          1; // Ubah sesuai dengan format penyimpanan Anda
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
        isBookmarked: isBookmarked,
      );
    }).toList();

    setState(() {
      books = loadedBooks;
    });
  }

  void _bookmarkBook(Book book) async {
    final bool isAlreadyBookmarked = book.isBookmarked;

    if (isAlreadyBookmarked) {
      await DatabaseHelper.instance.deleteBook(book.id);
    } else {
      await DatabaseHelper.instance.insertBook({
        'id': book.id,
        'title': book.title,
        'author': book.author,
        'image': book.image,
        'language': book.language,
        'releaseDate': book.releaseDate,
        'pageCount': book.pageCount,
        'genre': book.genre,
        'categori': book.categori,
        'rating': book.rating,
        'sinopsis': book.sinopsis,
        'bookPages': book.bookPages,
        'isBookmarked': 1, // Ubah sesuai dengan format penyimpanan Anda
      });
    }

    // Perbarui status bookmark pada objek Book
    setState(() {
      book.isBookmarked = !isAlreadyBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Peroleh daftar buku dari fungsi getBooks()
    List<Book> books = getBooks();

    List<Book> displayedBooks = books.where((book) {
      final categoriMatch = _selectedcategori.isEmpty ||
          book.categori == _selectedcategori;
      final searchMatch =
          searchQuery.isEmpty ||
              book.title.toLowerCase().contains(searchQuery.toLowerCase());
      return categoriMatch && searchMatch;
    }).toList();

    return Scaffold(
      backgroundColor: Color(0xFFEBF2FA),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 60.0,
            left: 16.0,
            child: Image.asset(
              'assets/Discover.png',
              width: 143.0,
              height: 39.0,
            ),
          ),
          Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 398.0,
                  height: 56.0,
                  margin: EdgeInsets.only(
                      top: 123.0, left: 16.0),
                  // Mengatur margin (posisi) dari kotak pencarian
                  decoration: BoxDecoration(
                    color: Color(0xFF064789),
                    borderRadius: BorderRadius.circular(
                        20.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  // Mengatur padding horizontal
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white, // Warna teks dalam kotak
                      fontSize: 16.0, // Ukuran teks dalam kotak
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ), // Warna teks hint
                      border: InputBorder.none, // Hilangkan garis tepi kotak
                      icon: Icon(Icons.search, color: Colors
                          .white), // Ikon pencarian dengan warna putih
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  height: 60.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categori.length,
                    itemBuilder: (context, index) {
                      final category = categori[index];
                      bool isSelected = category == _selectedcategori;

                      Color buttonColor = isSelected
                          ? Color(0xFF064789)
                          : Colors.transparent;
                      Color textColor = isSelected ? Colors.white : Color(
                          0xFF064789);

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedcategori = isSelected ? '' : category;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 12.0, top: 25.0),
                          height: 1.0,
                          width: 88.0,
                          decoration: BoxDecoration(
                            color: buttonColor,
                            border: Border.all(
                              color: Color(0xFF064789),
                              width: 1.0, // Ubah ketebalan border sesuai kebutuhan Anda
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Text(
                              category,
                              style: TextStyle(
                                color: textColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 20.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: displayedBooks.length,
                    itemBuilder: (context, index) {
                      final book = displayedBooks[index];
                      if (searchQuery.isNotEmpty &&
                          !book.title.toLowerCase().contains(
                              searchQuery.toLowerCase())) {
                        // Jika pencarian tidak cocok dengan judul buku, jangan tampilkan
                        return SizedBox.shrink();
                      }
                      return GestureDetector(
                        onTap: () {
                          // Navigasi ke halaman detail buku dengan mengirim data buku
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailBookPage(
                                      book: book), // Pass the book object
                            ),
                          );
                        },
                        child: ListTile(
                          leading: Image.asset(
                            book.image,
                            width: 50.0, // Ubah lebar sesuai kebutuhan Anda
                            height: 250.0, // Ubah tinggi sesuai kebutuhan Anda
                          ),
                          title: Text(book.title),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${book.genre}'),
                              Text('${book.author}'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
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
            _selectedIndex = index; // Mengatur indeks yang dipilih
          });

          if (index == 0) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) =>
                    DiscoverPage(),
              ),
            );
          } else if (index == 1) {
            // Jika sudah berada di halaman Discover, tidak perlu navigasi ulang.
          } else if (index == 2) {
            // Navigasi ke halaman "Bookmarks"
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) =>
                    DiscoverCPage(), // Gantilah dengan halaman "Bookmarks" Anda
              ),
            );
          }
        },
      ),
    );
  }
}
