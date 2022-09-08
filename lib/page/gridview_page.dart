import 'package:flutter/material.dart';
import 'package:flutterhw5/module/point.dart';

class GridViewPage extends StatefulWidget {
   const GridViewPage({Key? key}) : super(key: key);


  @override

  State<GridViewPage> createState() => _GridViewPageState();

}


class _GridViewPageState extends State<GridViewPage> {
  var poss = [];
  @override
  void initState() {
    for(int i=1;i<9;i++){
      for(int j=1;j<9;j++){
       poss.add(Point(j, i));
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chess'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            color: Colors.grey.shade700,
            // width: double.infinity,
            // height: double.infinity,
            width: queryData.size.width,
            height: queryData.size.height,
            child: Stack(
              //mainAxisAlignment: MainAxisAlignment.center,
              //shrinkWrap: true,
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                  ),
                  child: GridView.builder(
                    //padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                      shrinkWrap: true,
                      itemCount: poss.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 8,
                        crossAxisSpacing: 0.0,
                        mainAxisSpacing: 0.0,

                      ), itemBuilder: (BuildContext context, int index){
                    return choseBloc(poss[index]);
                  }),
                ),
              ],


            ),
          ),
        ],
        //child:
      ),
    );
  }

  Widget whiteBloc(){
    return Container(
      color: Colors.white,
    );
  }
  Widget blackBloc(){
    return Container(
      color: Colors.black,
    );
  }

  Widget choseBloc(Point point) {
      return GestureDetector(
        onTap: ()=>showDialog<String>(
            context: context,
            builder: (BuildContext context)=> AlertDialog(
              title: const Text('Thong tin: '),
              content: Text("Cot: ${point.row}. Hang: ${point.column}"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),

        ),
        child: Container(
          color: (point.column%2==1&&point.row%2==1)||(point.column%2==0&&point.row%2==0)? Colors.white:Colors.black,
        ),
      );
  }
}
