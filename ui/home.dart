import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController usernameCtrl ;
  TextEditingController passwordCtrl ;



  @override
  void initState() {
    usernameCtrl = TextEditingController() ;
    passwordCtrl = TextEditingController() ;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String pwd = await showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext bc) {
                bool passwordVisible = false ;
                return StatefulBuilder(

                    builder: (BuildContext context, StateSetter setState) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(50, 20, 50, 100),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16.0),
                              alignment: Alignment.centerLeft,
                              child: Text('Sign in',
                                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),),
                            ),
                            TextField(
                              textAlign: TextAlign.left,
                              controller: usernameCtrl,
                              style: TextStyle(fontSize: 16, color: Colors.black87),
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
                              decoration: InputDecoration(
                                  hintText: 'GS Regnumber',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: EdgeInsets.all(16),
                                  prefixIcon: Icon(Icons.person),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 8.0),
                              child: TextField(
                                textAlign: TextAlign.left,
                                controller: passwordCtrl,
                                style: TextStyle(fontSize: 16, color: Colors.black87),
                                keyboardType: TextInputType.text,
                                obscureText: !passwordVisible,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(50),
                                ],
                                decoration: InputDecoration(
                                    hintText: 'password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    contentPadding: EdgeInsets.all(16),
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            passwordVisible = !passwordVisible;
                                          });
                                        },
                                        icon: Icon(passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off))),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () async {
//                            var route = new MaterialPageRoute<Student>(
//                                builder: (context) => PasswordReset(type));
//                            Student student = await Navigator.of(context).push(route);
//                            if (student != null) {
//                              STUDENT = student;
//                              number.value++;
//                              Navigator.of(context).pop(student);
//                            }
                                },
                                child: Text(
                                  'forgot password?',
                                  style: TextStyle(fontWeight: FontWeight.w700, color: Theme.of(context).accentColor),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 3.0),
                                child: FlatButton(
                                  onPressed: () async {
//                              String username = usernameCtrl.text.trim();
//                              String password = passwordCtrl.text;
//                              if (username.isEmpty || password.isEmpty) return;
//                              BotToast.showCustomLoading(toastBuilder:  (cancelFunc) {
//                                return CustomLoadWidget('login processing...', cancelFunc: cancelFunc);
//                              });
//                              RequestResponse response = await login(username, password, type.toString());
//                              BotToast.closeAllLoading();
//                              if (response != null) {
//                                if(response.status){
//                                  Student st = Student.fromJson(json.decode(response.data));
//                                  saveTimeLoggedIn(response.message) ;
//                                  DBProvider.db.checkForum(st.currentSession) ;
//                                  String rg = await getLastLoggedInRegno() ;
//                                  if(rg != username){
//                                    if(st.program.program.toLowerCase().contains('regular')) {
//                                      DBProvider.db.refreshPersonalizedTables();
//                                      saveLastLoggedInRegno(username);
//                                    }
//                                  }
//                                  Navigator.of(context).pop(st) ;
//                                }else{
//                                  await showDialog(
//                                      context: context,
//                                      builder: (context) => AlertDialog(
//                                        title: Text("Notification"),
//                                        content: Text(
//                                            response.message),
//                                        actions: [
//                                          FlatButton(
//                                              child: Text('Ok'),
//                                              onPressed: () {
//                                                Navigator.of(context).pop();
//                                              }),
//                                        ],
//                                      ),
//                                      barrierDismissible: true);
//
//                                }
//                              }
                                  },
                                  padding: EdgeInsets.all(14),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: Theme.of(context).primaryColor,
                                  child: Text(
                                    'Continue',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });

              });

        },
        tooltip: 'Login',
        child: Icon(Icons.school),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
