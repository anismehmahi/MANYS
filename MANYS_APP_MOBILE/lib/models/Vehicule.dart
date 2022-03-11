import 'package:flutter/material.dart';
import 'package:koko/Screens/Home.dart';
class Vehicule extends StatefulWidget {
  String name;
  String num;
  String asset;
  String index;
  String barCode;
  Map<String,String> Car ;

  Vehicule({String name , String num , String asset,String index,String barCode}){
    this.name=name;
    this.index=index;
    this.num=num;
    this.asset=asset;
    this.barCode= barCode;

  }
  @override
  _VehiculeState createState() => _VehiculeState();
}

class _VehiculeState extends State<Vehicule> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Column(
          children: [
            Stack(
              overflow: Overflow.visible,

              children: [

                Column(
                  children: [

                    Container(
                    //  margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                      width: MediaQuery.of(context).size.width*0.6,
                      // height: MediaQuery.of(context).size.width*0.8,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,

                          borderRadius: BorderRadius.only(
                            topRight: Radius.elliptical(110, 30),
                            topLeft: Radius.elliptical(110, 30),
                            bottomRight: Radius.elliptical(20, 20),
                            bottomLeft: Radius.elliptical(20, 20),
                          )
                      ),

                      child: Center(
                        child: Column(

                          children: [
                            SizedBox(
                              height: 150,
                              /* child: Hero(
                                  tag: '$index',
                                  child: Image(image: AssetImage(asset)))*/),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,

                                children: [
                                  Text('${widget.name}'.toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                                  //Text('$num',style: TextStyle(color: Colors.white,fontSize: 20),),
                                  SizedBox(height: 13,)
                                ],
                              ),
                              decoration: BoxDecoration(
                                //    color: Colors.indigoAccent,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.elliptical(5, 5),
                                    topLeft: Radius.elliptical(5, 5),
                                    bottomRight: Radius.elliptical(5, 5),
                                    bottomLeft: Radius.elliptical(5, 5),
                                  )
                              ),
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                              height: 50,
                              width: MediaQuery.of(context).size.width*0.6,
                              clipBehavior: Clip.hardEdge,
                            ),


                          ],
                        ),
                      ),
                    ),
                    Container(height: 20,)
                  ],
                ),

                Positioned.fill(
                    bottom: -200,
                    child: Align(

                        alignment:Alignment.center ,
                        child:  InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Home(infoCar: {"name":widget.name,
                              "num":widget.num,
                              "asset":widget.asset,
                              "barCode":widget.barCode,
                            },index: widget.index)));
                          },
                          child: Stack(
                            children: [
                              CustomPaint(
                                size: Size(200, (200*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                                painter: RPSCustomPainter(),
                              ),
                              Positioned.fill(child: Center(child: Text("Select",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)))
                            ],               ),
                        )

                    )
                )
              ],
            ),

          ],
        ),
        Positioned.fill(

          top:-MediaQuery.of(context).size.height*0.10,
          child: Align(
            alignment: Alignment.topCenter,

            child: SizedBox(
                height: 210,
                child: Hero(
                    tag: '${widget.index}',
                    child: Image(image: AssetImage(widget.asset)))),
          ),
        ),
      ],
    );
  }
}
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.2651000,size.height*0.3968000);
    path_0.cubicTo(size.width*0.2275000,size.height*0.4374000,size.width*0.2183000,size.height*0.5698000,size.width*0.2657000,size.height*0.6024000);
    path_0.cubicTo(size.width*0.3118000,size.height*0.6342000,size.width*0.5123000,size.height*0.6419000,size.width*0.5123000,size.height*0.6419000);
    path_0.cubicTo(size.width*0.5123000,size.height*0.6419000,size.width*0.7277000,size.height*0.6248000,size.width*0.7609000,size.height*0.5944000);
    path_0.cubicTo(size.width*0.8023000,size.height*0.5564000,size.width*0.7970000,size.height*0.4164000,size.width*0.7592000,size.height*0.3955000);
    path_0.cubicTo(size.width*0.7083000,size.height*0.3673000,size.width*0.5122000,size.height*0.3407000,size.width*0.5122000,size.height*0.3407000);

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xffa68e17).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width*0.2656000,size.height*0.3967000);
    path_1.cubicTo(size.width*0.3103000,size.height*0.3637000,size.width*0.5115000,size.height*0.3376000,size.width*0.5126000,size.height*0.3417000);

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = Color(0xffa68e17).withOpacity(1.0);
    canvas.drawPath(path_1,paint_1_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}