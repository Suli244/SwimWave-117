// ignore_for_file: public_member_api_docs, sort_constructors_first
class FitnessDetailModel {
  final String titleAppBarDetail;
  final String image;
  final String title;
  final String video;
  final String description;
  FitnessDetailModel({
    required this.titleAppBarDetail,
    required this.image,
    required this.title,
    required this.video,
    required this.description,
  });
}

class FitnessMainModel {
  final String titleAppBarMain;
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  final List<FitnessDetailModel> detailModels;
  FitnessMainModel({
    required this.titleAppBarMain,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.detailModels,
  });
}
