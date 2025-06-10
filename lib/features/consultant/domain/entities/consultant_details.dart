import 'package:equatable/equatable.dart';

class ConsultantDetails extends Equatable {
  final String name;
  final String imageUrl;
  final String degree1;
  final String degree2;
  final String specialistTitle;
  final List<Education> educationList;
  final List<String> expertise;
  final List<Project> projects;
  final List<TimeSlot> timeSlots;

  const ConsultantDetails({
    required this.name,
    required this.imageUrl,
    required this.degree1,
    required this.degree2,
    required this.specialistTitle,
    required this.educationList,
    required this.expertise,
    required this.projects,
    required this.timeSlots,
  });

  @override
  List<Object?> get props => [
        name,
        imageUrl,
        degree1,
        degree2,
        specialistTitle,
        educationList,
        expertise,
        projects,
        timeSlots
      ];
}

class Education extends Equatable {
  final String title;
  final String subtitle;
  const Education({required this.title, required this.subtitle});
  @override
  List<Object?> get props => [title, subtitle];
}

class Project extends Equatable {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String duration;
  const Project(
      {required this.title,
      required this.subtitle,
      required this.imageUrl,
      required this.duration});
  @override
  List<Object?> get props => [title, subtitle, imageUrl, duration];
}

class TimeSlot extends Equatable {
  final String day;
  final String date;
  final String time;
  const TimeSlot({required this.day, required this.date, required this.time});
  @override
  List<Object?> get props => [day, date, time];
}
