part of 'pages.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Gambar logo di tengah halaman
            Image.asset(
              'assets/tes/login-image.png',
              height: 333,
              fit: BoxFit.fill,
            ), // Ganti 'logo.png' dengan nama file gambar Anda di folder 'assets'
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Di sini Anda dapat menambahkan logika untuk mengirim permintaan reset kata sandi
                Navigator.pop(context);
                // TODO: Kirim permintaan reset kata sandi
              },
              child: Text('Kirim Permintaan Reset Kata Sandi'),
            ),
          ],
        ),
      ),
    );
  }
}
