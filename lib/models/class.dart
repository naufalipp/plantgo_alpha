class Tools {
  String name;
  String imageUrl;
  Tools({this.name, this.imageUrl});
}

class Tanaman {
  String id, image, title, icon;
  List<String> steps;
  List<Tools> tools;
  int color;

  Tanaman(
      {this.id,
      this.title,
      this.image,
      this.steps,
      this.tools,
      this.color,
      this.icon});
}
