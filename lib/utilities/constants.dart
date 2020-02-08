import 'package:flutter/material.dart';

//TODO name const starting with 'k', it's easier to find
import 'package:google_fonts/google_fonts.dart';

const kinformationboardcolor = Color(0xFF23395B);
const kwidgetgreen = Color(0xFF6CA5A9);
const kbuttonred = Color(0xFFDB5461);
const kbodytextstyle =
    TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600);
const kfilmcardcolor = Color(0xFFC6C7CE);
const kbackgroundcolor = Color(0xFF737499);
const ksettingtextstyle =
    TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.w900);
const kpickertextstyle =
    TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.w600);
const kkodakred = Color(0xFFEB1D27);
const kkodakyellow = Color(0xFFFFB700);

List<String> kapertureonethirdstop = [
  0.7,
  0.8,
  0.9,
  1.0,
  1.1,
  1.2,
  1.4,
  1.6,
  1.8,
  2,
  2.2,
  2.5,
  2.8,
  3.2,
  3.5,
  4,
  4.5,
  5.0,
  5.6,
  6.3,
  7.1,
  8,
  9,
  10,
  11,
  13,
  14,
  16,
  18,
  20,
  22,
  25,
  29,
  32,
  36,
  40,
  45,
  51,
  57,
  64,
  72,
  80,
  90,
].map((int)=>int.toString()).toList();

const List<String> kshutterspeed = [
  '1/2',
  '1/4',
  '1/8',
  '1/15',
  '1/30',
  '1/60',
  '1/125',
  '1/250',
  '1/500',
  '1/1000',
  '1/2000',
  '1/4000',
  '1/8000',
];

List<String> klens = [
  18,
  24,
  35,
  50,
  55,
  85,
  105,
  135,
  200,
  300,
].map((int)=>int.toString()).toList();

const List<String> kEXR = [
  "36",
  "24",
  "16",
  "15",
  "14",
  "13",
  "12"
];

const List<String> kISO = [
  "0.8/0°",
  "1/1°",
  "1.2/2°",
  "1.6/3°",
  "2/4°",
  "2.5/5°",
  "3/6°",
  "4/7°",
  "5/8°",
  "6/9°",
  "8/10°",
  "10/11°",
  "12/12°",
  "16/13°",
  "20/14°",
  "25/15°",
  "32/16°",
  "40/17°",
  "50/18°",
  "64/19°",
  "80/20°",
  "100/21°",
  "125/22°",
  "160/23°",
  "200/24°",
  "250/25°",
  "320/26°",
  "400/27°",
  "500/28°",
  "640/29°",
  "800/30°",
  "1000/31°",
  "1250/32°",
  "1600/33°",
  "2000/34°",
  "2500/35°",
  "3200/36°",
  "4000/37°",
  "5000/38°",
  "6400/39°",
  "8000/40°",
  "10000/41°",
  "12500/42°",
  "16000/43°",
  "20000/44°",
  "25000/45°",
  "32000/46°",
  "40000/47°",
  "50000/48°",
  "64000/49°",
  "80000/50°",
  "100000/51°",
  "125000/52°",
  "160000/53°",
  "200000/54°",
  "250000/55°",
  "320000/56°",
  "400000/57°",
  "500000/58°",
  "640000/59°",
  "800000/60°",
  "1000000/61°",
  "1250000/62°",
  "1600000/63°",
  "2000000/64°",
  "2500000/65°",
  "3200000/66°",
  "4000000/67°",
];