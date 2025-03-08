import 'package:belajarin_app/ui/search-page/components/search_result.dart';
import 'package:flutter/material.dart';
import 'package:belajarin_app/consts.dart';
import 'package:belajarin_app/ui/search-page/components/categorychip.dart';
import 'package:belajarin_app/ui/search-page/components/list_mentor_history.dart';
import 'package:belajarin_app/ui/search-page/components/best_mentor.dart';
import 'package:belajarin_app/ui/search-page/components/popular_class.dart';
import 'package:belajarin_app/ui/search-page/components/search_bar.dart';
import 'package:belajarin_app/models/classes.dart'; // Pastikan file ini berisi definisi AllClass dan allClasses

class SearchPageScreen extends StatefulWidget {
  const SearchPageScreen({super.key});

  @override
  State<SearchPageScreen> createState() => _SearchPageScreenState();
}

class _SearchPageScreenState extends State<SearchPageScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool isSearching = false;
  bool showSearchResults = false;
  String searchQuery = "";
  
  // Jika ingin mulai dari history pencarian user saja, bisa inisialisasi dengan [].
  List<String> searchHistory = [];
  
  List<AllClass> searchResults = [];

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isSearching = _focusNode.hasFocus;
        // Jika focus aktif, tampilkan history; jika tidak, tampilkan hasil pencarian.
        if (_focusNode.hasFocus) showSearchResults = false;
      });
    });
    _searchController.addListener(() {
      setState(() {
        isSearching = _searchController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSearchSubmitted(String value) {
    print("Search submitted: $value");
    if (value.isNotEmpty) {
      setState(() {
        searchQuery = value;
        // Simpan query ke searchHistory jika belum ada (tanpa duplikasi)
        if (!searchHistory.contains(value)) {
          // Menambahkan di awal list agar history terbaru muncul paling atas
          searchHistory.insert(0, value);
        }
        // Filter data AllClass berdasarkan keyword (case-insensitive)
        searchResults = allClasses
            .where((cls) =>
                cls.title.toLowerCase().contains(value.toLowerCase()))
            .toList();
        print("Found ${searchResults.length} results.");
        showSearchResults = true;
        _focusNode.unfocus();
      });
    }
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      isSearching = false;
      showSearchResults = false;
    });
  }

  void _selectSearchItem(String item) {
    _searchController.text = item;
    _focusNode.unfocus();
    setState(() {
      searchQuery = item;
      // Filter data dari allClasses berdasarkan item
      searchResults = allClasses
          .where((cls) =>
              cls.title.toLowerCase().contains(item.toLowerCase()))
          .toList();
      showSearchResults = true;
    });
  }

  void _removeSearchHistoryItem(String item) {
    setState(() {
      searchHistory.remove(item);
    });
  }

  Widget _buildSearchHistory() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header History
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Terbaru",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      searchHistory.clear();
                    });
                  },
                  child: Text(
                    "Hapus Semua",
                    style: TextStyle(fontSize: 14, color: primaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: searchHistory.map((item) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(item),
                  onTap: () => _selectSearchItem(item),
                  trailing: IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey),
                    onPressed: () => _removeSearchHistoryItem(item),
                  ),
                );
              }).toList(),
            ),
            // Tetap menampilkan ListMentor sesuai style UI kamu
            ListMentor(),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kategori",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryChip(
                          title: "Seni",
                          image: "assets/images/seni.png"),
                      CategoryChip(
                          title: "Kimia",
                          image: "assets/images/kimia.png"),
                      CategoryChip(
                          title: "Programming",
                          image: "assets/images/programming.png"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Kelas Populer",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  PopularClass(),
                  SizedBox(height: 20),
                  BestMentor(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: SearchbarWidget(
          controller: _searchController,
          focusNode: _focusNode,
          onChanged: (value) {
            setState(() {
              isSearching = value.isNotEmpty;
            });
          },
          onClear: _clearSearch,
          onSubmitted: _onSearchSubmitted,
        ),
      ),
      body: showSearchResults
          ? SearchResult(
              searchQuery: searchQuery, results: searchResults)
          : (isSearching ? _buildSearchHistory() : _buildMainContent()),
    );
  }
}
