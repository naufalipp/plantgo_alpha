class PlantIcoModel {
  String image;

  PlantIcoModel(this.image);
}

List<PlantIcoModel> planticos =
    plantIcoData.map((item) => PlantIcoModel(item['image'])).toList();

var plantIcoData = [
  {"image": "assets/images/img_plantico1.png"},
  {"image": "assets/images/img_plantico2.png"},
  {"image": "assets/images/img_plantico3.png"},
  {"image": "assets/images/img_plantico4.png"},
  {"image": "assets/images/img_plantico5.png"},
];
