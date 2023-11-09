part of 'pages.dart'; 

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFECAA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60, 
              backgroundImage: AssetImage(
                  'assets/images/profil.png'), // Ganti dengan path gambar profil Anda
            ),
            SizedBox(height: 20),
            Text(
              'Muhammad Rangga Ridjali',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'UTS PEMROGRAMAN MOBILE',
              style: TextStyle(
                fontSize: 18,
                color: const Color.fromARGB(255, 2, 0, 0),
              ),
            ),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.arrow_back), // Tombol "arrow"
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return WellcomePage(); // Ganti dengan halaman yang sesuai
                  },
                ));
              },
            ),
            
            ElevatedButton(
              onPressed: () {
                // Logika atau navigasi ketika tombol "Daftar Tombol" ditekan
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return BtnPage(); // Ganti dengan halaman yang sesuai
                  },
                ));
              },
              child: Text('Gambar'), // Teks tombol
            ),

            SizedBox(
              height: 17,
            ),

            Center(child: Text('Aplikasi ini dibuat bertujuan untuk memenuhi keperluan UTS Pemrograman Mobile', textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),),



          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: ColorPalette.purpleColor,
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
        currentIndex: 0,
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
