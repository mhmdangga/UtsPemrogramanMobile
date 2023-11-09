part of 'pages.dart';

class WellcomePage extends StatefulWidget {
  const WellcomePage({Key? key}) : super(key: key);

  @override
  _WellcomePageState createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  bool _isHidden = true;
  bool _isHiddenCourse = true;
  bool _isHiddenPassword = true;
  bool _isHiddenConfirmPassword = true;
  bool _isChecked = false;

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            Image.asset(
              'assets/images/login-image.png',
              height: 333,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Welcome',
              style: dengerTextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit, \nsed do eiusmod',
              style: whiteTextStyle.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 51,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 2 * defaultMargin,
              child: ElevatedButton(
                onPressed: () {
                  // tampilan register
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Wrap(
                            children: [
                              // bagian model
                              Container(
                                color: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          topLeft: Radius.circular(40))),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: defaultMargin),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 25,
                                        ),
                                        // FORM REGISTRASI
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Hello...',
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontSize: 20,
                                                          color: blackColor),
                                                ),
                                                Text(
                                                  'Register',
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 30,
                                                          color: blackColor),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Center(
                                              child: InkWell(
                                                onTap: () {
                                                  // ketika icon di tekan
                                                  Navigator.pop(context);
                                                },
                                                child: Image.asset(
                                                  "assets/images/close.png",
                                                  height: 30,
                                                  width: 30,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        // Form Registrasi Input
                                        Form(
                                          key: _formKey,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextFormField(
                                          obscureText: _isHidden,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              hintText: "info@example.com",
                                              labelText: "email",
                                              suffixIcon: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _isHidden = !_isHidden;
                                                  });
                                                },
                                                child: Icon(_isHidden
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined),
                                              )),
                                          validator: (value) {
                                            bool emailValid = RegExp(
                                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                                            ).hasMatch(value!);

                                            if (value.isEmpty) {
                                              return 'Email tidak boleh kosong'; // Pesan kesalahan jika email kosong
                                            }

                                            if (!emailValid) {
                                              return 'Email tidak valid'; // Pesan kesalahan jika email tidak sesuai dengan pola yang Anda tentukan
                                            }

                                            return null; // Validasi sukses
                                          },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        // COURSE INPUT
                                        TextFormField(
                                          obscureText: _isHiddenCourse,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              hintText: "course",
                                              labelText: "course",
                                              suffixIcon: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      _isHiddenCourse =
                                                          !_isHiddenCourse;
                                                    });
                                                  },
                                                  child: Icon(_isHiddenCourse
                                                      ? Icons
                                                          .visibility_outlined
                                                      : Icons
                                                          .visibility_off_outlined))),
                                                          validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Course tidak boleh kosong'; // Pesan kesalahan jika password kosong
                                                    } else if (value.length <
                                                        6) {
                                                      return 'Course terlalu pendek'; // Pesan kesalahan jika password terlalu pendek
                                                    }
                                                    return null; // Validasi sukses // Validasi sukses
                                                  },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        // PASSWORD INPUT
                                        TextFormField(
                                                  obscureText:
                                                      _isHiddenPassword,
                                                  controller:
                                                      passwordController,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    hintText: "Password",
                                                    labelText: "Password",
                                                    suffixIcon: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _isHiddenPassword =
                                                              !_isHiddenPassword;
                                                        });
                                                      },
                                                      child: Icon(_isHiddenPassword
                                                          ? Icons.lock_outline
                                                          : Icons
                                                              .lock_open_outlined),
                                                    ),
                                                  ),
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Password tidak boleh kosong';
                                                    } else if (value.length <
                                                        6) {
                                                      return 'Password terlalu pendek';
                                                    }
                                                    return null; // Validasi sukses
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                TextFormField(
                                                  obscureText:
                                                      _isHiddenConfirmPassword,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    hintText:
                                                        "Konfirmasi Password",
                                                    labelText:
                                                        "Konfirmasi Password",
                                                    suffixIcon: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _isHiddenConfirmPassword =
                                                              !_isHiddenConfirmPassword;
                                                        });
                                                      },
                                                      child: Icon(
                                                          _isHiddenConfirmPassword
                                                              ? Icons
                                                                  .lock_outline
                                                              : Icons
                                                                  .lock_open_outlined),
                                                    ),
                                                  ),
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Konfirmasi Password tidak boleh kosong';
                                                    } else if (value !=
                                                        passwordController
                                                            .text) {
                                                      return 'Konfirmasi Password berbeda dengan Password';
                                                    }
                                                    return null; // Validasi sukses
                                                  },
                                                )
                                            ],
                                          )),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          height: 60,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              2 * defaultMargin,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                // Kedua validasi telah terpenuhi
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder: (context) {
                                                    return WellcomePage();
                                                  },
                                                ));
                                              }
                                            },
                                            child: Text(
                                              'Register',
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                  color: secondaryColor),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                primary: primaryColor,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15))),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Alredy have account? ",
                                              style: whiteTextStyle.copyWith(
                                                  color: primaryColor,
                                                  fontSize: 18),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder: (context) {
                                                    return WellcomePage();
                                                  },
                                                ));
                                              },
                                              // rgistrasi
                                              child: Text(
                                                "Login",
                                                style: whiteTextStyle.copyWith(
                                                    color: dengerColor,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: defaultMargin,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                      });
                },
                child: Text(
                  'Create Account',
                  style: whiteTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: primaryColor),
                ),
                style: ElevatedButton.styleFrom(
                    primary: secondaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 2 * defaultMargin,
              child: ElevatedButton(
                onPressed: () {
                  // tampilan register
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return Wrap(
                            children: [
                              // bagian model
                              Container(
                                color: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          topLeft: Radius.circular(40))),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: defaultMargin),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 25,
                                        ),
                                        // FORM LOGIN
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Welcome Back!!!',
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontSize: 20,
                                                          color: blackColor),
                                                ),
                                                // text login
                                                Text(
                                                  'Login',
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 30,
                                                          color: blackColor),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            Center(
                                              child: InkWell(
                                                onTap: () {
                                                  // ketika icon di tekan
                                                  Navigator.pop(context);
                                                },
                                                child: Image.asset(
                                                  "assets/images/close.png",
                                                  height: 30,
                                                  width: 30,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        // Form Login Input
                                        Form(
                                          key: _formKey,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                          TextFormField(
                                          obscureText: !_isHidden,
                                          controller: emailController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              hintText: "info@example.com",
                                              labelText: "email",
                                              suffixIcon: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _isHidden = !_isHidden;
                                                  });
                                                },
                                                child: Icon(_isHidden
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined),
                                              )),
                                          validator: (value) {
                                            bool emailValid = RegExp(
                                              r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                                            ).hasMatch(value!);

                                            if (value.isEmpty) {
                                              return 'Email tidak boleh kosong'; // Pesan kesalahan jika email kosong
                                            }

                                            if (!emailValid) {
                                              return 'Email tidak valid'; // Pesan kesalahan jika email tidak sesuai dengan pola yang Anda tentukan
                                            }

                                            return null; // Validasi sukses
                                          },
                                        ),

                                        SizedBox(
                                          height: 20,
                                        ),
                                        // PASSWORD INPUT
                                        TextFormField(
                                          obscureText: _isHiddenPassword,
                                          controller: passController,
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              hintText: "password",
                                              labelText: "password",
                                              suffixIcon: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _isHiddenPassword =
                                                        !_isHiddenPassword;
                                                  });
                                                },
                                                child: Icon(_isHiddenPassword
                                                    ? Icons.lock_outline
                                                    : Icons.lock_open_outlined),
                                              )),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Password tidak boleh kosong'; // Pesan kesalahan jika password kosong
                                            } else if (value.length < 6) {
                                              return 'Password terlalu pendek'; // Pesan kesalahan jika password terlalu pendek
                                            }
                                            return null; // Validasi sukses // Validasi sukses
                                          },
                                        ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),

                                        Row(
                                          children: [
                                            Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffD7D7D7),
                                                  border: Border.all(
                                                      color: primaryColor,
                                                      width: 3),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Checkbox(
                                                value: _isChecked,
                                                checkColor: Color(0xffD7D7D7),
                                                onChanged: (value) {
                                                  setState(() {
                                                    this._isChecked = value!;
                                                  });
                                                },
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                            Text('Remember Me',
                                                style: whiteTextStyle.copyWith(
                                                    color: primaryColor,
                                                    fontSize: 12)),
                                            Spacer(),
                                            TextButton(onPressed: () {
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder: (context) {
                                                    return ForgetPasswordPage();
                                                  },
                                                ));
                                              },
                                               child: Text('Forgot Password?',
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          color: primaryColor,
                                                          fontSize: 12)),
                                            )
                                          ],
                                        ),

                                        SizedBox(
                                          height: 20,
                                        ),

                                        Container(
                                          height: 60,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              2 * defaultMargin,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                // Kedua validasi telah terpenuhi
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder: (context) {
                                                    return ProfilePage();
                                                  },
                                                ));
                                              }
                                            },
                                            child: Text(
                                              'Login',
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                  color: secondaryColor),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                primary: primaryColor,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15))),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Don’t have an account? ",
                                              style: whiteTextStyle.copyWith(
                                                  color: primaryColor,
                                                  fontSize: 18),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder: (context) {
                                                    return WellcomePage();
                                                  },
                                                ));
                                              },
                                              child: Text(
                                                "Register",
                                                style: whiteTextStyle.copyWith(
                                                    color: dengerColor,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: defaultMargin,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                      });
                },
                child: Text(
                  'Login',
                  style: whiteTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: secondaryColor),
                ),
                style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: secondaryColor, width: 3),
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            SizedBox(
              height: 36,
            ),
            Text(
              'All Right Reserved @2023',
              textAlign: TextAlign.center,
              style:
                  whiteTextStyle.copyWith(color: secondaryColor, fontSize: 11),
            ),
            SizedBox(
              height: defaultMargin,
            ),
          ],
        ),
      ),
    );
  }
}
