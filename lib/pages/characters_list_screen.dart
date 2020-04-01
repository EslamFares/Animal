

import 'package:animals_show_animation/models/character.dart';
import 'package:animals_show_animation/widgets/character_widget.dart';
import 'package:flutter/material.dart';
import 'package:animals_show_animation/styleguide.dart';

class CharacterListScreen extends StatefulWidget {
  @override
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        viewportFraction: 1.0,
        initialPage: currentPage,
        keepPage: false
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Animals',
          style: AppTheme.display1.copyWith(color: Colors.amber,fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Icon(Icons.blur_on,color: Colors.amber,),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.blur_on,color: Colors.amber,),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 8),
                child: Card(
                  shape: StadiumBorder(side: BorderSide(color: Colors.amber,width: 2,)),
                  color: Colors.black87,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(text: 'Animals Information', style: AppTheme.heading.copyWith(color: Colors.amber,fontSize: 30)),
                        TextSpan(text: '\n'),
                        TextSpan(text: 'Charcters', style: AppTheme.subHeading),
                      ]),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    children: <Widget>[
                  for (var i = 0; i < chatacters.length; i++)
                    CharacterWidget(
                        character: chatacters[i],
                        pageController: _pageController,
                        currentPage: i)
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
