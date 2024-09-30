import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant/app_colors.dart';
import '../constant/app_sized.dart';
import '../constant/show_snak_bar.dart';
import '../shared/shared_ref_keys.dart';
import '../widgets/custom_app_text.dart';
import '../widgets/custom_container_list_view_body.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List favorite = [];

//! Function to remove favorite item from favorite list And Update Shared Preferences
  void _removeFavoriteById(int itemId) async {
    setState(() {
      favorite.removeWhere((item) => item['id'] == itemId);
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String updatedFavoriteList = jsonEncode(favorite);
    await prefs.setString(SharedPrefKeys.favoriteList, updatedFavoriteList);
  }

//! Function to load favorite list From Shared Preferences
  Future<void> _loadFavoriteList() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteListString = prefs.getString(SharedPrefKeys.favoriteList);
    if (favoriteListString != null) {
      setState(() {
        favorite = jsonDecode(favoriteListString)
            .map((e) => Map<String, dynamic>.from(e))
            .toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadFavoriteList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favorite.isEmpty
          ? const Center(
              child: CustomAppText(
                text: "No Favorite Questions",
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppText(
                    text: "Favorite Questions",
                  ),
                  height(32),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CustomContainerListViewBody(
                          text: favorite[index]['question'].toString(),
                          icon: IconButton(
                            icon: const Icon(
                              Icons.star,
                              color: AppColors.amber,
                            ),
                            onPressed: () {
                              setState(() {
                                int itemId = favorite[index]['id'];
                                _removeFavoriteById(itemId);
                              });
                              showSnackBar(
                                  text: "Question Removed From Favorite",
                                  context);
                            },
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => height(8),
                      itemCount: favorite.length,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
