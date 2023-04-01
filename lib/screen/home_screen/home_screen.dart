import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:just_note/core/constants/color_constants.dart';
import 'package:just_note/core/extensions/size_extension.dart';
import 'package:just_note/core/extensions/navigate.extension.dart';
import 'package:just_note/core/widgets/appbar_widget.dart';
import 'package:just_note/core/widgets/label_text_widget.dart';
import 'package:just_note/screen/add_note_screen/add_note_screen.dart';
import 'package:just_note/screen/home_screen/home_screen_model/home_screen_model.dart';

import '../../core/widgets/card_text_widget.dart';
import '../note_screen/note_screen_model/note_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenModel _homeScreenModel = HomeScreenModel();
  @override
  void initState() {
    _homeScreenModel.getNoteList().whenComplete(() => null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _homeScreenFloatingActionButton(context: context),
      appBar: _homeScreenCustomAppBar(),
      body: Observer(builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                reverse: false,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: context.getSizeWidth(size: 0.02)),
                itemCount: _homeScreenModel.listViewOne.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _homeScreenCardDesign(
                          context: context,
                          index: index,
                          title: _homeScreenModel.listViewOne[index].title,
                          text: _homeScreenModel.listViewOne[index].icerik),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                reverse: false,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                    horizontal: context.getSizeWidth(size: 0.02)),
                itemCount: _homeScreenModel.listViewTwoo.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _homeScreenCardDesign(
                          context: context,
                          index: index,
                          title: _homeScreenModel.listViewTwoo[index].title,
                          text: _homeScreenModel.listViewTwoo[index].icerik),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }

  FloatingActionButton _homeScreenFloatingActionButton(
      {required BuildContext context}) {
    return FloatingActionButton(
        onPressed: () => AddNoteScreen().navigateTo(context: context),
        backgroundColor: ColorConstants.appBarBackGreenColor,
        child: const Icon(Icons.playlist_add));
  }

  CustomAppBar _homeScreenCustomAppBar() {
    return CustomAppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
        centerTitle: true,
        title: 'Notlarım',
        titleStyle: true,
        backgroundColor: ColorConstants.appBarBackGreenColor);
  }

  SizedBox _homeScreenCardDesign(
      {required BuildContext context,
      required int index,
      required String title,
      required String text}) {
    return SizedBox(
      width: context.getSizeWidth(size: 0.4),
      child: Card(
        color: ColorConstants.cardColors[index],
        margin:
            EdgeInsets.symmetric(vertical: context.getSizeHeight(size: 0.01)),
        child: ListTile(
          onTap: () => NoteScreen(id: _homeScreenModel.notes[index].id!)
              .navigateTo(context: context),
          title: CustomLabelText(label: title),
          subtitle: CustomCardText(text: text),
          trailing: Observer(builder: (context) {
            return GestureDetector(
              child:
                  Icon(_homeScreenModel.isFav ? Icons.star : Icons.star_border),
              onTap: () => _homeScreenModel.isFavCheck(),
            );
          }),
        ),
      ),
    );
  }
}
