import 'package:beta_card/Model/model_user_data.dart';
import 'package:firebase_database/firebase_database.dart';

class RetriveUserData{

    void showUserData(List allData,MyData myData,DatabaseReference ref)
    {
          
    ref.child('node-name').once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      allData.clear();
      for (var key in keys) {
         data[key][myData.setUserName(name)],
         data[key][myData.setUserMessage(message)],
         data[key][myData.setUserProfession(profession)],

         allData.add(
            data[key][myData.getUserName()],
            data[key][myData.getUserMessage()],
            data[key][myData.getUserProfession()]
           );
         }
    /*
      setState(() {
        print('Length : ${allData.length}');
      });
    */
    
   });
}

}