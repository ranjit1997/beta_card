//pseudo code 

// AddUserProfileData()
/*
Begin
    Create Model Class object
    UserProfile userProfile = new UserProfile();

    Create FirebaseDatabaseReference.
    FirebaseDatabaseReference firebaseDatabaseRef = new FirebaseDatabaseReference();
    Add Data in FirebaseDatabase use object of FirebaseDatabaseReference.
 
    firebaseDatabaseRef.add(userProfile.getFirstName());
    firebaseDatabaseRef.add(userProfile.getLastName());
          |
          |
          |
          etc.

End
*/ 

// RetriveUserProfileData()
/*
Begin
   Create Model Class object
   UserProfile userProfile = new UserProfile();

  Create FirebaseDatabaseReference.
  FirebaseDatabaseReference firebaseDatabaseRef = new FirebaseDatabaseReference();
  Retrive Data from FirebaseDatabase by using object of FirebaseDatabaseReference.
 
  firebaseDatabaseRef.add(userProfile.setFirstName());
  firebaseDatabaseRef.add(userProfile.setLastName());
          |
          |
          |
          etc.

End
*/