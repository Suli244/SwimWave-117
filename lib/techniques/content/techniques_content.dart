class TechCon {
  final String image;
  final String title;
  final String video;
  final String discr;
  TechCon({
    required this.image,
    required this.title,
    required this.video,
    required this.discr,
  });
}

List<TechCon> listTechCon = [
  TechCon(
      image: 'assets/images/tti1.png',
      video: 'https://www.youtube.com/watch?v=AQy_c30lNjI',
      title: "Technique of basic swimming styles",
      discr:
          '''The front crawl is likely the first swimming stroke you think of when you picture swimming. It is commonly called the freestyle stroke as most swimmers choose to use this stroke in freestyle events as it is the fastest.
To execute the front crawl, you lie on your stomach with your body parallel to the water. Propel yourself forward with alternating arm movements in a sort of windmill motion that starts by pushing underwater and recovers above water. Your legs should propel you with a flutter kick, which is performed with pointed feet as your legs move up and down in alternation. Do not bend your legs at the knee.'''),
  TechCon(
      image: 'assets/images/tti2.png',
      video: 'https://www.youtube.com/watch?v=OdCtZLFZmxQ',
      title: "Breathing technique",
      discr:
          '''Proper breathing technique is crucial for efficient swimming and can greatly enhance your performance. To breathe effectively while swimming, turn your head to the side along with the stroke movement in a rhythmic pattern. Ensure that you exhale underwater through your nose or mouth to empty your lungs fully before turning your head for inhalation. This technique helps maintain buoyancy and streamline in water, reducing drag and increasing speed.'''),
  TechCon(
      image: 'assets/images/tti3.png',
      video: 'https://www.youtube.com/watch?v=GoyXk3xMfKY',
      title: "Starting and turning technique",
      discr:
          '''Mastering the starting and turning technique in swimming can significantly impact your overall performance. The start involves a powerful leap from the block, aiming for distance and minimal water resistance upon entry. For turns, approach the wall with a streamlined body position, execute a swift somersault, and push off the wall with your feet, quickly returning to your stroke. These techniques require practice to perfect timing and efficiency, vital for competitive swimming.'''),
  TechCon(
      image: 'assets/images/tti4.png',
      video: 'https://www.youtube.com/watch?v=RhdGDODFXlA',
      title: "Long distance swimming technique",
      discr:
          '''Long distance swimming demands endurance, efficiency, and a focus on conserving energy. The technique emphasizes a relaxed, steady stroke, constant pace, and efficient breathing to sustain energy over extended periods. Focus on maintaining a streamlined body position to reduce drag and efficiently use your arms and legs to propel forward. Efficient energy management and pacing strategy are key to success in long distance swimming, along with proper nutrition and hydration strategies.'''),
  TechCon(
      image: 'assets/images/tti5.png',
      video: 'https://www.youtube.com/watch?v=EHQyRMLHuUk',
      title: "Speed training and short distance swimming technique",
      discr:
          '''Speed training and short distance swimming focus on explosive power and sprinting ability. This involves high-intensity interval training, with bursts of maximum effort followed by short rest periods to build strength and speed. Technique is crucial, with emphasis on powerful starts, quick turns, and maintaining high stroke rate while minimizing drag. Proper alignment and streamlined position in the water are essential to maximize speed and efficiency, making every movement count towards achieving the best possible time.'''),
];
