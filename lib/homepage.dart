import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:testing_work121/controller.dart';
import 'package:testing_work121/testing.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var mobilenumber;


  var searchText;

  final CollectionReference _DesignationDetails = FirebaseFirestore.instance.collection("DesignationDetails");

  @override
  Widget build(BuildContext context) {
    // var container = AppStateContainer.of(context);
    // var appState = container.state;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFF095F2B),
        title: Text(
          "Contacts",
          style: TextStyle(
              fontFamily: 'Poppins', color: Colors.white, fontSize: 22),
        ),
        elevation: 2,
      ),
      backgroundColor: Color(0xFFF1F1F1),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: DefaultTabController(
               length: 2,
              //initialIndex: 0,
              child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.grey,
                    labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    indicatorColor: Colors.grey,
                    tabs: [
                      Tab(
                        text: 'Contacts',
                      ),
                      Tab(
                        text: 'Logs',
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 1,
                      child: TabBarView(
                          children: [
                            Center(key: ValueKey('1'),
                                child: Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 0),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: TextField(
                                            //controller: searchText,
                                            onChanged: (val)
                                            {
                                              setState(()
                                              {
                                                searchText=val;
                                              });
                                            },

                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Search',
                                              labelStyle: TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF82878C),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              hintText: 'Find designation',
                                              hintStyle: TextStyle(
                                                fontFamily: 'Lexend Deca',
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.grey.shade300,
                                                  width: 1,
                                                ),
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10),
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide:
                                                BorderSide(
                                                  color: Colors.grey,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                BorderRadius.only(topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10),
                                                ),
                                              ),
                                            ),
                                            style: TextStyle(fontFamily: 'Lexend Deca',
                                              color: Color(0xFF151B1E),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        MakingList()
                                      ],
                                    ),
                                  ),
                                ),
                            ),





                           //log page data



                            Center(key: ValueKey('2'),


                                child: Text("hi log")),









                          ],
                      ),
                  ),
                  // Container(height: 55,
                  // decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),border: Border.all(color: Colors.blue)),
                  // child: TextField(
                  //   decoration: InputDecoration(hintText: "Search",border: InputBorder.none),
                  //
                  // ),
                  //
                  // ),
                  //MakingList(),
//            Expanded(
//              flex: 160,
//              child: StreamBuilder(stream: _DesignationDetails.snapshots(),
//       builder: (context , AsyncSnapshot<QuerySnapshot> streamsnapshot) {
//         if (streamsnapshot.hasData)
//         {
//           return ListView.builder(
//               //physics: NeverScrollableScrollPhysics(),
//               //scrollDirection: Axis.vertical,
//               shrinkWrap: true ,
//               itemCount: streamsnapshot.data!.docs.length,
//               itemBuilder: (context,index)
//               {
//
//                 final DocumentSnapshot documentsnapshot=streamsnapshot.data!.docs[index];
//                 mobilenumber=documentsnapshot["DefaultMobile"];
//                 String number;
//                 return Card(
//                   child: Column(
//                     children: [
//                       ListTile(
//                         leading: CircleAvatar(child: Icon(Icons.person,))
//                         ,title: Text(documentsnapshot['DesignationName']),
//                         subtitle:Container(
//                           alignment: Alignment.topLeft
//                           ,child: Column(
//                             children: [
//                               Container(
//                                   margin:EdgeInsets.only(top: 5,),
//                                   alignment: Alignment.topLeft,
//                                   child: Text(documentsnapshot["NpName"])),
//                               Container(
//                                   margin:EdgeInsets.only(top: 5,),
//                                   alignment: Alignment.topLeft,
//                                   child: Text(documentsnapshot["DefaultMobile"])),
//                               Container(
//                                   margin:EdgeInsets.only(top: 5,),
//                                   alignment: Alignment.topLeft,
//                                   child: Text(documentsnapshot["OrganizationName"])),
//                               Container(
//                                   margin:EdgeInsets.only(top: 5,),
//                                   alignment: Alignment.topLeft,
//                                   child: Text(documentsnapshot["district"])),
//                             ],
//                           ),
//                         ),
//                         // Column(
//                         //   children: [
//                         //
//                         //     Text(documentsnapshot["NpName"]),
//                         //     Text(documentsnapshot["DefalutMobile"]),
//                         //     Text(documentsnapshot["OrganizationName"]),
//                         //     Text(documentsnapshot["district"]),
//                         //
//                         //     Row(
//                         //       children: [
//                         //         IconButton(onPressed: (){}, icon: Icon(Icons.sms)),
//                         //         IconButton(onPressed: (){}, icon: Icon(Icons.whatsapp)),
//                         //         IconButton(onPressed: (){}, icon: Icon(Icons.call)),
//                         //       ],
//                         //     ),
//                         //   ],
//                         // ),
//
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//
//                           // Text(documentsnapshot["NpName"]),
//                           // Text(documentsnapshot["DefaultMobile"]),
//                           // Text(documentsnapshot["OrganizationName"]),
//                           // Text(documentsnapshot["district"]),
//
//
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween
//                      , children: [
//                        Container(width: 20,),
//                         IconButton(onPressed: ()
//                         {
// launchUrl(Uri.parse("sms://${mobilenumber}"));
//                         },
//
//                             icon: Icon(Icons.sms,size:40,)),
//                         IconButton(onPressed: () async => await launch(
//                             "https://wa.me/${number="+91${mobilenumber}"}?text=Hello"),
//                        // {
//                           //launchUrl(Uri.parse("tel://${mobilenumber}"));
//                        // },
//
//                             icon: Icon(Icons.whatsapp,size: 40,)),
//                         IconButton(
//                             icon: Icon(Icons.call,size: 40,),
//                         onPressed: (){
//                           launchUrl(Uri.parse("tel://${mobilenumber}"));
//                         },
//                         ),
//                   Container(width: 20,),
//                       ],
//                     ),
//
//
//                     ],
//                   ),
//               ]
//                   )
//                 );
//               },
//           );
//         }
//         return Center(child: CircularProgressIndicator(),);
//       },
//     ),
//            ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

Widget  MakingList() {

   return Expanded(
     flex: 399,
     child: StreamBuilder(stream: 
     
     _DesignationDetails.snapshots(),
      builder: (context , AsyncSnapshot<QuerySnapshot> streamsnapshot)
      {
        if (streamsnapshot.hasData)
        {
          return ListView.builder(
            //physics: NeverScrollableScrollPhysics(),
            //scrollDirection: Axis.vertical,
            shrinkWrap: true ,
            itemCount: streamsnapshot.data!.docs.length,
            itemBuilder: (context,index)
            {

              final DocumentSnapshot documentsnapshot=streamsnapshot.data!.docs[index];
              mobilenumber=documentsnapshot["DefaultMobile"];
              String number;
              return Card(
                  child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(child: Icon(Icons.person,))
                          ,title: Text(documentsnapshot['DesignationName']),
                          subtitle:Container(
                            alignment: Alignment.topLeft
                            ,child: Column(
                            children: [
                              Container(
                                  margin:EdgeInsets.only(top: 5,),
                                  alignment: Alignment.topLeft,
                                  child: Text(documentsnapshot["NpName"])),
                              Container(
                                  margin:EdgeInsets.only(top: 5,),
                                  alignment: Alignment.topLeft,
                                  child: Text(documentsnapshot["DefaultMobile"])),
                              Container(
                                  margin:EdgeInsets.only(top: 5,),
                                  alignment: Alignment.topLeft,
                                  child: Text(documentsnapshot["OrganizationName"])),
                              Container(
                                  margin:EdgeInsets.only(top: 5,),
                                  alignment: Alignment.topLeft,
                                  child: Text(documentsnapshot["district"])),
                            ],
                          ),
                          ),
                          // Column(
                          //   children: [
                          //
                          //     Text(documentsnapshot["NpName"]),
                          //     Text(documentsnapshot["DefalutMobile"]),
                          //     Text(documentsnapshot["OrganizationName"]),
                          //     Text(documentsnapshot["district"]),
                          //
                          //     Row(
                          //       children: [
                          //         IconButton(onPressed: (){}, icon: Icon(Icons.sms)),
                          //         IconButton(onPressed: (){}, icon: Icon(Icons.whatsapp)),
                          //         IconButton(onPressed: (){}, icon: Icon(Icons.call)),
                          //       ],
                          //     ),
                          //   ],
                          // ),

                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            // Text(documentsnapshot["NpName"]),
                            // Text(documentsnapshot["DefaultMobile"]),
                            // Text(documentsnapshot["OrganizationName"]),
                            // Text(documentsnapshot["district"]),



                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween
                              , children: [
                              Container(width: 20,),
                              IconButton(onPressed: ()
                              {
                                launchUrl(Uri.parse("sms://${mobilenumber}"));
                              },

                                  icon: Icon(Icons.sms,size:40,)),
                              IconButton(onPressed: () async => await launch(
                                  "https://wa.me/${number="+91${mobilenumber}"}?text=Hello"),
                                  // {
                                  //launchUrl(Uri.parse("tel://${mobilenumber}"));
                                  // },

                                  icon: Icon(Icons.whatsapp,size: 40,)),
                              IconButton(
                                icon: Icon(Icons.call,size: 40,),
                                onPressed: (){
                                  launchUrl(Uri.parse("tel://${mobilenumber}"));
                                },
                              ),
                              Container(width: 20,),
                            ],
                            ),


                          ],
                        ),
                      ]
                  )
              );
            },
          );
        }
        return Center(child: CircularProgressIndicator(),);
      },
  ),
   );
}














Widget searching()
{


  return Expanded(
    flex: 399,
    child: StreamBuilder(stream: (searchText != "" && searchText != null) ? FirebaseFirestore.instance.collection
      ("DesignationDetails").where("searchkeyword",arrayContains:searchText).snapshots(): FirebaseFirestore.instance.collection("DesignationDetails").snapshots(),
    builder:(context , snapshot)
    {
      return (snapshot.connectionState== ConnectionState.waiting) ? Center(child:CircularProgressIndicator()) :

    // _DesignationDetails.snapshots(),
    //   builder: (context , AsyncSnapshot<QuerySnapshot> streamsnapshot)
    //   {
    //     if (streamsnapshot.hasData)

           ListView.builder(
            //physics: NeverScrollableScrollPhysics(),
            //scrollDirection: Axis.vertical,
            shrinkWrap: true ,
           // itemCount: snapshot.data!.docs.length,
           //  itemCount: snapshot.data!.l,
            itemBuilder: (context,index)
            {

              final DocumentSnapshot documentsnapshot=snapshot.data!.docs[index];
              mobilenumber=documentsnapshot["DefaultMobile"];
              String number;
              return Card(
                  child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(child: Icon(Icons.person,))
                          ,title: Text(documentsnapshot['DesignationName']),
                          subtitle:Container(
                            alignment: Alignment.topLeft
                            ,child: Column(
                            children: [
                              Container(
                                  margin:EdgeInsets.only(top: 5,),
                                  alignment: Alignment.topLeft,
                                  child: Text(documentsnapshot["NpName"])),
                              Container(
                                  margin:EdgeInsets.only(top: 5,),
                                  alignment: Alignment.topLeft,
                                  child: Text(documentsnapshot["DefaultMobile"])),
                              Container(
                                  margin:EdgeInsets.only(top: 5,),
                                  alignment: Alignment.topLeft,
                                  child: Text(documentsnapshot["OrganizationName"])),
                              Container(
                                  margin:EdgeInsets.only(top: 5,),
                                  alignment: Alignment.topLeft,
                                  child: Text(documentsnapshot["district"])),
                            ],
                          ),
                          ),
                          // Column(
                          //   children: [
                          //
                          //     Text(documentsnapshot["NpName"]),
                          //     Text(documentsnapshot["DefalutMobile"]),
                          //     Text(documentsnapshot["OrganizationName"]),
                          //     Text(documentsnapshot["district"]),
                          //
                          //     Row(
                          //       children: [
                          //         IconButton(onPressed: (){}, icon: Icon(Icons.sms)),
                          //         IconButton(onPressed: (){}, icon: Icon(Icons.whatsapp)),
                          //         IconButton(onPressed: (){}, icon: Icon(Icons.call)),
                          //       ],
                          //     ),
                          //   ],
                          // ),

                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            // Text(documentsnapshot["NpName"]),
                            // Text(documentsnapshot["DefaultMobile"]),
                            // Text(documentsnapshot["OrganizationName"]),
                            // Text(documentsnapshot["district"]),



                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween
                              , children: [
                              Container(width: 20,),
                              IconButton(onPressed: ()
                              {
                                launchUrl(Uri.parse("sms://${mobilenumber}"));
                              },

                                  icon: Icon(Icons.sms,size:40,)),
                              IconButton(onPressed: () async => await launch(
                                  "https://wa.me/${number="+91${mobilenumber}"}?text=Hello"),
                                  // {
                                  //launchUrl(Uri.parse("tel://${mobilenumber}"));
                                  // },

                                  icon: Icon(Icons.whatsapp,size: 40,)),
                              IconButton(
                                icon: Icon(Icons.call,size: 40,),
                                onPressed: (){
                                  launchUrl(Uri.parse("tel://${mobilenumber}"));
                                },
                              ),
                              Container(width: 20,),
                            ],
                            ),


                          ],
                        ),
                      ]
                  )
              );
            },
          );
        }
       // return Center(child: CircularProgressIndicator(),);

  )
  );

}





Widget Making()
{
  GetBuilder<DataController>(
    init: DataController(),
  )
}






}
