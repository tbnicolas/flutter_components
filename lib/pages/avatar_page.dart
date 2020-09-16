import 'package:flutter/material.dart';
class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: new CircleAvatar(
              backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1018943227791982592/URnaMrya.jpg'),
              radius: 25.0,
            ),
          ),
          new Container(
            margin:EdgeInsets.only(right: 10.0),
            child: new CircleAvatar(
              child: new Text('SL'),
              backgroundColor: Colors.brown,
            ),
          ),
        ],
      ),
      body: new Center(
        child: new FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: new Duration(milliseconds: 200),
          image: new NetworkImage('https://s.france24.com/media/display/cb8f406c-1f48-11e9-8238-005056bff430/w:1240/p:16x9/stan_lee.jpg')

        ),
      ),
    );
  }
}
