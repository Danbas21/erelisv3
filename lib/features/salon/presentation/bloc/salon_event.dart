part of 'salon_bloc.dart';

@freezed
sealed class SalonEvent with _$SalonEvent {
  const factory SalonEvent.loadCourses() = _LoadCourses;
  const factory SalonEvent.loadCourseDetails(String courseId) =
      _LoadCourseDetails;
  const factory SalonEvent.addCourse(dynamic subject) = _AddCourse;
  const factory SalonEvent.updateCourse(dynamic subject) = _UpdateCourse;
  const factory SalonEvent.deleteCourse(String courseId) = _DeleteCourse;
  const factory SalonEvent.loadCoursesSuccess(List<dynamic> courses) =
      _LoadCoursesSuccess;
  const factory SalonEvent.toggleSidebar() =
      _ToggleSidebar; // Evento para alternar la barra lateral
}
