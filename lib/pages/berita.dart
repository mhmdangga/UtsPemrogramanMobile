part of 'pages.dart';

class BeritaPage extends StatefulWidget {
  @override
  _BeritaPageState createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage> {
  // int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFECAA),
      body: ListView(
        children: <Widget>[
          BeritaItem(
            judul: 'Judul Berita',
            isi: 'Isi berita...',
          ),
          BeritaItem(
            judul: 'Judul Berita',
            isi: 'Isi berita...',
          ),
          BeritaItem(
            judul: 'Judul Berita',
            isi: 'Isi berita...',
          ),
          BeritaItem(
            judul: 'Judul Berita',
            isi: 'Isi berita...',
          ),
          BeritaItem(
            judul: 'Judul Berita',
            isi: 'Isi berita...',
          ),
          BeritaItem(
            judul: 'Judul Berita',
            isi: 'Isi berita...',
          ),
          BeritaItem(
            judul: 'Judul Berita',
            isi: 'Isi berita...',
          ),
          BeritaItem(
            judul: 'Judul Berita',
            isi: 'Isi berita...',
          ),
          BeritaItem(
            judul: 'Judul Berita',
            isi: 'Isi berita...',
          ),
          BeritaItem(
            judul: 'Judul Berita',
            isi: 'Isi berita...',
          ),
          BeritaItem(
            judul: 'Judul Berita',
            isi: 'Isi berita...',
          ),
          BeritaItem(
            judul: 'Judul Berita',
            isi: 'Isi berita...',
          ),
          BeritaItem(
            judul: 'Judul Berita',
            isi: 'Isi berita...',
          ),
          BeritaItem(
            judul: 'Judul Berita',
            isi: 'Isi berita...',
          ),
          BeritaItem(
            judul: 'Judul Berita',
            isi: 'Isi berita...',
          ),
          BeritaItem(
            judul: 'Judul Berita',
            isi: 'Isi berita...',
          ),
          BeritaItem(
            judul: 'Judul Berita',
            isi: 'Isi berita...',
          ),
          BeritaItem(
            judul: 'Judul Berita',
            isi: 'Isi berita...',
          ),
          BeritaItem(
            judul: 'Judul Berita',
            isi: 'Isi berita...',
          ),
          BeritaItem(
            judul: 'Judul Berita',
            isi: 'Isi berita...',
          ),
          BeritaItem(
            judul: 'Judul Berita',
            isi: 'Isi berita...',
          ),
          // Tambahkan lebih banyak item berita jika diperlukan
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFEF5858),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Kalkulator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Scroll',
          ),
        ],
        currentIndex: 2,
        onTap: (int index) {
          if (index == 0) {
            // Mengarahkan ke halaman "Beranda" saat tombol "Beranda" ditekan
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProfilePage())); // Gantilah 'HalamanBeranda' dengan nama halaman beranda yang sesuai
          } else if (index == 1) {
            // Mengarahkan ke halaman "Kalkulator" saat tombol "Kalkulator" ditekan
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Calc())); // Gantilah 'Calc' dengan nama halaman kalkulator yang sesuai
          } else if (index == 2) {
            // Mengarahkan ke halaman "Pengaturan" saat tombol "Pengaturan" ditekan
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        BeritaPage())); // Gantilah 'BeritaPage' dengan nama halaman pengaturan yang sesuai
          } else {
            // Tindakan lainnya sesuai dengan indeks tombol yang ditekan
          }
        },
      ),
    );
  }
}

class BeritaItem extends StatelessWidget {
  final String judul;
  final String isi;

  BeritaItem({required this.judul, required this.isi});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              judul,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              isi,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
