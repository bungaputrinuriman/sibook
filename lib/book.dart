class Book {
  final String id;
  final String title;
  final String author;
  final String image;
  final String language;
  final String releaseDate;
  final int pageCount;
  final String genre;
  final String categori;
  final double rating;
  final String sinopsis;
  final List<String> bookPages;
  bool isBookmarked; // Tambahkan properti ini

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.image,
    required this.language,
    required this.releaseDate,
    required this.pageCount,
    required this.genre,
    required this.categori,
    required this.rating,
    required this.sinopsis,
    required this.bookPages,
    this.isBookmarked = false, // Setel defaultnya ke false
  });
}

List<String> categori = [
  'Novel',
  'Komik',
  'Agama',
  'Edukasi'
];
List<Book> _books = [
  Book(
    id: '1',
    title: 'Galaksi',
    genre: 'Fiksi ',
    categori: 'Novel ',
    author: 'Poppy Pertiwi',
    rating: 5.7,
    image: 'assets/galaksi.jpg',
    language: 'IND',
    releaseDate: '2023',
    pageCount: 300,
    sinopsis: 'GALAKSI by Poppi Pertiwi Bagian Pertama Galaksi : Bagian Kedua Galaksikejora [Dapat Dibaca Terpisah]❤️❤ Dear pembaca baru & pembaca lama tahap repost ini supaya kalian bisa membaca dan terbayang bagaimana isi Novel Galaksi yaa so ikuti terus perjalan mereka di sini [SUDAH TAYANG DI BIOSKOP 24 Agustus 2023] [TELAH TERBIT OLEH COCONUT BOOKS & TERSEDIA DI SELURUH GRAMEDIA INDONESIA] Galaksi Aldebaran. Panggilannya Galak. Orangnya juga galak. Ketua geng Ravispa di SMA Ganesha. Tukang damprat adik-adik kelas. Paling benci diatur-atur apalagi sama cewek yang ia suka, Kejora. Biarpun nakal dan susah diatur tapi Galaksi nggak pernah main cewek. Hidup dengan dibeda-bedakan oleh orangtuanya membuat cowok itu mempunyai sifat keras termasuk pada Kejora. Ketika Kejora sadar kalau ia juga menyukai Galaksi. Apa Galaksi masih mau menerimanya?',
    bookPages: [
      "GALAKSI by Poppi Pertiwi Bagian Pertama Galaksi : Bagian Kedua Galaksikejora [Dapat Dibaca Terpisah]❤️❤ Dear pembaca baru & pembaca lama tahap repost ini supaya kalian bisa membaca dan terbayang bagaimana isi Novel Galaksi yaa so ikuti terus perjalan mereka di sini [SUDAH TAYANG DI BIOSKOP 24 Agustus 2023] [TELAH TERBIT OLEH COCONUT BOOKS & TERSEDIA DI SELURUH GRAMEDIA INDONESIA] Galaksi Aldebaran. Panggilannya Galak. Orangnya juga galak. Ketua geng Ravispa di SMA Ganesha. Tukang damprat adik-adik kelas. Paling benci diatur-atur apalagi sama cewek yang ia suka, Kejora. Biarpun nakal dan susah diatur tapi Galaksi nggak pernah main cewek. Hidup dengan dibeda-bedakan oleh orangtuanya membuat cowok itu mempunyai sifat keras termasuk pada Kejora. Ketika Kejora sadar kalau ia juga menyukai Galaksi. Apa Galaksi masih mau menerimanya?",
      "'GALAKSI by Poppi Pertiwi Bagian Pertama Galaksi : Bagian Kedua Galaksikejora [Dapat Dibaca Terpisah]❤️❤ Dear pembaca baru & pembaca lama tahap repost ini supaya kalian bisa membaca dan terbayang bagaimana isi Novel Galaksi yaa so ikuti terus perjalan mereka di sini [SUDAH TAYANG DI BIOSKOP 24 Agustus 2023] [TELAH TERBIT OLEH COCONUT BOOKS & TERSEDIA DI SELURUH GRAMEDIA INDONESIA] Galaksi Aldebaran. Panggilannya Galak. Orangnya juga galak. Ketua geng Ravispa di SMA Ganesha. Tukang damprat adik-adik kelas. Paling benci diatur-atur apalagi sama cewek yang ia suka, Kejora. Biarpun nakal dan susah diatur tapi Galaksi nggak pernah main cewek. Hidup dengan dibeda-bedakan oleh orangtuanya membuat cowok itu mempunyai sifat keras termasuk pada Kejora. Ketika Kejora sadar kalau ia juga menyukai Galaksi. Apa Galaksi masih mau menerimanya?",
    ],
  ),
  Book(
    id: '2',
    title: 'Septihan',
    genre: 'Fiksi',
    categori: 'Komik ',
    author: 'Poppy Pertiwi',
    rating: 5.8,
    image: 'assets/asep.jpg',
    language: 'IND',
    releaseDate: '2023',
    pageCount: 170,
    sinopsis: 'Selamat membaca cerita SEPTIHAN: Septian Aidan Nugroho & Jihan Halana BAGIAN Ravispa II Spin Off Novel Galaksi | A Story Teen Fiction by PoppiPertiwi❤️❤️ [PART MASIH LENGKAP] [DAPAT DIBACA TERPISAH OLEH Galaksi & Galaksikejora] [NOVEL SEPTIHAN SUDAH TERBIT 31 JULI 2020 OLEH PENERBIT COCONUT BOOKS] Septian Aidan Nugroho. Murid laki-laki dengan bandana merah di lengan kiri seragamnya. Sangat pintar dan pendiam. Dalam hidupnya, perempuan seperti Jihan Halana tidak akan pernah dibiarkan masuk. Jihan Halana. Murid yang sangat cantik di sekolahan. Orang-orang mengenalnya perempuan yang sangat ekspresif. Mudah menggambarkan apa pun yang dia rasakan. Termasuk kepada Septian-laki-laki yang sudah sejak dulu Jihan suka walau hanya sebatas diam. Perasaan diam-diam yang muncul ketika pertama kali melihat Septian. Jihan yang ceria dan sendu selalu berusaa agar Septian menyukainya. Tahun ini Jihan kembali menyatakan perasaannya pada Septian. Hingga Septian memberinya sebuah syarat, "Belajar dulu yang bener. Kalau dapet peringkat 1. Baru bisa jadi pacar gue. Itu syaratnya." Semua orang pikir Jihan tidak akan mampu. Namun ketika melihat kesungguhan dan ketulusan Jihan membuat Septian ragu. Lantas apa mungkin sejak dulu Septian sudah menaruh hati pada Jihan sehingga Septian mengajukan syarat tersebut?',
    bookPages: [
      'Selamat membaca cerita SEPTIHAN: Septian Aidan Nugroho & Jihan Halana BAGIAN Ravispa II Spin Off Novel Galaksi | A Story Teen Fiction by PoppiPertiwi❤️❤️ [PART MASIH LENGKAP] [DAPAT DIBACA TERPISAH OLEH Galaksi & Galaksikejora] [NOVEL SEPTIHAN SUDAH TERBIT 31 JULI 2020 OLEH PENERBIT COCONUT BOOKS] Septian Aidan Nugroho. Murid laki-laki dengan bandana merah di lengan kiri seragamnya. Sangat pintar dan pendiam. Dalam hidupnya, perempuan seperti Jihan Halana tidak akan pernah dibiarkan masuk. Jihan Halana. Murid yang sangat cantik di sekolahan. Orang-orang mengenalnya perempuan yang sangat ekspresif. Mudah menggambarkan apa pun yang dia rasakan. Termasuk kepada Septian-laki-laki yang sudah sejak dulu Jihan suka walau hanya sebatas diam. Perasaan diam-diam yang muncul ketika pertama kali melihat Septian. Jihan yang ceria dan sendu selalu berusaa agar Septian menyukainya. Tahun ini Jihan kembali menyatakan perasaannya pada Septian. Hingga Septian memberinya sebuah syarat, "Belajar dulu yang bener. Kalau dapet peringkat 1. Baru bisa jadi pacar gue. Itu syaratnya." Semua orang pikir Jihan tidak akan mampu. Namun ketika melihat kesungguhan dan ketulusan Jihan membuat Septian ragu. Lantas apa mungkin sejak dulu Septian sudah menaruh hati pada Jihan sehingga Septian mengajukan syarat tersebut?',
      'Selamat membaca cerita SEPTIHAN: Septian Aidan Nugroho & Jihan Halana BAGIAN Ravispa II Spin Off Novel Galaksi | A Story Teen Fiction by PoppiPertiwi❤️❤️ [PART MASIH LENGKAP] [DAPAT DIBACA TERPISAH OLEH Galaksi & Galaksikejora] [NOVEL SEPTIHAN SUDAH TERBIT 31 JULI 2020 OLEH PENERBIT COCONUT BOOKS] Septian Aidan Nugroho. Murid laki-laki dengan bandana merah di lengan kiri seragamnya. Sangat pintar dan pendiam. Dalam hidupnya, perempuan seperti Jihan Halana tidak akan pernah dibiarkan masuk. Jihan Halana. Murid yang sangat cantik di sekolahan. Orang-orang mengenalnya perempuan yang sangat ekspresif. Mudah menggambarkan apa pun yang dia rasakan. Termasuk kepada Septian-laki-laki yang sudah sejak dulu Jihan suka walau hanya sebatas diam. Perasaan diam-diam yang muncul ketika pertama kali melihat Septian. Jihan yang ceria dan sendu selalu berusaa agar Septian menyukainya. Tahun ini Jihan kembali menyatakan perasaannya pada Septian. Hingga Septian memberinya sebuah syarat, "Belajar dulu yang bener. Kalau dapet peringkat 1. Baru bisa jadi pacar gue. Itu syaratnya." Semua orang pikir Jihan tidak akan mampu. Namun ketika melihat kesungguhan dan ketulusan Jihan membuat Septian ragu. Lantas apa mungkin sejak dulu Septian sudah menaruh hati pada Jihan sehingga Septian mengajukan syarat tersebut?',
    ],
  ),
];
// Ekspor list _book
List<Book> getBooks() {
  return _books;
}
