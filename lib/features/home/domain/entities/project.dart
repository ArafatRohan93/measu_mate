class Project {
  final String title;
  final String subtitle;
  final String imagePath;
  final double cost;
  final double progress; // 0.0 to 1.0

  Project({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.cost,
    required this.progress,
  });
}
