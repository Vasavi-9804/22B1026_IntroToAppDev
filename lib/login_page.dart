import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget{
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Container(
        width : double.infinity,
        height:double.infinity,
        child: Container(
          margin:EdgeInsets.only(top:200),
          width:double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10,vertical:20),

          child:Column(
            children: [
              Container(
                child: Text('USER LOGIN',style:TextStyle(color:Colors.black87,fontSize: 26,fontWeight: FontWeight.bold),),
              ),
              Container(
                  width:double.infinity,
                padding: EdgeInsets.symmetric(horizontal:14,vertical:28),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        //color: Colors.white,
                        child: Icon (
                          Icons.account_circle_rounded,
                          color: Colors.grey[700],
                          size: 150.0,
                        )
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      width:double.infinity,
                      height:55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            suffixIcon:Icon(Icons.email_outlined,color:Colors.grey[600]) ,
                            hintText: 'Email ID',
                            hintStyle: TextStyle(color:Colors.grey[600]),
                            border: InputBorder.none

                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      width:double.infinity,
                      height:55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          suffixIcon:Icon(Icons.visibility,color:Colors.grey[600]) ,
                          hintText: 'Password',
                          hintStyle: TextStyle(color:Colors.grey[600]),
                          border: InputBorder.none

                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                    ),
                    Container(
                      width:double.infinity,
                      height:55,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[300],
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Center(child:Text('LOGIN',style:TextStyle(fontSize:22,fontWeight: FontWeight.bold),),),
                    )
                  ],
                )
                ,
              )
            ],
          ),
        ),
      ),
    );
  }
}
