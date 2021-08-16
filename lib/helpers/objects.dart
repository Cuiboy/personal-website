import 'package:flutter/material.dart';

class Experience {
  String tag;
  String pos;
  String? employer;
  String start;
  String? end;
  String desc;
  String url;
  IconData? altIcon;

  Experience({
    required this.tag,
    required this.pos,
    this.employer,
    required this.start,
    this.end,
    required this.desc,
    required this.url,
    this.altIcon,
  });

  static Experience derivative = Experience(
      tag: "Experience",
      pos: "Co-Founder",
      employer: "Derivative LLC",
      start: "06.2019",
      desc:
          "I’m currently running a start-up specializing in education technology enterprise software. The team at Derivative LLC is responsible for the development of the Integral app, a campus information managament software deployed in multiple high schools in Southern California.",
      url: "https://derivative.dev");

  static Experience octo = Experience(
      tag: "Leadership",
      pos: "Chief of Staff",
      employer: "ASUC OCTO",
      start: "06.2021",
      desc:
          "ASUC Office of the CTO is the technology division of the student government at UC Berkeley. The office manages various student-created software platofmrs such as BerkeleyTime, Beehive, and Berkeley Mobile. As the Chief of Staff, I manage the internal operations of the office with over 60 designers & developers.",
      url: "https://octo.asuc.org");

  static Experience bm = Experience(
      tag: "Experience",
      pos: "Associate Product Manager\n",
      employer: "Berkeley Mobile",
      start: "09.2020",
      desc:
          "Berkeley Mobile is the official student-run mobile app of UC Berkeley with over 10,000 users. Our team maintains a campus resource and information aggregation platform, where we deliver resources required by students to navigate the campus and have an enriched Berkeley experience.",
      url: "https://apps.apple.com/us/app/berkeley-mobile/id912243518");

  static Experience decode = Experience(
      tag: "Leadership",
      pos: "Vice President",
      employer: "DECODE Berkeley Chapter",
      start: "07.2021",
      desc:
          "DECODE is the largest technology, innovation and entrepreneurship community jointly hosted with UC Berkeley and Stanford student organizations, alumni networks and entrepreneurship centers. Currenlty, I am in the process of planning the annual DECODE conference in November, 2021.",
      url: "https://decode.build");

  static Experience freelance = Experience(
      tag: "Experience",
      pos: "Freelance App Developer",
      start: "08.2020",
      desc:
          "I’ve worked on several client projects on contract where I have delivered complete UI design wireframes and technical produrcts for clients according to their specifications. If you would like to hire me for an app or website, send me an email.",
      altIcon: Icons.mail_outline,
      url: "mailto:work@cuipatrick.com");

  String startEnd() {
    return start + "-" + (end ?? "Present");
  }
}

class Project {
  String name;
  String desc;
  String imgPath;
  bool available;
  String? url;

  Project(
      {required this.name,
      required this.desc,
      required this.imgPath,
      required this.available,
      this.url});

  static Project integral = Project(
      name: "Integral",
      desc:
          "One-stop solution to campus information management platform for administrators. Digital backpack for students.",
      imgPath: "assets/images/integral-icon.png",
      url: "https://apps.apple.com/us/app/integral-digital-backpack/id1480096639",
      available: true);
  
  static Project broomstick = Project(
      name: "Broomstick",
      desc:
          "Automatically detect and clean up bad photos in your camera roll so you always have space to take more.",
      imgPath: "assets/images/broomstick-icon.png",
      available: false);
  
  static Project packmat = Project(
      name: "Integral",
      desc:
          "A weight-sensitive solution to package theft. MIT LaunchX start-up, class of summer 2019.",
      imgPath: "assets/images/packmat-icon.png",
      url: "https://launchx.com/blog/packmat-an-aesthetic-solution-to-package-theft/",
      available: true);

}
