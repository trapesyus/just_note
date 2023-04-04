import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:just_note/core/constants/color_constants.dart';
import 'package:just_note/core/extensions/size_extension.dart';
import 'package:just_note/core/extensions/navigate.extension.dart';
import 'package:just_note/core/widgets/appbar_widget.dart';
import 'package:just_note/core/widgets/label_text_widget.dart';
import 'package:just_note/core/widgets/text_widget.dart';
import 'package:just_note/core/widgets/textfield_widget.dart';
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
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: _homeScreenModel.searchController,
              label: 'Notlarda Arama Yap',
              isIcon: true,
              sizeLeft: 0.1,
              sizeRight: 0.1,
              sizeTop: 0.02,
              verticalHeight: 0.02,
              horizontalHeight: 0.02,
              labelStyle: true,
              isIconOnTap: () async => await _homeScreenModel.searchQuery(),
            ),
            _homeScreenModel.searchController.value.text.isEmpty
                ? Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                          horizontal: context.getSizeWidth(size: 0.02)),
                      itemCount: _homeScreenModel.notes.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _homeScreenCardDesign(
                                context: context,
                                index: index,
                                title: _homeScreenModel.notes[index].title,
                                text: _homeScreenModel.notes[index].icerik),
                          ],
                        );
                      },
                    ),
                  )
                : _homeScreenModel.searchList.isEmpty
                    ? Center(
                        child: CustomText(
                            text:
                                '"${_homeScreenModel.searchController.value.text}" ifadesi notlarda bulunamadı',
                            color: ColorConstants.whiteColor),
                      )
                    : Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                              horizontal: context.getSizeWidth(size: 0.02)),
                          itemCount: _homeScreenModel.searchList.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _homeScreenCardDesign(
                                    context: context,
                                    index: index,
                                    title: _homeScreenModel
                                        .searchList[index].title,
                                    text: _homeScreenModel
                                        .searchList[index].icerik),
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
        leading: const SizedBox(),
        centerTitle: false,
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
      width: context.getSizeWidth(size: 0.8),
      child: Card(
        color: index > 6
            ? ColorConstants.cardColor3
            : ColorConstants.cardColors[index],
        margin:
            EdgeInsets.symmetric(vertical: context.getSizeHeight(size: 0.01)),
        child: ListTile(
          onTap: () => NoteScreen(id: _homeScreenModel.notes[index].id!)
              .navigateTo(context: context),
          title: CustomLabelText(label: title),
          subtitle: CustomCardText(text: text),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _homeScreenModel.notes[index].isFav == 1
                  ? GestureDetector(
                      child: const Icon(Icons.star),
                      onTap: () async => await _homeScreenModel.isFavUpdate(
                          context: context,
                          id: _homeScreenModel.notes[index].id!),
                    )
                  : GestureDetector(
                      child: const Icon(Icons.star_border_outlined),
                      onTap: () async => await _homeScreenModel.isFavUpdate(
                          context: context,
                          id: _homeScreenModel.notes[index].id!),
                    ),
              CustomLabelText(
                  label: _homeScreenModel.notes[index].date, color: true)
            ],
          ),
        ),
      ),
    );
  }
}
