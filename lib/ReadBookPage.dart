import 'package:flutter/material.dart';

class ReadBookPage extends StatefulWidget {
  final List<String> pages;

  ReadBookPage({required this.pages});

  @override
  _ReadBookPageState createState() => _ReadBookPageState();
}

class _ReadBookPageState extends State<ReadBookPage> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
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
      appBar: AppBar(
        backgroundColor: Color(0xFFEBF2FA), // Ganti dengan kode warna HEX yang Anda inginkan
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black, // Ubah menjadi warna hitam sesuai keinginan Anda
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Kembali ke halaman sebelumnya
          },
        )

      ),

      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.pages.length,
        itemBuilder: (context, index) {
          return ScrollablePage(
            pageText: widget.pages[index],
            onPageChanged: (direction) {
              if (direction == PageDirection.next && index < widget.pages.length - 1) {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else if (direction == PageDirection.previous && index > 0) {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
          );
        },
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }
}

enum PageDirection {
  next,
  previous,
}

class ScrollablePage extends StatefulWidget {
  final String pageText;
  final ValueChanged<PageDirection> onPageChanged;

  ScrollablePage({required this.pageText, required this.onPageChanged});

  @override
  _ScrollablePageState createState() => _ScrollablePageState();
}

class _ScrollablePageState extends State<ScrollablePage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: _scrollController,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            widget.pageText,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: ReadBookPage(
        pages: [
          "Halaman 1",
          "Halaman 2",
          "Halaman 3",
          // Tambahkan halaman-halaman lainnya sesuai kebutuhan
        ],
      ),
    ),
  );
}
