
import 'package:after_layout/after_layout.dart';
import 'package:animals_show_animation/models/character.dart';
import 'package:animals_show_animation/styleguide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatefulWidget {
  final double _expandedBottomSheet = 0;
  final double _collapsedBottomSheet = -210;
  final double _fullcollapsedBottomSheet = -260;
  final Character character;

  const CharacterDetailScreen({Key key, this.character}) : super(key: key);

  @override
  _CharacterDetailScreenState createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen>
    with AfterLayoutMixin<CharacterDetailScreen> {
  double _currentButtonSheet = -260;
  bool isCollapsed = false;
  PageController _pageController;
  int currentpage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 1.0,
      initialPage: currentpage,
      keepPage: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: "background-${widget.character.name}",
            child: DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: widget.character.colors,
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft)),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, left: 10),
                  child: Container(
                    width: 55.0,
                    height: 55.0,
                    padding: const EdgeInsets.all(0.1), // borde width
                    decoration: new BoxDecoration(
                      border: new Border.all(
                        width: 2.0,
                        color: Colors.white,
                      ),
                      color: Colors.black26, // border color
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      foregroundColor: Colors.black26,
                      backgroundColor: Colors.black26,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        iconSize: 35,
                        color: Colors.white.withOpacity(.9),
                        onPressed: () {
                          Future.delayed(const Duration(milliseconds: 250), () {
                            setState(() {
                              _currentButtonSheet = widget._fullcollapsedBottomSheet;
                            });
                          });
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Hero(
                      tag: "image-${widget.character.name}",
                      child: Image.asset(
                        widget.character.imagePath,
                        height: screenheight * 0.45,
                      ),
                    )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                  child: Hero(
                    tag: "name-${widget.character.name}",
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        child: Text(
                          widget.character.name,
                          style: AppTheme.heading,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 10, 8, 50),
                  child: Text(
                    widget.character.description,
                    style: AppTheme.subHeading,
                  ),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate,
            bottom: _currentButtonSheet,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: _onTap,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      height: 50,
                      child: Text(
                        'Clips',
                        style: AppTheme.subHeading.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: _clipsWidget(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _onTap(){
    setState(() {
      _currentButtonSheet = isCollapsed? widget._expandedBottomSheet:widget._collapsedBottomSheet;
      isCollapsed = !isCollapsed;
    });
  }

  Widget _clipsWidget() {
    return Container(
      height: 210,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              roundedContainer(Colors.redAccent),
              SizedBox(
                height: 20,
              ),
              roundedContainer(Colors.greenAccent),
            ],
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            children: <Widget>[
              roundedContainer(Colors.deepOrange),
              SizedBox(
                height: 20,
              ),
              roundedContainer(Colors.lightBlueAccent),
            ],
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            children: <Widget>[
              roundedContainer(Colors.lightBlueAccent),
              SizedBox(
                height: 20,
              ),
              roundedContainer(Colors.pinkAccent),
            ],
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            children: <Widget>[
              roundedContainer(Colors.orangeAccent),
              SizedBox(
                height: 20,
              ),
              roundedContainer(Colors.purple),
            ],
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            children: <Widget>[
              roundedContainer(Colors.grey),
              SizedBox(
                height: 20,
              ),
              roundedContainer(Colors.blueGrey),
            ],
          ),
        ],
      ),
    );
  }

  Widget roundedContainer(Color color) {
    return Container(
      width: 75,
      height: 75,
      child: Image.asset(widget.character.imagePath),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isCollapsed = true;
        _currentButtonSheet = widget._collapsedBottomSheet;
      });
    });
  }
}
