import 'package:animals_show_animation/pages/character_detail_screen.dart';
import 'package:animals_show_animation/styleguide.dart';
import 'package:flutter/material.dart';
import 'package:animals_show_animation/models/character.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;

  final PageController pageController;
  final int currentPage;

  CharacterWidget(
      {Key key, this.character, this.pageController, this.currentPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 350),
                pageBuilder: (context, _, __) => CharacterDetailScreen(
                      character: character,
                    )));
      },
      child: AnimatedBuilder(
        animation: pageController,
        builder: (context, child) {
          double value = 1;
          if (pageController.position.haveDimensions) {
            value = pageController.page - currentPage;
            value = (1 - (value.abs() * 0.6)).clamp(0.0, 1.0);
          }

          return Stack(children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: CharacterCardBackgroundClipper(),
                child: Hero(
                  tag: "background-${character.name}",
                  child: Container(
                    height: 0.6 * screenHeight,
                    width: 0.9 * screenWidth,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: character.colors,
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft)),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -1.0),
              child: Hero(
                tag: "image-${character.name}",
                child: Image.asset(
                  character.imagePath,
                  height: screenHeight * .55 * value,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48, right: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Hero(
                    tag: "name-${character.name}",
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        child: Text(
                          character.name,
                          style: AppTheme.heading,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Tap to read more...',
                    style: AppTheme.subHeading,
                  )
                ],
              ),
            )
          ]);
        },
      ),
    );
  }
}

class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double curveDistance = 40;
    path.moveTo(0, size.height * 0.4);
    path.lineTo(0, size.height - curveDistance);
    path.quadraticBezierTo(1, size.height - 1, 0 + curveDistance, size.height);
    path.lineTo(size.width - curveDistance, size.height);
    path.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    path.lineTo(size.width, 0 + curveDistance);
    path.quadraticBezierTo(size.width - 1, 0, size.width - curveDistance - 5,
        0 + curveDistance / 3);
    path.lineTo(curveDistance, size.height * 0.29);
    path.quadraticBezierTo(1, (size.height * 0.30) + 10, 0, size.height * 0.4);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
