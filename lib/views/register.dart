import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  static const String routeName = "/register";
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          padding: EdgeInsets.all(25),
          color: const Color(0x00f8f9fa),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                // height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(8, 8),
                      color: Colors.black.withValues(alpha: 0.2),
                      // blurStyle: BlurStyle.outer,
                      blurRadius: 15,
                      spreadRadius: -4,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // SECTION LOGO
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/logo.png"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        // END OF SECTION LOGO

                        // SECTION TITLE
                        Column(
                          children: [
                            Text(
                              "Buat Akun Baru",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              "Mulai langkah cerdas mengelola keuangan Anda hari ini",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Container(
                      padding: EdgeInsets.all(20),

                      child: Form(
                        key: _formKey,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SizedBox(height: 10),
                            Text("Nama Lengkap"),
                            SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                labelText: "Nama Lengkap",
                                prefixIcon: Icon(Icons.person),
                                // hintText: "Masukkan Email",
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                fillColor: Color(0x0ff8f9fa),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Username tidak boleh kosong";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16),

                            Text("Email"),
                            SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                labelText: "Email",
                                prefixIcon: Icon(Icons.email_outlined),
                                // hintText: "Masukkan Email",
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                fillColor: Color(0x0ff8f9fa),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Email tidak boleh kosong";
                                } else if (!value.contains('@')) {
                                  return "Format email tidak valid";
                                }
                                return null;
                              },
                            ),

                            SizedBox(height: 16),
                            Text("Password"),
                            SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                labelText: "Password",
                                hintText: "Masukkan Password",
                                prefixIcon: Icon(Icons.lock_outline),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                fillColor: Color(0x0ff8f9fa),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Password tidak boleh kosong";
                                } else if (value.length < 6) {
                                  return "Password terlalu singkat";
                                }
                                return null;
                              },
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: _isChecked,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      _isChecked = newValue ?? false;
                                    });
                                  },
                                ),
                                Text(
                                  _isChecked
                                      ? 'Saya Setuju'
                                      : "Saya Tidak Setuju",
                                ),
                              ],
                            ),

                            SizedBox(height: 24),

                            SizedBox(
                              width: double.infinity,
                              height: 42,

                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff041627),
                                  foregroundColor: Colors.white,
                                ),
                                icon: Icon(Icons.login),

                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Berhasil"),
                                          content: Text(
                                            "Anda Berhasil Register",
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                  context,
                                                  '/login',
                                                );
                                              },
                                              child: Text("Lanjut"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                                label: Text(
                                  "Masuk",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),

                            SizedBox(height: 24),

                            Center(
                              child: Text.rich(
                                TextSpan(
                                  text: "Sudah Punya Akun?",
                                  style: TextStyle(color: Color(0xff44474C)),

                                  children: [
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => Navigator.pushNamed(
                                          context,
                                          '/login',
                                        ),
                                      text: "Masuk",
                                      style: TextStyle(
                                        color: Color(0xff041627),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
