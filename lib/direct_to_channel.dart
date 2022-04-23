import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'group_channel_view.dart';
import 'package:sendbird_sdk/sendbird_sdk.dart';
import 'sendbird_info.dart';

class DirectToChannel extends StatefulWidget {
  @override
  DirectToChannelState createState() => DirectToChannelState();
}

class DirectToChannelState extends State<DirectToChannel> {
  final _appIdController =
      TextEditingController(text: SendbirdInfo.sendbird_app_id);
  final _userIdController = TextEditingController(text: "angryMa");
  final _nicknameController = TextEditingController(text: "마음급한 마동석");
  bool _enableSignInButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 100),
        child: Column(
          children: [
            FractionallySizedBox(
              widthFactor: 1,
              child: _signInButton(context, _enableSignInButton),
            )
          ],
        ));
  }

  bool _shouldEnableSignInButton() {
    // if (_appIdController.text.isEmpty) {
    //   return false;
    // }
    // if (_userIdController.text.isEmpty) {
    //   return false;
    // }
    return true;
  }

  Widget _signInButton(BuildContext context, bool enabled) {
    enabled = _shouldEnableSignInButton();
    if (enabled == false) {
      // Disable the sign in button if required data not entered
      return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
            foregroundColor:
                MaterialStateProperty.all<Color>(Colors.grey[300])),
        onPressed: () {},
        child: Text(
          "Sign In",
          style: TextStyle(fontSize: 20.0),
        ),
      );
    }
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff742DDD)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
      onPressed: () {
        // Login with Sendbird
        connect(
          _appIdController.text,
          _userIdController.text,
          _nicknameController.text,
        ).then((user) {
          createChannel(['glen']).then((channel) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => GroupChannelView(groupChannel: channel),
              ),
            );
          }).catchError((error) {
            print(
                'create_channel_view: navigationBar: createChannel: ERROR: $error');
          });
          // Navigator.pushNamed(context, '/create_channel');
        }).catchError((error) {
          print('login_view: _signInButton: ERROR: $error');
        });

        ;
      },
      child: Text(
        "차주와 채팅 시작",
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  Future<User> connect(String appId, String userId, String nickname) async {
    // Init Sendbird SDK and connect with current user id
    try {
      final sendbird = SendbirdSdk(appId: appId);
      final user = await sendbird.connect(userId, nickname: nickname);
      return user;
    } catch (e) {
      print('login_view: connect: ERROR: $e');
      throw e;
    }
  }
}

Future<GroupChannel> createChannel(List<String> userIds) async {
  try {
    final params = GroupChannelParams()..userIds = userIds;
    final channel = await GroupChannel.createChannel(params);
    return channel;
  } catch (e) {
    print('createChannel: ERROR: $e');
    throw e;
  }
}

// Future<String> readJson() async {
//   String response =
//       await rootBundle.loadString('assets/credentials/sendbird_info.json');
//   final data = json.decode(response);
//   return data['sendbird_app_id'];
// }







//   Widget navigationBar() {
//     return AppBar(
//       toolbarHeight: 65,
//       elevation: 0,
//       backgroundColor: Colors.white,
//       automaticallyImplyLeading: true,
//       title: Text('Sendbird Sample', style: TextStyle(color: Colors.black)),
//       actions: [],
//       centerTitle: true,
//     );
//   }

//   Widget body(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.only(left: 20, right: 20, top: 100),
//         child: Column(
//           children: [
//             Container(
//                 width: 50,
//                 height: 50,
//                 child: Image(
//                   image: AssetImage('assets/logoSendbird@3x.png'),
//                   fit: BoxFit.scaleDown,
//                 )),
//             SizedBox(height: 20),
//             Text('Sendbird Sample',
//                 style: Theme.of(context).textTheme.headline6),
//             SizedBox(height: 40),
//             TextField(
//               controller: _appIdController,
//               onChanged: (value) {
//                 setState(() {
//                   _enableSignInButton = _shouldEnableSignInButton();
//                 });
//               },
//               decoration: InputDecoration(
//                   border: InputBorder.none,
//                   labelText: 'App Id',
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   suffixIcon: IconButton(
//                     onPressed: () {
//                       _appIdController.clear();
//                     },
//                     icon: Icon(Icons.clear),
//                   )),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: _userIdController,
//               onChanged: (value) {
//                 setState(() {
//                   _enableSignInButton = _shouldEnableSignInButton();
//                 });
//               },
//               decoration: InputDecoration(
//                   border: InputBorder.none,
//                   labelText: 'User Id',
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   suffixIcon: IconButton(
//                     onPressed: () {
//                       _userIdController.clear();
//                     },
//                     icon: Icon(Icons.clear),
//                   )),
//             ),
//             SizedBox(height: 30),
//             FractionallySizedBox(
//               widthFactor: 1,
//               child: _signInButton(context, _enableSignInButton),
//             )
//           ],
//         ));
//   }

//   bool _shouldEnableSignInButton() {
//     if (_appIdController.text.isEmpty) {
//       return false;
//     }
//     if (_userIdController.text.isEmpty) {
//       return false;
//     }
//     return true;
//   }

  


