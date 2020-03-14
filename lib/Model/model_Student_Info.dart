class StudentID
{
  String stud_FirstName;
  String stud_LastName;
  int stud_ID;

  String getFirstName(String firstName)
  {
    return  this.stud_FirstName = firstName;
  }

  String getLastName(String lastName)
  {
      return this.stud_LastName = lastName;
  }

  int getStdID(int std_ID)
  {
    return  this.stud_ID = std_ID;
  }
}