import 'package:radadz_app/src/utils/export.dart';

class SliderModel {
  String? imagePath;
  String? title;
  String? description;

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
    return imagePath!;
  }

  String getTitle() {
    return title!;
  }

  String getDescription() {
    return description!;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> sliders = [];
  SliderModel sliderModel = new SliderModel();

  sliderModel.setImageAssetPath("assets/ilustracion_1.png");
  sliderModel.setTitle('intro_page_title_one'.tr());
  sliderModel.setDescription('intro_page_description_one'.tr());
  sliders.add(sliderModel);

  sliderModel = new SliderModel();
  sliderModel.setImageAssetPath("assets/ilustracion_2.png");
  sliderModel.setTitle('intro_page_title_two'.tr());
  sliderModel.setDescription('intro_page_description_two'.tr());
  sliders.add(sliderModel);

  sliderModel = new SliderModel();
  sliderModel.setImageAssetPath("assets/ilustracion_3.png");
  sliderModel.setTitle('intro_page_title_three'.tr());
  sliderModel.setDescription('intro_page_description_three'.tr());
  sliders.add(sliderModel);

  sliderModel = new SliderModel();

  return sliders;
}
