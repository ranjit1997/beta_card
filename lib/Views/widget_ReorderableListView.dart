import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReorderableListView1 extends StatefulWidget {


  ReorderableListView1({Key key, this.title}) : super(key: key);
  
  final String title;

  @override
  _ReorderableListViewState createState() => _ReorderableListViewState();
}

class _ReorderableListViewState extends State<ReorderableListView1> {
  
  List<String> list1Items = [];
  final TextEditingController eCtrl = new TextEditingController();
  
  


  @override
  Widget build(BuildContext context) 
  {
   
    return new Scaffold(
      appBar: new AppBar(title: new Text("ReorderableListView Demo"),),
      body: new Column(
        children: <Widget>[
          Padding
          (
            padding: EdgeInsets.only(left:10.0,right:10.0),
          child:new TextField(
            controller: eCtrl,
            decoration: InputDecoration(hintText: 'Enter Some Name'),
            onSubmitted: (text) {
              list1Items.add(text);
              eCtrl.clear();
              setState(() {});
            },
          ),
          ),
          new Expanded(
            child: ReorderableListView(
            onReorder: _onReorder,
             scrollDirection: Axis.vertical,
             padding: const EdgeInsets.symmetric(vertical: 8.0),
            children: List.generate(
          list1Items.length,
          (index) {
            /*
            return ListViewCard(
              list1Items,
              index,
              Key('$index'),
            );*/
            return cardInfoWidget(index, Key('$index'), list1Items);
          },
        ),
      ),
            
        )
        ],
      )
    );
  }

   void _onReorder(int oldIndex, int newIndex) 
   {
    setState(
      () {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final String item = list1Items.removeAt(oldIndex);
        list1Items.insert(newIndex, item);
      },
    );
  }

  Widget cardInfoWidget( int index,  Key key, List<String> listItems)
  {
     
  return Card(
      key: key,
      margin: EdgeInsets.all(4),
      color: Colors.white,
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () => Fluttertoast.showToast(
            msg: "Item ${listItems[index]} selected.",
            toastLength: Toast.LENGTH_SHORT),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Name: ${listItems[index]}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.left,
                      maxLines: 5,
                    ),
                  ),
                  /*
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Description ${widget.listItems[widget.index]}',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16),
                      textAlign: TextAlign.left,
                      maxLines: 5,
                    ),
                  ),
                  */
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(
                Icons.reorder,
                color: Colors.grey,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}