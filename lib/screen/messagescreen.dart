import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:instagram_basic_feed/screen/msg.dart';


class messagescr extends StatefulWidget {
  final message msg;

  messagescr({this.msg});
  @override
  _messagescrState createState() => _messagescrState();
}

class _messagescrState extends State<messagescr> with SingleTickerProviderStateMixin {
  GifController controller1;
  void initState() {
    controller1 = GifController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller1.repeat(min: 1, max: 160, period: Duration(milliseconds: 900));
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller1.dispose();
  }
  void _modalAnimation(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Theme.of(context).accentColor,
            ),
            height: 200,
            child: GifImage(
              controller: controller1,
              image: AssetImage("assets/images/sentmsg.gif"),
            ),
          );
        }
    );
  }
  Widget _buildmessage(int index) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ListTile(
        leading: Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: CircleAvatar(
            child: ClipOval(
              child: Image(
                height: 50.0,
                width: 50.0,
                image: AssetImage(messages[index].authorImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text(
          messages[index].authorName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(messages[index].text),
        trailing: IconButton(
          icon: Icon(
            Icons.message,
          ),
          color: Colors.grey,
          onPressed: () => print('Like comment'),
        ),
      ),
    );
  }


  //Original code
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Conversations",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                    Container(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.add,color: Colors.pink,size: 20,),
                          SizedBox(width: 2,),
                          Text("ADD",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ],
                ),

              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.grey.shade100
                      )
                  ),
                ),
              ),

            ),
            Container(
              child: Column(
                children: <Widget>[
                  _buildmessage(0),
                  _buildmessage(1),
                  _buildmessage(2),
                  _buildmessage(3),
                  _buildmessage(4),
                ],
              ),

            )


          ],

        ),

      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, -2),
                blurRadius: 6.0,
              ),
            ],
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                contentPadding: EdgeInsets.all(20.0),
                hintText: 'Send Message',
                prefixIcon: Container(
                  margin: EdgeInsets.all(4.0),
                  width: 48.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    child: ClipOval(
                      child: Image(
                        height: 48.0,
                        width: 48.0,
                        image: AssetImage('assets/images/shafi1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                suffixIcon: Container(
                  margin: EdgeInsets.only(right: 4.0),
                  width: 70.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.send,
                    ),
                    iconSize: 30.0,
                    color: Colors.grey,
                    onPressed: () => _modalAnimation(context),
                  ),
                ),
              ),
            ),
          ),
        ),
        )
    );
  }
}

