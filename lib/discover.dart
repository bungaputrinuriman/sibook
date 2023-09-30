import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Detailbook.dart';
import 'DiscoverB.dart';
import 'DiscoverC.dart';
import 'book.dart'; // Import the file where your list of books is defined

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  int _selectedIndex = 0; // Indeks item yang dipilih
  final PageController _pageController = PageController();
  int _currentPage = 0;


  // Daftar ikon
  List<Widget> _appBarIcons = [
    Icon(Icons.search),
  ];

  // Daftar gambar untuk slide
  List<String> _slideImages = [
    'assets/pict.png', // Gantilah dengan path gambar pertama
    'assets/pict.png', // Gantilah dengan path gambar kedua
    'assets/pict.png', // Gantilah dengan path gambar ketiga
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBF2FA), // Ganti dengan kode warna HEX yang Anda inginkan
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 45.0, right: 15.0), // Sesuaikan margin kanan
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/logo.png',
                width: 189.0,
                height: 56.0,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 0.5,), // Tambahkan spasi di atas PageView
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: _slideImages.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        _slideImages[index],
                        width: 200.0,
                        height: 5.0,
                      );
                    },
                    onPageChanged: (int pageIndex) {
                      setState(() {
                        _currentPage = pageIndex;
                      });
                    },
                  ),
                  Positioned(
                    bottom: 3.0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width: 100.0, // Lebar sesuai dengan gambar
                        height: 20.0, // Tinggi indikator
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            _slideImages.length,
                                (index) {
                              return Container(
                                width: 10.0,
                                height: 10.0,
                                margin: EdgeInsets.symmetric(horizontal: 4.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: index == _currentPage
                                      ? Color(0xFF427AA1) // Warna indikator aktif
                                      : Color(0xFFC7C7C7), // Warna indikator normal
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 190.0,
                  height: 24.0,
                  child: Text(
                    'Rekomendasi Novel',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFF427AA1), // Contoh warna biru
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DiscoverBPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: 62.0,
                    height: 19.0,
                    child: Text(
                      'View All',
                      style: TextStyle(
                        color: Color(0xFF427AA1), // Contoh warna biru
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: getBooks().length,
              itemBuilder: (context, index) {
                final book = getBooks()[index]; // Dapatkan buku dari daftar
                return GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman detail buku dengan mengirim data buku
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailBookPage(book: book), // Pass the book object
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
                  ),
                );
              },
            ),
          ),
        ]
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
            // Navigasi ke halaman "Home"
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DiscoverPage(),
              ),
            );
          } else if (index == 1) {
            // Navigasi ke halaman "Discover"
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DiscoverBPage(),
              ),
            );
          } else if (index == 2) {
            // Navigasi ke halaman "Bookmarks"
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

