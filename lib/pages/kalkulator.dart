part of 'pages.dart';

class Calc extends StatefulWidget {
  @override
  Calculator createState() => Calculator();
}

class Calculator extends State<Calc> {
  double? _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    var calc = SimpleCalculator(
      value: _currentValue!,
      hideExpression: false,
      hideSurroundingBorder: true,
      autofocus: true,
      onChanged: (key, value, expression) {
        setState(() {
          _currentValue = value ?? 0;
        });
        if (kDebugMode) {
          print('$key\t$value\t$expression');
        }
      },
      onTappedDisplay: (value, details) {
        if (kDebugMode) {
          print('$value\t${details.globalPosition}');
        }
      },
      theme: const CalculatorThemeData(
        borderColor: Colors.black,
        borderWidth: 2,
        displayColor: Colors.black,
        displayStyle: TextStyle(fontSize: 80, color: Colors.yellow),
        expressionColor: Colors.indigo,
        expressionStyle: TextStyle(fontSize: 20, color: Colors.white),
        operatorColor: Colors.pink,
        operatorStyle: TextStyle(fontSize: 30, color: Colors.white),
        commandColor: Colors.orange,
        commandStyle: TextStyle(fontSize: 30, color: Colors.white),
        numColor: Colors.grey,
        numStyle: TextStyle(fontSize: 50, color: Colors.white),
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xFFFFECAA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: calc,
                    );
                  },
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    ColorPalette
                    .purpleColor), // Ganti dengan warna yang Anda inginkan
              ),
              child: Text(
                'Menuju kalkulator',
                style: TextStyle(color: Colors.white,
                  fontSize: 16,
                ),
              ), 
            ),
            SizedBox(
                height:
                    16), // Jarak antara tombol "Menuju kalkulator" dan tombol baru
            ElevatedButton(
              // Ini adalah tombol baru
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return BMICalculator();
                  },
                ));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    ColorPalette
                    .purpleColor), // Ganti dengan warna yang Anda inginkan
              ),
              child: Text(
                'Menuju BMI',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),

            SizedBox(height: 16),

            ElevatedButton(
              // Ini adalah tombol baru
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return CurrencyConverterPage();
                  },
                ));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    ColorPalette
                    .purpleColor), // Ganti dengan warna yang Anda inginkan
              ),
              child: Text(
                'Menuju Konversi',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFEF5858),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Branda',
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
        currentIndex: 1, // Indeks "Kalkulator" dipilih
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
