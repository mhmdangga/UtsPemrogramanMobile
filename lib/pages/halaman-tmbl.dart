part of 'pages.dart';

class BtnPage extends StatefulWidget {
  const BtnPage({Key? key}) : super(key: key);

  @override
  _ButtonPage createState() => _ButtonPage();
}

class _ButtonPage extends State<BtnPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tampilan Gambar 2x2'),
          backgroundColor: ColorPalette.purpleColor,
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app), // Ikon "Keluar"
              onPressed: () {
                Navigator.of(context).pop(); 
                // Logika yang akan dijalankan ketika tombol "Keluar" ditekan
                // Misalnya, tampilkan dialog konfirmasi atau lakukan tindakan keluar.
              },
            ),
          ],
        ),
        backgroundColor: ColorPalette.purpleColor,
        body: GridView.count(
          crossAxisCount: 2, // Menyusun item dalam 2 kolom
          children: [
            CardWithImage('Gambar 1', 'assets/images/profil.png'),
            CardWithImage('Gambar 2', 'assets/images/profil.png'),
            CardWithImage('Gambar 3', 'assets/images/profil.png'),
            CardWithImage('Gambar 4', 'assets/images/profil.png'),
            CardWithImage('Gambar 5', 'assets/images/profil.png'),
            CardWithImage('Gambar 6', 'assets/images/profil.png'),
            CardWithImage('Gambar 7', 'assets/images/profil.png'),
            CardWithImage('Gambar 8', 'assets/images/profil.png'),
            CardWithImage('Gambar 9', 'assets/images/profil.png'),
            CardWithImage('Gambar 10', 'assets/images/profil.png'),
          ],
        ),
      ),
    );
  }
}

class CardWithImage extends StatelessWidget {
  final String title;
  final String imagePath;

  CardWithImage(this.title, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 150, // Lebar gambar
            height: 150, // Tinggi gambar
            fit: BoxFit.cover, // Mengatur cara gambar ditampilkan
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
