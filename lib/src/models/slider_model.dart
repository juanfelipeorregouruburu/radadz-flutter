class SliderModel {
  String imagePath;
  String title;
  String description;

  SliderModel({this.imagePath, this.title, this.description});

  void setImageAssetPath(String getImagePath) {
    imagePath = getImagePath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  String getImagePath() {
    return imagePath;
  }

  String getTitle() {
    return title;
  }

  String getDescription() {
    return description;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> sliders = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  sliderModel.setImageAssetPath("assets/ilustracion_1.png");
  sliderModel.setTitle("Domicilios & pick up");
  sliderModel.setDescription(
      "Lo hacemos amigable. Inicia sesión, ingresa tu dirección, pide, espera y disfruta.");
  sliders.add(sliderModel);

  sliderModel = new SliderModel();
  sliderModel.setImageAssetPath("assets/ilustracion_2.png");
  sliderModel.setTitle("Tu comida a un tab de distancia");
  sliderModel.setDescription(
      "Comida rápida nacional e internacional para ti y tus acompañantes.");
  sliders.add(sliderModel);

  sliderModel = new SliderModel();
  sliderModel.setImageAssetPath("assets/ilustracion_3.png");
  sliderModel.setTitle("Tiempos cortos de entrega");
  sliderModel.setDescription(
      "Hacemos que pedir tu comida favorita a domicilio o para recoger sea rápido y sencillo.");
  sliders.add(sliderModel);

  sliderModel = new SliderModel();

  return sliders;
}
