import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'discover.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Color backgroundColor = Color(0xFFEBF2FA);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFEBF2FA), // Ganti dengan kode warna HEX yang Anda inginkan
        body: SingleChildScrollView(
          child: Center(
            child: GradientCircle(
              circleWidth: 559.0, // Lebar lingkaran
              circleHeight: 589.0, // Tinggi lingkaran
              circleLeft: -85.0, // Posisi kiri lingkaran
              circleTop: -93.0, // Posisi atas lingkaran
              startColorHex: 0xFF699BF7, // Warna gradasi awal (biru)
              endColorHex: 0xFF3C4E7B, // Warna gradasi akhir (ungu)
              svgPath: 'assets/pana.svg', // Path ke file SVG Anda
              vectorWidth: 321.42, // Lebar vektor
              vectorHeight: 299.5, // Tinggi vektor
              vectorLeft: 54.0, // Posisi kiri vektor
              vectorTop: 111.0, // Posisi atas vektor
            ),
          ),
        ),
      ),
    );
  }
}

class GradientCircle extends StatelessWidget {
  final double circleWidth;
  final double circleHeight;
  final double circleLeft;
  final double circleTop;
  final int startColorHex;
  final int endColorHex;
  final String svgPath;
  final double vectorWidth;
  final double vectorHeight;
  final double vectorLeft;
  final double vectorTop;

  GradientCircle({
    required this.circleWidth,
    required this.circleHeight,
    required this.circleLeft,
    required this.circleTop,
    required this.startColorHex,
    required this.endColorHex,
    required this.svgPath,
    required this.vectorWidth,
    required this.vectorHeight,
    required this.vectorLeft,
    required this.vectorTop,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: circleWidth,
          height: circleHeight,
          margin: EdgeInsets.only(bottom: 0), // Jarak dari teks besar ke bawah
          child: Stack(
            children: [
              Positioned(
                left: circleLeft,
                top: circleTop,
                width: circleWidth,
                height: circleHeight,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Color(startColorHex),
                        Color(endColorHex),
                      ],
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      svgPath,
                      width: vectorWidth,
                      height: vectorHeight,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Jendela ke Dunia Baru:',
              style: TextStyle(
                fontSize: 32.0,
                color: Color(0xFF427AA1), // Contoh warna biru
                fontFamily: 'Inter',
              ),
            ),
            Text(
              'Membaca Buku',
              style: TextStyle(
                color: Color(0xFF427AA1), // Contoh warna biru
                fontFamily: 'Inter', // Ganti dengan nama font Inter yang sesuai
                fontSize: 32.0,
              ),
            ),
          ],
        ),
        SizedBox(height:20,), // Tambahkan jarak lagi jika diperlukan
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Kumpulan Buku Terlengkap Untuk',
              style: TextStyle(
                color: Color(0xFFC7C7C7), // Contoh warna biru
                fontFamily: 'Inter', // Ganti dengan nama font Inter yang sesuai
                fontSize: 16.0,
              ),
            ),
            Text(
              'Tambahkan Wawasanmu Hanya Disini.',
              style: TextStyle(
                color: Color(0xFFC7C7C7), // Contoh warna biru
                fontSize: 16.0,
                fontFamily: 'Inter', // Ganti dengan nama font Inter yang sesuai
              ),
            ),
            Text(
              'Mulai Membaca Sekarang!',
              style: TextStyle(
                color: Color(0xFFC7C7C7), // Contoh warna biru
                fontSize: 16.0,
                fontFamily: 'Inter', // Ganti dengan nama font Inter yang sesuai
              ),
            ),
          ],

        ),
        SizedBox(height: 20.0),
        Container(
          height: 59.0, // Tinggi tombol
          width: 273.0, // Lebar tombol
          margin: EdgeInsets.only(left: 15.0), // Margin dari kiri dan atas
          child: ElevatedButton(
            onPressed: () {
              // Navigasi ke halaman pembacaan buku di sini
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DiscoverPage(),
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
              'Mulai Membaca',
              style: TextStyle(
                color: Color(0xFFEBF2FA), // Contoh warna biru
                fontSize: 24.0,
                fontFamily: 'Inter', // Ganti dengan nama font Inter yang sesuai
              ),
            ),
          ),
        ),
        SizedBox(height: 30.0), // Jarak antara tombol "Baca Buku" dan elemen di bawahnya

      ],
    );
  }
    }

