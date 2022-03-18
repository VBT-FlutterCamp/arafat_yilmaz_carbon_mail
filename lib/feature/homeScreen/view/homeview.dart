import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mail_ui/core/constants/app_strings.dart';
import 'package:mail_ui/core/constants/app_style.dart';
import 'package:mail_ui/feature/homeScreen/model/todomodel.dart';
import 'package:mail_ui/services/document.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Todo?>? doc = [];
  bool yukleniyor = true;
  String? docLenght;
  Future<List<Todo?>?> getDoc() async {
    List<Todo?>? document = await NetworkManager().getTodoList();
    setState(() {
      doc = document;
      docLenght = doc?.length.toString();
      yukleniyor = false;
    });
    return document;
  }

  @override
  void initState() {
    super.initState();
    getDoc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primaryColor,
      body: yukleniyor
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: context.dynamicHeight(0.06),
                  ),
                  Row(
                    children: [
                      Text(
                        AppText().homeText1,
                        style: AppStyle()
                            .simpleStyle(40, Colors.white, FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.dynamicHeight(0.03),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppText().homeText2 + "($docLenght)",
                        style: AppStyle()
                            .simpleStyle(16, Colors.white, FontWeight.bold),
                      ),
                      Card(
                        color: Colors.transparent,
                        child: Text(AppText().homeText3,
                            style: AppStyle().simpleStyle(
                                16, Colors.white, FontWeight.bold)),
                      ),
                    ],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      //padding: const EdgeInsets.all(8),
                      itemCount: doc?.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: context.dynamicHeight(0.13),
                          //color: Colors.amber[colorCodes[index]],
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              subtitle: Text(doc![index]?.id.toString() ?? ""),
                              title: Text(doc![index]?.title ?? ""),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
    );
  }
}
