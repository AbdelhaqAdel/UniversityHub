abstract class EndPoint{

//-----------------End  points for Students  ---------------
  static const String baseURL='https://lms.runasp.net/api/';
  static const String login='Account/login';
  static const String news ='News';
  static const String allCourses='Students/CurrentCourcesInfo';
  static const String STU_INFO='Students/GetStudentInfo';
  static const String SUBMITQUIZ='Students/quiz/submit';
  static const String ADDEVENT='Calendar';
  static const String GETCALENDER='Calendar/GetAllCalendar';
//-----------------End  points for Instructor  ---------------
  static const String INS_INFO='Instructor/GetInstructorInfo';
  static const String INS_COURSES='Instructor/CurrentCoursesInfo';
  static const String INS_AllStudent='Instructor/GetAllStudentsEnrolledInAcourse?CycleId=';
  static const String INS_Gradeforstudent='Instructor/GetGradesForCurrentCourseForAstudent?';


//--------Reset pass---------------
  static const String RESET_PASS='Account/UpdatePassword';
  static const String UPDATE_PHOTO='Account/update Photo';
}