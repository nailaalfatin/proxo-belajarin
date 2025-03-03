import 'package:belajarin_app/consts.dart';
import 'package:belajarin_app/ui/auth/forgot%20password/forgot_screen.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    if (!value.contains('@gmail.com')) {
      return 'Harus menggunakan @gmail.com';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (value.length < 8) {
      return 'Password harus minimal 8 karakter';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Email Anda',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 6),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Masukkan email Anda',
              hintStyle: const TextStyle(
                fontSize: 14,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            ),
            validator: _validateEmail,
          ),
          const SizedBox(height: 20),

          const Text(
            'Kata Sandi Anda',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          const SizedBox(height: 6),
          TextFormField(
            controller: passwordController,
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              hintText: 'Masukkan kata sandi Anda',
              hintStyle: const TextStyle(
                fontSize: 14,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            validator: _validatePassword,
          ),
          const SizedBox(height: 2),

          // Lupa Password
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScreenForgot()),
                  );
                }
              },
              child: const Text('Lupa kata sandi?'),
            ),
          ),

          const SizedBox(height: 15),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
            child: const Text(
              "Lanjutkan",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 24),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    indent: 20,
                    color: Colors.black54,
                    thickness: 1,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'atau',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Divider(
                    endIndent: 20,
                    color: Colors.black54,
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              side: const BorderSide(color: Colors.grey, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.apple, size: 30),
                SizedBox(width: 8),
                Text(
                  "Masuk dengan Apple",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              side: const BorderSide(color: Colors.grey, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Icon-google.png',
                  height: 24,
                ),
                const SizedBox(width: 8),
                const Text(
                  "Masuk dengan Google",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Belum punya akun? ',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                InkWell(
                  onTap: () {
                    const Text('Navigasi ke halaman Daftar');
                  },
                  child: Text(
                    'Daftar',
                    style: TextStyle(
                      fontSize: 16,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
