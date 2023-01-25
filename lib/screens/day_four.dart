
import 'package:flutter/material.dart';

class DayFour extends StatefulWidget {
  const DayFour({Key? key}) : super(key: key);

  @override
  _DayFourState createState() => _DayFourState();
}

class _DayFourState extends State<DayFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:const DynamicTextFieldPage(),
    );
  }
}

class DynamicTextFieldPage extends StatefulWidget {
  const DynamicTextFieldPage({Key? key}) : super(key: key);

  @override
  State<DynamicTextFieldPage> createState() => _DynamicTextFieldPageState();
}

class _DynamicTextFieldPageState extends State<DynamicTextFieldPage> {
  List<Widget> fields = [];
  List<TextEditingController> fieldData = [];
  int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title:Text('Dynamic Form Fileds',style: TextStyle(fontSize: 20,color: Colors.white),) ,),
        body: fields.isEmpty
            ? const Center(
                child: Text(
                  'No data',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width*0.85,
                      height: MediaQuery.of(context).size.height*0.30 ,
                      child: ListView.builder(itemCount:fieldData.length,itemBuilder: (context, index) => Text(
                        fieldData[index].text,style:const TextStyle(fontSize: 20,color: Colors.white),
                      ),),
                    ),
                  )),
                const  SizedBox(height: 10,),
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                        itemCount: fields.length,
                        itemBuilder: (context, index) => fields[index],
                      ),
                  ),
                ],
              ),
            ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(heroTag: 0,child:const Icon(Icons.print),onPressed: (){
     fieldData.forEach((element) { print(element.text);});
     setState(() {

     });

          },),
      const    SizedBox(width: 20,),
          FloatingActionButton(heroTag: 1,child:const Icon(Icons.add),onPressed: (){
            fieldData.add(returnController('controller$index'));
            fields.add(Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(width: 300,child: TextField(decoration: InputDecoration(contentPadding:const EdgeInsets.all(15),prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(backgroundColor: Colors.white,child: Text('$index'),),
              )),controller:fieldData[index],)),
            ));
            index++;
            setState(() {

            });
          },),
        ],
      ),
    );
  }
}
TextEditingController returnController(String controllerName) {
  final controllerName = TextEditingController();
  return controllerName;
}