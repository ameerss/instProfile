import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
final color=const Color(0x1a237e);
void main()=>runApp(
    new profilerun()
);
//cloths array
var pho1=[];

var c=150.0;

String address='Baghdad';
String phoneNum='0781566633';
String userName='Ameer';
var acountPhoto=null;

class profilerun extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new profile();
  }


}
class profile extends State<profilerun>{

  horezantel(){
    setState((){
      c=150.0;
    });
  }
  vertical(){
    setState((){
      c=600.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.lightBlueAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cloths Shop'),),
        body: Container(
          padding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //profile info
              new Container(
                height: 120.0,
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 10.0),
                color: Colors.white,
                child:  ListTile(
                  //عرض اسم المستخدم وصوره المستخدم
                  leading:Column(children: <Widget>[
                    InkWell(child: CircleAvatar(
                      radius: 28.4,
                      backgroundImage: proImg() ,
                    ), onTap: ()=>profileImg(),),

                    Text(userName,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w800),)
                  ],),
//العنوان والرقم
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(address,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500),),
                      Text(phoneNum,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500),),

                    ],) ,

                ),

              ),
//تغيير طريقه عرض الصور
              new Container(
                color: Colors.white,
                height: 32.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.apps),onPressed: horezantel,),
                    IconButton(icon: Icon(Icons.dehaze),onPressed: vertical,),
                  ],),),
//الكونتينر خاص بعرض الصور في الكرد فيو
              new  Container(
                height: 356.0,
                color: Colors.black12,
                child: GridView.extent(

                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0,
                  maxCrossAxisExtent:c,
                  padding: EdgeInsets.all(1.0),
                  children: photos(),

                )
                ,





              ),

            ],

          )  ,

        ),
        bottomNavigationBar: new Container(
          color: Colors.white,
          height: 50.0,
          child: new BottomAppBar(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new IconButton(icon: Icon(Icons.home),onPressed: null,),
                new IconButton(icon: Icon(Icons.add_box),onPressed:()=> getimage(),),
                new IconButton(icon: Icon(Icons.search),onPressed: null,),

              ],

            ),

          ),

        ),
      ),
    );


//

  }
  //تستخدم لعرض الصور في الكرد فيو
  photos() {
    List<Container> content=new List<Container>.generate(pho1.length,
            (int index){
          var img= pho1[index];
          return new Container(
            height: 150.0,
            width: 150.0,
            child: new Image(image: FileImage(img),fit: BoxFit.cover,),
          );
        }
    );
    return content;

  }
  //يخص صوره الادمن
  proImg(){
    var phot;
    if(acountPhoto ==null){
      phot=NetworkImage('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAn1BMVEX///9UxfgBV5sptvZOw/hmyvnd8v2lu9O65fzY8P1FwvhKwvgATZYAUZjx+v77/f4Asfbn9v4uaqXR7f3M2OYBU5QARZMZtPYosO4BUI4AK0wAI0EBWJ0BUI8BR34BTIcBQXQEKkUBPm4GSHoANmC6y94XYKAAMVcANHoDJ0DM0tkApOUBN2EBP3A9aJEAP3wsY5kFNVgAJ0kFPGUAOmo/syMAAAADdUlEQVR4nO3b63bSQBSGYQq0WtRWrNQhhSQFFA/1UJv7vzYngVqgyRxdzN7b77uArDzr3TS/2uthGIZhGIZhmH1nL2N2lfr17TsfvQrf6PQy9ftbdz46Cd9QPjD169uHgihIfCiIgsQHoBmIE00+FERB4kNBFCQ+AM1AnGjyoSAKEh8KoiDxAWgG4kSTDwVRkPhQEAWJD0AzECeafCiIgsSHgihIfACagTjR5ENBFCQ+FERB4gPQDMSJJh8KoiDxoSAKEh+AZiBONPlQEAWJDwVRkPgANANxosmHgihIfCiIgsQHoBmIE00+FERB4kNBFCQ+AM3A//xEL86iRgFoLjgejmI2JgA0P3w8HEY8/OSCANBWMAY4pAA0PxwF6QPNDwfwCMBL6Sca1ZBDwSgij4IRRC4Fg4kcPvRRRE4Fg4h8foOBRG4FvYkcgV5EfifqSeRZ0IPItaAzkW9BRyKvD30AkXdBByLn36AT0VpwQB9oJFqBHwYD+kAD0XqiGhhMPCKwk+hSMJh4VGAH0a1gIPHIwFaia8Eg4tGBLUT3ggHEI3zon++A6FPQm5igYL09ol9BT2Ii4B7Rt6AXMRlwhxgCdCYmBP4l+p+oBzEpcEsMK+hITAxsiKEFnYjJgTUxuKADkQBQE8MLWolJPvSeswGNRBIFLbMDDUQpwE6iHGAHURKwlSgL2EKUBnxGlAc8IEoE7hFlfOgNRJkFd4hygVuiZGBDlA3URA7AswjgYHBKH9i7ehsBVD9Sv77LIohq+fMX/X88iSEu8+mbd4KJapnPJ33BxA2wL5eogdMaKJb4BBRKbICPQolEDSyegAKJalkW812hNKJalIW+0V2hLOIjcE8oiageyry+0QOhHKJ6qPJi2iKUQmyA7UIZRA0sO4USiOp+Veb6SDdCgUQNXNQJdcP2iNyJ6n5d1QkNQt5Ela3vrELORHX7e13pI62J044/NayJ6vZmvdoXtgLZEjUwa4TlRtjp40qsgTvCSX/WDWRJ3AC1sPpe5tO+2ceRuAHqhneLfGLTcSRugdm6nM9mTkBmxAaYZYvCVceN2ACrwvrbY0tUX25Wed8rHy/it6ya+uM4Eb9+nhu+7SKI76+DgSCSGYgggkhjIIIIIo2BCCKINAYiiCDSGIggMiG+Dt/1JxbEFzH7mPr1MQzDMAzDsH+yP1DGqIwW+XZsAAAAAElFTkSuQmCC');
    }
    else {phot=FileImage(acountPhoto);}
    return phot;
  }
  //اضافه صور منتجات
  Future getimage() async{

    var getimg=await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      pho1.add(getimg);
    });
  }
//تغيير صوره الادمن
  Future profileImg() async{

    var getimg=await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      acountPhoto=getimg;
    });
  }

}

