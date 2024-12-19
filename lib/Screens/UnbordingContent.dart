class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Find Help Nearby',
      image: 'assets/onbording.png',
      discription: "Publish your tasks to people\naround in seconds. "
  ),
  UnbordingContent(
      title: 'Get Help Fast',
      image: 'assets/onbording.png',
      discription: "Receive instant quotes for your\ntask. "

  ),
  UnbordingContent(
      title: 'Request Services...',
      image: 'assets/onbording.png',
      discription: "Choose the best offer and get\nyour tasks done quickly. "

  ),
];