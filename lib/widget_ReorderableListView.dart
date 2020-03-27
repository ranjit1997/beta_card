import 'package:beta_card/widget_ListViewCard.dart';
import 'package:flutter/material.dart';

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
            return ListViewCard(
              list1Items,
              index,
              Key('$index'),
            );
          },
        ),
      ),
            
        )
        ],
      )
    );
  }

   void _onReorder(int oldIndex, int newIndex) {
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
}

