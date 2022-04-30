// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'group_channel_view.dart';
// import 'package:sendbird_sdk/sendbird_sdk.dart';
// import 'sendbird_info.dart';

// class GenerateNickname extends StatefulWidget {
//   const GenerateNickname({Key key}) : super(key: key);

//   @override
//   GenerateNicknameState createState() => GenerateNicknameState();
// }

// class GenerateNicknameState extends State<GenerateNickname> {
//   // Get Sendbird App Id
//   final _appIdController =
//       TextEditingController(text: SendbirdInfo.sendbird_app_id);

//   // Random Generate Sendbird UserId
//   static String _chars =
//       'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
//   static Random _rnd = Random();

//   static String getRandomString() => String.fromCharCodes(Iterable.generate(
//       10, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

//   static get tempUserId => 'tempUser_' + getRandomString();

//   final _userIdController = TextEditingController(text: tempUserId);

//   String generateRandomNickname() {
//     // Generate Sendbird Sendbird Nickname
//     List _namePart1 = [
//       '마음급한',
//       '힘쎈',
//       '태권도19단',
//       '험상궂은',
//       '치명적인',
//       '헤비급',
//       '주짓수블랙벨트',
//       '원펀맨',
//       '캡틴',
//       '사커킥'
//     ];
//     List _namePart2 = [
//       '마동석',
//       '곽두팔',
//       '마봉팔',
//       '오태식',
//       '모팔모',
//       '강철날개',
//       '어금니',
//       '송곳니',
//       '금니빨',
//       '만두귀'
//     ];

//     Random _rnd1 = Random();
//     Random _rnd2 = Random();

//     // generate a random index based on the list length
//     // and use it to retrieve the element
//     String rndNickName = _namePart1[_rnd1.nextInt(_namePart1.length)] +
//         ' ' +
//         _namePart2[_rnd2.nextInt(_namePart2.length)];

//     return rndNickName;
//   }
// }
