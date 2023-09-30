import 'package:flutter/material.dart';
import 'DatabaseHelper.dart';
import 'DiscoverC.dart';
import 'ReadBookPage.dart';
import 'discover.dart';
import 'DiscoverB.dart';
import 'book.dart'; // Import kelas Book

class DetailBookPage extends StatefulWidget {
  final Book book;
  DetailBookPage({required this.book});
  @override
  _DetailBookPageState createState() => _DetailBookPageState();
}
class _DetailBookPageState extends State<DetailBookPage> {
  int _selectedIndex = 0;
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF2FA),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 45.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Gambar buku
                    Image.asset(
                      'assets/Detail Buku.png',
                      width: 189.0,
                      height: 56.0,
                    ),
                    // Icon Save dan Back
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            widget.book.isBookmarked
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: widget.book.isBookmarked
                                ? Colors.black
                                : null,
                          ),
                          onPressed: () async {
                            final bool isAlreadyBookmarked = widget.book.isBookmarked;

                            if (isAlreadyBookmarked) {
                              // Hapus buku dari database
                              final rowsDeleted = await DatabaseHelper.instance.deleteBook(widget.book.id);
                              print('Deleted $rowsDeleted row(s)'); // Tambahkan ini
                            } else {
                              // Simpan buku ke dalam database
                              final insertedId = await DatabaseHelper.instance.insertBook({
                                'id': widget.book.id,
                                'image': widget.book.image,
                                'title': widget.book.title,
                                'author': widget.book.author,
                                // Tambahkan kolom lain yang diperlukan
                              });
                              print('Inserted with ID: $insertedId'); // Tambahkan ini
                            }

                            // Perbarui status bookmark pada objek Book
                            setState(() {
                              widget.book.isBookmarked = !isAlreadyBookmarked;
                            });
                          },

                        ),

                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            // Kembali ke halaman sebelumnya
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0), // Spacer between book info and synopsis
              Row(
                children: [
                  // Gambar buku
                  Container(
                    width: 170.0,
                    height: 250.0,
                    child: Image.asset(
                      widget.book.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Informasi buku (Judul, Genre, Penulis, Rating)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${widget.book.title}',
                            style: TextStyle(
                              color: Color(0xFF427AA1),
                              fontFamily: 'Inter', // Ganti dengan nama font Inter yang sesuai
                              fontSize: 21.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${widget.book.genre}',
                            style: TextStyle(
                              color: Color(0xFFC7C7C7),
                              fontFamily: 'Inter', // Ganti dengan nama font Inter yang sesuai
                              fontSize: 18.0,
                            ),
                          ),
                          Text(
                            '${widget.book.author}',
                            style: TextStyle(
                              color: Color(0xFFC7C7C7),
                              fontFamily: 'Inter', // Ganti dengan nama font Inter yang sesuai
                              fontSize: 18.0,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 24.0,
                              ),
                              Text(
                                ' ${widget.book.rating.toStringAsFixed(1)}',
                                style: TextStyle(
                                  color: Color(0xFF427AA1),
                                  fontFamily: 'Inter', // Ganti dengan nama font Inter yang sesuai
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0), // Spasi antara informasi buku dan sinopsis
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Mengatur jarak antara kotak-kotak
                children: [
                  // Kotak 1
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '${widget.book.language}',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF427AA1),
                            fontFamily: 'Inter',
                          ),
                        ),
                        SizedBox(height: 10.0), // Jarak antara teks
                        Text(
                          'Bahasa',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFFC7C7C7),
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Kotak 2
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '${widget.book.releaseDate}',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF427AA1),
                            fontFamily: 'Inter',
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Dirilis',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFFC7C7C7),
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Kotak 3
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '${widget.book.pageCount}',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF427AA1),
                            fontFamily: 'Inter',
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'page',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFFC7C7C7),
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0), // Spasi antara informasi buku dan sinopsis
              Container(
                padding: EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Sinopsis:', // Teks "Sinopsis"
                      style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF427AA1),
                      ),
                    ),
                    SizedBox(height: 8.0), // Spasi sebelum sinopsis
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Text(
                        isExpanded
                            ? widget.book.sinopsis // Mengambil sinopsis dari buku yang dipilih
                            : 'Baca Sinopsis Selengkapnya...', // Teks selengkapnya saat sinopsis tidak diperluas
                        style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Inter',
                          color: Color(0xFF427AA1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0), // Tambahkan jarak vertikal di sini
              Container(
                height: 59.0, // Tinggi tombol
                width: 273.0, // Lebar tombol
                margin: EdgeInsets.only(left: 40.0), // Margin dari kiri dan atas
                child: ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman pembacaan buku di sini
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ReadBookPage(pages: widget.book.bookPages), // Sertakan daftar halaman buku yang sesuai
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF064789), // Contoh warna biru dengan kode HEX
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // Sudut melengkung
                    ),
                  ),
                  child: Text(
                    'Baca Buku',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            ]
        ),
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
            // Navigate to the home page (DiscoverPage in your case)
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DiscoverPage(),
              ),
            );
          } else if (index == 1) {
            // Navigate to the DiscoverBPage
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DiscoverBPage(),
              ),
            );
          } else if (index == 2) {
            // Navigate to the DiscoverCPage
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DiscoverCPage(),
              ),
            );
          }
        },
      ),
    );
  }
}
