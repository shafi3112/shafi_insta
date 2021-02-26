import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_basic_feed/bloclike/themecolors.dart';
import 'package:instagram_basic_feed/model/post.dart' ;
import 'package:instagram_basic_feed/screen/messagescreen.dart';
import 'package:instagram_basic_feed/screen/msg.dart';
import 'package:instagram_basic_feed/screen/viewpost.dart' ;
import 'package:instagram_basic_feed/searchpage.dart';
import 'package:instagram_basic_feed/bloclike/theme_bloc.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  bool _isThemeSwitch = false;
  Widget _buildPost(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: double.infinity,
        height: 560.0,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
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
                            image: AssetImage(posts[index].authorImageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      posts[index].authorName,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    subtitle: Text(posts[index].timeAgo,
                        style: Theme.of(context).textTheme.bodyText2),

                    trailing: PopupMenuButton<String>(itemBuilder: (BuildContext context){
                      return [
                        PopupMenuItem(child: Text("Report"), value: "Report",),
                        PopupMenuItem(child: Text("Post Notification"), value: "Post Notification",),
                        PopupMenuItem(child: Text("Copy Link"), value: "Copy Link",),
                        PopupMenuItem(child: Text("Unfollow"), value: "Unfollow",),
                        PopupMenuItem(child: Text("Mute"), value: "Mute",),
                      ];
                    }),
                  ),
                  InkWell(
                    onDoubleTap: () => print('Like post'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ViewPostScreen(
                            post: posts[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      width: double.infinity,
                      height: 400.0,
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 5),
                            blurRadius: 8.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(posts[index].imageUrl),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.favorite_border),
                                  iconSize: 30.0,
                                  color: Colors.blueGrey,
                                  onPressed: () => print('Like post'),
                                ),
                                Text(
                                  '0',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                            SizedBox(width: 20.0),
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.comment_bank_sharp),
                                  color: Colors.blueGrey,
                                  iconSize: 30.0,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ViewPostScreen(
                                          post: posts[index],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Text(
                                  '22',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.bookmark_border),
                          iconSize: 30.0,
                          onPressed: () => print('Save post'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Shafi\'s Media',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'times new roman',
                    fontSize: 20.0,
                  ),
                ),
             Row(
                  children: <Widget>[
                    Switch(
                      value: _isThemeSwitch,

                      onChanged: (val) {
                        if(_isThemeSwitch){
                          BlocProvider.of<AppThemeBloc>(context).add(AppThemeEvent(
                              theme: AppTheme.lightTheme

                          ));
                        }
                        else {
                          BlocProvider.of<AppThemeBloc>(context).add(AppThemeEvent(
                              theme: AppTheme.darkTheme
                          ));
                        }
                        _isThemeSwitch = val;
                        setState(() {

                        });
                      },

                    ),
                  /*IconButton(
                      icon: Icon(Icons.delivery_dining),
                      iconSize: 30.0,
                      onPressed: () => print('Reels'),
                    ),*/
                    SizedBox(width: 16.0),
                    Container(
                      width: 35.0,
                      child: IconButton(
                        icon: Icon(Icons.message_rounded),
                        iconSize: 30.0,
                        color: Colors.blueGrey,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => messagescr(
                                msg: messages[0],
                              ),
                            ),
                          );

                        }
                    ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return SizedBox(width: 10.0);
                }
                return Container(
                  margin: EdgeInsets.all(10.0),
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
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
                        height: 60.0,
                        width: 60.0,
                        image: AssetImage(stories[index - 1]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          _buildPost(0),
          _buildPost(1),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dynamic_feed_sharp,
                size: 30.0,
                color: Colors.black,
              ),
              title: Text('Feed'),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.all(5.0),
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  iconSize: 30.0,
                  color: Colors.black,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SearchPage(),
                      ),
                    );
                  },
                ),
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: Color(0xFF23B66F),
                  onPressed: () => print('Upload photo'),
                  child: Icon(
                    Icons.add,
                    size: 30.0,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
              title: Text(''),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                size: 30.0,
                //color: Theme.of(context).accentColor,
              ),
              title: Text('Likes'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 30.0,
                //color: Theme.of(context).accentColor,
              ),
              title: Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
