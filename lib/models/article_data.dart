import 'package:flutter/material.dart';

class Article {
  final int id;
  final String title;
  final String genre;
  final String image;
  final int readingMinutes;
  final DateTime creationDate;

  Article({
    required this.id,
    required this.title,
    required this.genre,
    required this.image,
    required this.readingMinutes,
    required this.creationDate,
  });
}

List<Article> articleList = [
  Article(
    id: 1,
    title: "Restoring Vigour after transplantation: Endurance",
    genre: "Rehabilitation",
    image:
        "https://drive.google.com/uc?export=view&id=13L5vUbchBJ21--KSe5IlknLJE2Nxw5MQ",
    readingMinutes: 5,
    creationDate: DateTime.utc(2023, 5, 31, 15, 19),
  ),
  Article(
    id: 2,
    title: "Coping Emotionally After an Organ Transplant",
    genre: "Emotions",
    image:
        "https://drive.google.com/uc?export=view&id=13L5vUbchBJ21--KSe5IlknLJE2Nxw5MQ",
    readingMinutes: 10,
    creationDate: DateTime.utc(2023, 5, 30, 15, 19),
  ),
  Article(
    id: 3,
    title: "Nigga",
    genre: "Do something",
    image:
        "https://drive.google.com/uc?export=view&id=13L5vUbchBJ21--KSe5IlknLJE2Nxw5MQ",
    readingMinutes: 10,
    creationDate: DateTime.utc(2023, 5, 29, 15, 19),
  ),
  Article(
    id: 4,
    title: "You are",
    genre: "Bitch",
    image:
        "https://drive.google.com/uc?export=view&id=13L5vUbchBJ21--KSe5IlknLJE2Nxw5MQ",
    readingMinutes: 10,
    creationDate: DateTime.utc(2023, 5, 29, 15, 19),
  ),
  // Add more articles as needed
];
