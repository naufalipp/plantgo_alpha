class Tools {
  String name;
  String imageUrl;
  Tools({this.name, this.imageUrl});
}

class Hama {
  String namehama;
  String desc;
  String imagehama;
  Hama({this.namehama, this.desc, this.imagehama});
}

class Steps {
  int no;
  String step;
  String imageSteps;
  Steps({this.no, this.step, this.imageSteps});
}

class Tanaman {
  String id, image, title, icon, videoUrl;
  List<Steps> steps;
  List<Tools> tools;
  List<Hama> hama;
  int color;

  Tanaman(
      {this.id,
      this.title,
      this.image,
      this.steps,
      this.tools,
      this.color,
      this.icon,
      this.hama,
      this.videoUrl});
}
