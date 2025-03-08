import 'package:belajarin_app/consts.dart';
import 'package:belajarin_app/ui/search%20page/components/Search_result.dart';
import 'package:belajarin_app/ui/search%20page/components/categorychip.dart';
import 'package:belajarin_app/ui/search%20page/components/list_mentor_history.dart';
import 'package:belajarin_app/ui/search%20page/components/serach_bar.dart';
import 'package:flutter/material.dart';
import 'components/best_mentor.dart';
import 'components/popular_class.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key,});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool isSearching = false;
  bool showSearchResults = false;
  String searchQuery = ""; 

  List<String> searchHistory = [
    "Sistem Reproduksi",
    "Bilangan Kompleks",
    "Trigonometri Analitika",
    "Sistem Sirkulasi",
    "Termodinamika",
    "Stoikiometri",
    "Fluida: Statis",
    "Ikatan Kimia"
  ];

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isSearching = _focusNode.hasFocus;
        showSearchResults = false;
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

  void _updateSearch(String value) {
    setState(() {
      isSearching = value.isNotEmpty;
    });
  }

  void _selectSearchItem(String item) {
    _searchController.text = item;
    _focusNode.unfocus();
    setState(() {
      searchQuery = item; 
      isSearching = false;
      showSearchResults = true;
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      isSearching = false;
      showSearchResults = false;
    });
  }

  void _removeSearchHistoryItem(String item) {
    setState(() {
      searchHistory.remove(item);
    });
  }

  void _onSearchSubmitted(String value) {
    if (value.isNotEmpty) {
      setState(() {
        searchQuery = value; 
        showSearchResults = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: SearchBarWidget(
          controller: _searchController,
          focusNode: _focusNode,
          onChanged: _updateSearch,
          onClear: _clearSearch,
          onSubmitted: _onSearchSubmitted,
        ),
      ),
      body: showSearchResults
          ? SearchResultScreen(searchQuery: searchQuery, resultCount: 0)
          : (isSearching ? _buildSearchHistory() : _buildMainContent()),
    );
  }

  Widget _buildSearchHistory() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Terbaru",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kategori",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryChip(title: "Seni", image: "assets/images/seni.png"),
                      CategoryChip(title: "Kimia", image: "assets/images/kimia.png"),
                      CategoryChip(title: "Programming", image: "assets/images/programming.png"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Kelas Populer",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
}
