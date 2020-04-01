import 'package:flutter/material.dart';

class Character {
  final String name;
  final String imagePath;
  final String description;
  final List<Color> colors;

  Character({this.name, this.imagePath, this.description, this.colors});
}

List chatacters = [
  Character(
      name: 'Panther',
      imagePath: 'assets/images/Panther.png',
      description:
          'Melanism in the jaguar is conferred by a dominant allele, and in the leopard (Panthera pardus) by a recessive allele. Close examination of the colour of these black cats will show that the typical markings are still present, but are hidden by the excess black pigment melanin, giving an effect similar to that of printed silk. This is called ghost striping. Melanistic and non-melanistic animals can be littermates. It is thought that melanism may confer a selective advantage under certain conditions since it is more common in regions of dense forest, where light levels are lower.[citation needed] Recently, preliminary studies also suggest that melanism might be linked to beneficial mutations in the immune system.',
      colors: [Colors.orange.shade200, Colors.deepOrange.shade400]),
  Character(
      name: 'Buffalo',
      imagePath: 'assets/images/Buffalo.png',
      description:
          "The skin of river buffalo is black, but some specimens may have dark, slate-coloured skin. Swamp buffalo have a grey skin at birth, but become slate blue later. Albinoids are present in some populations. River buffalo have comparatively longer faces, smaller girths, and bigger limbs than swamp buffalo. Their dorsal ridges extend further back and taper off more gradually. Their horns grow downward and backward, then curve upward in a spiral. Swamp buffalo are heavy-bodied and stockily built; the body is short and the belly large. The forehead is flat, the eyes prominent, the face short, and the muzzle wide. The neck is comparatively long, and the withers and croup are prominent. A dorsal ridge extends backward and ends abruptly just before the end of the chest. Their horns grow outward, and curve in a semicircle, but always remain more or less on the plane of the forehead. The tail is short, reaching only to the hocks. Height at withers is 129–133 cm (51–52 in) for males, and 120–127 cm (47–50 in) for females. They range in weight from 300–550 kg (660–1,210 lb), but weights of over 1,000 kg (2,200 lb) have also been observed.[1]",
      colors: [Colors.pink.shade200, Colors.redAccent.shade400]),

  Character(
      name: 'Lion',
      imagePath: 'assets/images/lion.png',
      description:
      "The skin of river buffalo is black, but some specimens may have dark, slate-coloured skin. Swamp buffalo have a grey skin at birth, but become slate blue later. Albinoids are present in some populations. River buffalo have comparatively longer faces, smaller girths, and bigger limbs than swamp buffalo. Their dorsal ridges extend further back and taper off more gradually. Their horns grow downward and backward, then curve upward in a spiral. Swamp buffalo are heavy-bodied and stockily built; the body is short and the belly large. The forehead is flat, the eyes prominent, the face short, and the muzzle wide. The neck is comparatively long, and the withers and croup are prominent. A dorsal ridge extends backward and ends abruptly just before the end of the chest. Their horns grow outward, and curve in a semicircle, but always remain more or less on the plane of the forehead. The tail is short, reaching only to the hocks. Height at withers is 129–133 cm (51–52 in) for males, and 120–127 cm (47–50 in) for females. They range in weight from 300–550 kg (660–1,210 lb), but weights of over 1,000 kg (2,200 lb) have also been observed.[1]",
      colors: [Colors.yellow[200], Colors.amberAccent.shade400]),

  Character(
      name: 'Dolfin',
      imagePath: 'assets/images/dolfin.png',
      description:
      "The skin of river buffalo is black, but some specimens may have dark, slate-coloured skin. Swamp buffalo have a grey skin at birth, but become slate blue later. Albinoids are present in some populations. River buffalo have comparatively longer faces, smaller girths, and bigger limbs than swamp buffalo. Their dorsal ridges extend further back and taper off more gradually. Their horns grow downward and backward, then curve upward in a spiral. Swamp buffalo are heavy-bodied and stockily built; the body is short and the belly large. The forehead is flat, the eyes prominent, the face short, and the muzzle wide. The neck is comparatively long, and the withers and croup are prominent. A dorsal ridge extends backward and ends abruptly just before the end of the chest. Their horns grow outward, and curve in a semicircle, but always remain more or less on the plane of the forehead. The tail is short, reaching only to the hocks. Height at withers is 129–133 cm (51–52 in) for males, and 120–127 cm (47–50 in) for females. They range in weight from 300–550 kg (660–1,210 lb), but weights of over 1,000 kg (2,200 lb) have also been observed.[1]",
      colors: [Colors.blue.shade200, Colors.blueAccent.shade400]),
];
