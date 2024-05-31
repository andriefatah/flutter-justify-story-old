// ignore_for_file: non_constant_identifier_names, unnecessary_to_list_in_spreads, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_reservasi_foto_justify_story_app/presentation/home/bloc/category/category_bloc.dart';
// import 'package:flutter_reservasi_foto_justify_story_app/presentation/home/bloc/package/package_bloc.dart';
// Import statements for models and other dependencies

class ListCategory extends StatelessWidget {
  final String selectedCategory;
  final Function(String category) onCategorySelected;

  const ListCategory({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        // print('Saat ini Category berada di state: $state');
        return state.when(
          initial: () => Container(), // Tampilkan sesuatu untuk state awal
          loadInProgress: () =>
              const CircularProgressIndicator(), // Tampilkan loader
          loadSuccess: (categories) => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                // Tambahkan 'All Category' di awal
                CategoryButton(
                  category: 'Semua Paket',
                  isSelected: selectedCategory == 'Semua Paket',
                  onTap: () => onCategorySelected('Semua Paket'),
                ),
                // Kemudian tampilkan list category dari API
                ...categories
                    .map((category) => CategoryButton(
                          category: category.nama ??
                              'Unknown', // Gunakan nilai default jika null
                          isSelected: selectedCategory == category.nama,
                          onTap: () => onCategorySelected(category.nama ??
                              'Unknown'), // Gunakan nilai default jika null
                        ))
                    .toList(),
              ],
            ),
          ), // Tampilkan kategori
          loadFailure: (errorMessage) =>
              Text('Error: $errorMessage'), // Tampilkan error
        );
      },
    );
  }

  Widget CategoryButton({
    required String category,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        category,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontFamily: 'Montserrat',
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 12,
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: isSelected ? Colors.black : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      ),
    );
  }
}
