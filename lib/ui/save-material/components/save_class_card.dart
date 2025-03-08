import 'package:belajarin_app/models/classes.dart';
import 'package:belajarin_app/ui/save-material/components/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:belajarin_app/providers/save_provider.dart';
import 'package:belajarin_app/consts.dart';

class SaveClassCard extends StatelessWidget {
  final AllClass item;

  const SaveClassCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            // Gambar
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  item.imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Informasi kelas
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.subject,
                      style: TextStyle(
                        fontSize: 12,
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          item.rating.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Tombol bookmark dengan pop up bottom sheet jika sudah disimpan
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Builder(
                builder: (context) {
                  final saveProvider = Provider.of<SaveProvider>(context);
                  bool isSaved = saveProvider.isSaved(item);
                  return IconButton(
                    icon: Icon(
                      isSaved ? Icons.bookmark : Icons.bookmark_border,
                      color: primaryColor,
                    ),
                    onPressed: () {
                      if (isSaved) {
                        // Jika sudah disimpan, tampilkan konfirmasi hapus bookmark
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (context) => BottomSheetWidget(
                            item: item,
                            onRemove: () {
                              Provider.of<SaveProvider>(context, listen: false)
                                  .toggleSaved(item);
                            },
                          ),
                        );
                      } else {
                        // Jika belum, langsung simpan
                        Provider.of<SaveProvider>(context, listen: false)
                            .toggleSaved(item);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
