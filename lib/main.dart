import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Electrowave',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyLoginPage(title: 'Login'),
      routes: <String, WidgetBuilder> {
        '/LoginScreen': (BuildContext context) => new MyLoginPage(),
        '/MyComplaints': (BuildContext context) => new MyComplaints(),
        '/MyHomePage': (BuildContext context) => new MyHomePage()
      },

    );
  }
}

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {


    final numberField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Number",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(

        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          navigateToHomePage(context);
          // navigateToSubPage(context);
        },
        // child: Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: AssetImage('assets/login_button.png'), fit: BoxFit.cover),
        //   ),
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );



    final signup = FlatButton(
      child: Text('Register Now'),
      color: Colors.white,
      onPressed: () {
        navigateToRegisterPage(context);
        // print("FlatButton tapped");
      },
    );





    return Scaffold(
      body: Center(

        child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 200.0,
                  child: Image.asset(
                    "assets/electroware_logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 25.0),
                numberField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButton,
                SizedBox(
                  height: 0.0,
                ),
                signup,
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }

  Future navigateToHomePage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  Future navigateToRegisterPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyRegisterPage()));
  }

}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DashBoard"),
      centerTitle: true,
      ),
      drawer: HomeDrawer(),
      // appBar: AppBar(
      //   title: Text("DashBoard"),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Click button to back to Main Page'),
            RaisedButton(
              textColor: Colors.white,
              color: Color(0xff01A0C7),
              child: Text('Back to Main Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/LoginScreen');
                // TODO
              },
            )
          ],
        ),
      ),
    );
  }
}


class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: ListView(
        children: <Widget>[
          Container(padding: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 8),
            // color: HexColor("#31343E"),
            color: Colors.white,
            child:Column(children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset("assets/electroware_logo.png", width: 180, height: 80, fit: BoxFit.fill,),
              ),
              SizedBox(width: 8,),
              RichText(text: TextSpan(children: [
                TextSpan(text: "Electroware\n\n", style: TextStyle(fontSize:16, fontWeight: FontWeight.bold, fontFamily: 'Montserrat', color: Colors.black87)),
                TextSpan(text: "03229766208\n", style: TextStyle(fontSize:18, fontWeight: FontWeight.bold, fontFamily: 'Montserrat', color: Colors.black)),
                TextSpan(text: "Admin Test\n", style: TextStyle(fontSize:18, fontWeight: FontWeight.bold, fontFamily: 'Montserrat', color: Colors.black)),
              ]),),
            ],),
          ),
          Divider(height: 1, thickness: 1, color: Colors.grey[400]),
          Container(
            padding: EdgeInsets.only(top: 10),
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(children: <Widget>[
              ListTile(
                dense: true,
                title: Text("My Complaints", style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.star),

                onTap: (){
                  Navigator.pushNamed(context, '/MyComplaints');
                }

              ),
              ListTile(
                dense: true,
                title: Text("Service Tickets", style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.event_available),
                onTap: (){},
              ),
              ListTile(
                title: Text("Service List", style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.event_note),
                onTap: (){
                  Navigator.pushNamed(context, "/notifications");
                },
              ),
              ListTile(
                dense: true,
                title: Text("Products", style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.shopping_basket),
                onTap: (){
                  Navigator.pushNamed(context, "/settings");
                },
              ),

              ListTile(
                dense: true,
                title: Text("Users", style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.people),
                onTap: (){
                  Navigator.pushNamed(context, "/settings");
                },
              ),
              ListTile(
                dense: true,
                title: Text("About Us", style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.help_outline),
                onTap: (){
                  Navigator.pushNamed(context, "/settings");
                },
              ),
              ListTile(
                dense: true,
                title: Text("Contact Us", style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.call),
                onTap: (){
                  Navigator.pushNamed(context, "/settings");
                },
              ),
              ListTile(
                dense: true,
                title: Text("Logout", style: TextStyle(color: Colors.black),),
                leading: Icon(Icons.exit_to_app),
                onTap: (){
                  Navigator.of(context).pushNamedAndRemoveUntil('/LoginScreen', (Route<dynamic> route) => false);
                },
              ),

            ],),
          ),
        ]
    )
    );


  }
}

class MyComplaints extends StatefulWidget {
  @override
  _MyComplaintsState createState() => _MyComplaintsState();

}

class _MyComplaintsState extends State<MyComplaints> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Color(0x44000000),
            elevation: 0,
            centerTitle: true,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  child: Text('My Complaints', style: TextStyle(color: Colors.black)),
                ),
                Tab(
                  child: Text('New Complaint', style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
            title: Text('COMPLAINTS'),
          ),
          body: TabBarView(
            children: [
              ComplaintList(),
              ComplaintList(),

            ],
          ),
        ),
      ),
    );
  }
}

class ComplaintList extends StatefulWidget {
  @override
  _ComplaintListState createState() => _ComplaintListState();

}

class _ComplaintListState extends State<ComplaintList> {

  List names=["Usama Shahid", "Furqan Ahmed", "Haider Chaudhary", "Hamza Alam", "Ahmed Ali", "Maryum Arshad", "Khizra Shan", "Soha Shakeel",];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body: ListView.builder(

      itemCount: names.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 55.0,
                  height: 55.0,
                  color: Colors.green,
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.green,
                    backgroundImage: NetworkImage
                      ("https://www.vectorstock.com/royalty-free-vector/social-network-boy-vector-792780"),

                  ),

                ),
                SizedBox(width: 5.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(names[index], style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold)),
                  ],

                ),
              ],
            ),
          ),
      ),
      ),

    ),
    );
  }
}


class MyRegisterPage extends StatefulWidget {
  @override
  _MyRegisterPageState createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  @override
  Widget build(BuildContext context) {

    final textsignup = FlatButton(
      child: Text('REGISTER AS CUSTOMER',
        style: TextStyle(fontSize: 24),
      ),
      textColor: Color(0xff01A0C7),
      onPressed: () {
        // print("FlatButton tapped");
      },
    );

    final nameField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Name",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final numberField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Number",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final registerButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.pop(context);
          // navigateToSubPage(context);
        },
        child: Text("REGISTER",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final backlogin = FlatButton(
      child: Text('Login Now?'),
      color: Colors.white,
      onPressed: () {
        Navigator.pop(context);
        // navigateToRegisterPage(context);
        // print("FlatButton tapped");
      },
    );





    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  SizedBox(height: 25.0),
                  textsignup,
                  SizedBox(height: 45.0),
                  nameField,
                  SizedBox(height: 25.0,),
                  numberField,
                  SizedBox(height: 25.0,),
                  passwordField,
                  SizedBox(
                    height: 35.0,
                  ),
                  registerButon,
                  SizedBox(
                    height: 0.0,
                  ),
                  backlogin,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);