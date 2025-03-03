import 'package:belajarin_app/consts.dart';
import 'package:belajarin_app/ui/home/home_screen.dart';
import 'package:belajarin_app/ui/auth/success/succes_screen.dart';
import 'package:flutter/material.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  String? _passwordError;
  String? _confirmPasswordError;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  void _validateForm() {
    setState(() {
      _passwordError = _passwordController.text.isEmpty ? "Kata sandi tidak boleh kosong" : null;
      _confirmPasswordError = _confirmPasswordController.text.isEmpty
          ? "Konfirmasi kata sandi tidak boleh kosong"
          : _passwordController.text != _confirmPasswordController.text
              ? "Kata sandi tidak cocok"
              : null;
    });
  }

  void _handleSubmit() {
    _validateForm();
    if (_passwordError == null && _confirmPasswordError == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SuccesScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Mengatur kata sandi baru",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const Text(
                "Buat kata sandi baru. Pastikan kata sandi tersebut berbeda dari sebelumnya untuk keamanan.",
                style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 30),
              const Text("Kata sandi", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black)),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: "Masukkan kata sandi Anda",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  suffixIcon: IconButton(
                    icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                    onPressed: _togglePasswordVisibility,
                  ),
                  errorText: _passwordError,
                ),
                onChanged: (value) {
                  if (_passwordError != null) {
                    _validateForm();
                  }
                },
              ),
              const SizedBox(height: 10),
              const Text("Konfirmasi Kata Sandi", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black)),
              const SizedBox(height: 10),
              TextField(
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                decoration: InputDecoration(
                  hintText: "Masukkan kembali kata sandi Anda",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  suffixIcon: IconButton(
                    icon: Icon(_isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
                    onPressed: _toggleConfirmPasswordVisibility,
                  ),
                  errorText: _confirmPasswordError,
                ),
                onChanged: (value) {
                  if (_confirmPasswordError != null) {
                    _validateForm();
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: _handleSubmit,
                child: const Text("Perbarui kata sandi", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
