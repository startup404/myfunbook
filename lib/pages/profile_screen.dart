import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:myfunbook/controllers/auth_controller.dart';
import 'package:myfunbook/controllers/profile_controller.dart';

class profile extends StatefulWidget
{
  @override
  _profilestate createState()=> _profilestate();
}

class _profilestate extends State<profile>
{
  TextEditingController _name =TextEditingController();
  TextEditingController _email =TextEditingController();
  TextEditingController _mobile =TextEditingController();
  final currentuser = FirebaseAuth.instance.currentUser!;
  String UidToFetch = '';
  bool isUpdateButtonEnabled = false;
  FocusNode _focusNodename = FocusNode();
  FocusNode _focusNodeemail = FocusNode();
  FocusNode _focusNodemobile = FocusNode();
  DatabaseReference dref = FirebaseDatabase.instance.ref().child('User Details');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UidToFetch = currentuser.email!.split('@')[0].toString();
    dref = dref.child(UidToFetch);
    print(UidToFetch);

    dref.onValue.listen((DatabaseEvent event){
      if(event.snapshot.value != null){
        Map<Object?, Object?>? userData = event.snapshot.value as Map<Object?, Object?>?;
        _name.text = userData!['Username' as Object] as String;
        _email.text = userData['email'as Object] as String;
        _mobile.text = userData['mobile' as Object] as String;
      }
    } );
  }
  

  @override
  Widget build(BuildContext context)
  {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Container(
              height: 120,width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))
              ),
            ),
            Obx((){return
            Padding(
              padding: EdgeInsets.only(top: 200),
              child:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  

                  const SizedBox(height: 10,),
                  Padding(padding: EdgeInsets.only(top: 20,left: 80),
                  child: Text("Name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 20.0),
                  child:TextFormField(
                    focusNode: _focusNodename,
                    readOnly: profilecontroller.instance.isnameEdit.value,
                    controller: _name,
                    style: TextStyle(color:Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon:Padding(padding: EdgeInsets.only(right:10.0),child: Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(Icons.person_outlined,
                        color: Colors.black),
                      )),
                      
                      suffixIcon: GestureDetector(
                        onTap: (){
                          _focusNodename.requestFocus();
                          profilecontroller.instance.togglenameEdit();
                          isUpdateButtonEnabled=true;
                        },
                      child:Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(Icons.edit_outlined,
                        color: Colors.black),
                      ))
                    ),
                  )),

                  const SizedBox(height: 10,),

//Email Id Text Form Field-2...

                  Padding(padding: EdgeInsets.only(top: 20,left: 80),
                  child: Text("Email",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 20.0),
                  child:TextFormField(
                    focusNode: _focusNodeemail,
                    readOnly: profilecontroller.instance.isemailEdit.value,
                    controller: _email,
                    style: TextStyle(color:Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon:Padding(padding: EdgeInsets.only(right: 10.0),child:Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(Icons.email_outlined,
                        color: Colors.black),
                      )),
                      suffixIcon:GestureDetector(onTap:(){
                        _focusNodeemail.requestFocus();
                        profilecontroller.instance.toggleemailEdit();
                          isUpdateButtonEnabled=true;
                      },
                      child:Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(Icons.edit_outlined,
                        color: Colors.black),
                      ))
                    ),
                  )),
                  const SizedBox(height: 10,),

//Mobile Number Text Form Field-3...

                  Padding(padding: EdgeInsets.only(top: 20,left: 80),
                  child: Text("Mobile",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 20.0),
                  child:TextFormField(
                    focusNode: _focusNodemobile,
                    readOnly: profilecontroller.instance.ismobileEdit.value,
                    controller: _mobile,
                    style: TextStyle(color:Colors.black),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon:Padding(padding:EdgeInsets.only(right: 10.0) ,child:Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(Icons.phone_android_outlined,
                        color: Colors.black),
                      )),
                      suffixIcon:GestureDetector(onTap:(){
                        _focusNodemobile.requestFocus();
                        profilecontroller.instance.togglemobileEdit();
                          isUpdateButtonEnabled=true;
                      },
                      child:Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(Icons.edit_outlined,
                        color: Colors.black),
                      ))
                    ),
                  ),),

                 const SizedBox(height: 10,),

//Update button...

                 Padding(padding: EdgeInsets.symmetric(horizontal:25 ,vertical:5),

                  child: ElevatedButton(
                              onPressed:isUpdateButtonEnabled?(){
                                dref.update({'Username':_name.text , 'email':_email.text , 'mobile':_mobile.text}).then((_) {
              // Update successful, disable editing mode
              setState(() {
                isUpdateButtonEnabled = false;
              });
              profilecontroller.instance.getsuccesssnackbar("Updated Successfully");
            }).catchError((error) {
              // Handle update error, e.g., show an error message
              print("Error updating name: $error");
              profilecontroller.instance.geterrorsnackbar("Update Failed", error);
            });
            profilecontroller.instance.isnameEdit=true.obs;
            profilecontroller.instance.isemailEdit=true.obs;
            profilecontroller.instance.ismobileEdit=true.obs;

            }:null,

                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                                  
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.all(12),
                                child: Text(
                                  "Update",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              )),
                            )),





                  const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),

                    const Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text('DOCUMENTATION'),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListTile(
                        leading: const Icon(
                          Icons.privacy_tip_outlined,
                          size: 20,
                        ),
                        title: const Text(
                          'Privacy Policy',
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {},
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListTile(
                        leading: const Icon(
                          Icons.share,
                          size: 20,
                        ),
                        title: const Text(
                          'Share',
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {},
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ListTile(
                        leading: const Icon(
                          Icons.logout_outlined,
                          size: 20,
                          color: Colors.red,
                        ),
                        title: const Text(
                          'Logout',
                          style: TextStyle(color: Colors.red),
                        ),
                        onTap: () {
                          authcontroller.instance.signout();
                        },
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    )
 
                ],
              ),)
            );}),

            Positioned(
              top:60,
               left: MediaQuery.of(context).size.width*0.5-60,
              child: 
            Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white,width: 3),
                        borderRadius: BorderRadius.circular(60)
                      ),
                      child:ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                      child: Image.asset("assets/images/user_icon.jpg",height: 120,width: 120,),)
                    ),
                  ),),


            // Positioned(
            //   top: 140,
            //   left: MediaQuery.of(context).size.width*0.5+20,
            //   child:Container(
            //     height: 50,width: 50,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(25),
            //       color: Colors.black
            //     ),
            //     child: Icon(
            //       Icons.camera_alt,
            //       color: Colors.white,
            //     ),
            //
            //   ),
            // )
          ],
        ),
      ),

    );
  }
}