import 'package:flutter/material.dart';
import 'package:flutter_interview_quetion/Database/get_data.dart';
import 'package:flutter_interview_quetion/constant/app_sized.dart';
import 'package:flutter_interview_quetion/shared/shared_pref_manager.dart';
import '../constant/app_colors.dart';
import '../constant/show_snak_bar.dart';
import '../widgets/custom_app_text.dart';
import '../widgets/custom_container_list_view_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GetData getData = GetData();
  List qouestions = [];
  List favorite = [];

//! Function To get the Questions
  Future<List<Map>> getQuestions() async {
    List<Map> response = await getData.getQuestions("SELECT * FROM questions");
    qouestions.addAll(response);
    setState(() {});
    return response;
  }

//! Function To Toggle Favorite And Save Favorite List
  void _toggleFavorite(int index) async {
    setState(() {
      if (favorite.contains(qouestions[index])) {
        favorite.remove(qouestions[index]);
        showSnackBar(text: "Question Removed From Favorite", context);
      } else {
        favorite.add(qouestions[index]);

        showSnackBar(context, text: "Question Added to Favorite");
      }
    });
    await SharedPrefManager().setList(favorite);
  }

  @override
  initState() {
    super.initState();
    getQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppText(
              text: "Flutter Interview Questions",
            ),
            height(32),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CustomContainerListViewBody(
                    text: qouestions[index]['question'].toString(),
                    icon: IconButton(
                      icon: Icon(
                        favorite.contains(qouestions[index])
                            ? Icons.star
                            : Icons.star_outline,
                        color: AppColors.amber,
                      ),
                      onPressed: () async {
                        _toggleFavorite(index);
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) => height(8),
                itemCount: qouestions.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
