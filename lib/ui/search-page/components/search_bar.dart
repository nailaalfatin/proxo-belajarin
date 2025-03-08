import 'package:flutter/material.dart';

class SearchbarWidget extends StatefulWidget implements PreferredSizeWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final FocusNode focusNode;
  final VoidCallback onClear;
  final Function(String)? onSubmitted;

  const SearchbarWidget({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
    this.onSubmitted,
    required this.focusNode,
  });

  @override
  _SearchbarWidgetState createState() => _SearchbarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchbarWidgetState extends State<SearchbarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(widget.focusNode);
              },
              child: AbsorbPointer(
                child: TextField(
                  controller: widget.controller,
                  focusNode: widget.focusNode,
                  onChanged: widget.onChanged,
                  onSubmitted: widget.onSubmitted,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText: "Cari Kursus",
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), // Lebih smooth
                      borderSide: const BorderSide(color: Color(0xFFEAEAEA), width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFEAEAEA), width: 1.5),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12), // Lebih ramping
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Image.asset(
            "assets/logos/filter.png",
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}
