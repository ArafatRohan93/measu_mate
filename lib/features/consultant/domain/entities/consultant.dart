import 'package:equatable/equatable.dart';

class Consultant extends Equatable {
  final String name;
  final String degree1;
  final String degree2;
  final String specialistTitle;
  final String imageUrl;
  const Consultant({
    required this.name,
    required this.degree1,
    required this.degree2,
    required this.specialistTitle,
    required this.imageUrl,
  });
  @override
  List<Object?> get props =>
      [name, degree1, degree2, specialistTitle, imageUrl];
}
