import 'package:conasi/api/api_crm.dart';
import 'package:conasi/config/config.dart';
import 'package:conasi/resource/assets.dart';
import 'package:conasi/resource/colors.dart';
import 'package:conasi/screens/home_screen.dart';
import 'package:conasi/widgets/button_custom.dart';
import 'package:conasi/widgets/text_filed_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controllerUserName = TextEditingController();
  final controllerPassword = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences prefs;
  bool? isRemember = false;

// lấy thông tin user nếu có ghi nhớ đăng nhập
  void init() async {
    prefs = await _prefs;
    if (prefs.getBool(Config.prefKeyRemember) == true) {
      controllerUserName.text = prefs.getString(Config.prefKeyUserName)!;
      controllerPassword.text = prefs.getString(Config.prefKeyPassword)!;
      setState(() {
        isRemember = true;
      });
    }
  }

// lưu thông tin user khi login thành công, remember me = yes
  void saveUser() {
    if (isRemember == true) {
      prefs.setBool(Config.prefKeyRemember, isRemember!);
      prefs.setString(Config.prefKeyUserName, controllerUserName.text);
      prefs.setString(Config.prefKeyPassword, controllerPassword.text);
    } else {
      prefs.setBool(Config.prefKeyRemember, isRemember!);
      prefs.setString(Config.prefKeyUserName, '');
      prefs.setString(Config.prefKeyPassword, '');
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[background(), body(context)],
    ));
  }

  /// setup background hình ảnh ở sau
  Widget background() => Scaffold(
        body: Stack(
          children: <Widget>[
            Center(
              child: Image.asset(Images.login),
            ),
            Positioned(
                right: 0,
                bottom: 0,
                child: Image.asset(
                  Images.loginBottom,
                  width: 75,
                  height: 75,
                )),
            Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  Images.loginTop,
                  width: 75,
                  height: 75,
                ))
          ],
        ),
      );

  /// setup body
  Widget body(BuildContext context) => SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 100),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Wrap(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(30),
                      // color: colorTrain_30,
                      decoration: BoxDecoration(
                          color: colorTrain_30,
                          border: Border.all(color: colorText),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextFiledUserName(
                              hintText: "User name",
                              controller: controllerUserName,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFiledPassword(
                              hintText: 'Password',
                              controller: controllerPassword,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: isRemember,
                                  onChanged: (value) {
                                    setState(() {
                                      isRemember = value;
                                    });
                                  },
                                ),
                                const Text('Remember me')
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ButtonCustom(
                                text: 'Login',
                                voidCallback: () async {
                                  await EasyLoading.show();
                                  var res = await API.loginEmployee(
                                      controllerUserName.text,
                                      controllerPassword.text);
                                  if (res) {
                                    saveUser();
                                    // ignore: use_build_context_synchronously
                                    Navigator.of(context)
                                        .pushReplacementNamed(HomeScreen.id);
                                    EasyLoading.dismiss();
                                  } else {
                                    EasyLoading.dismiss();
                                    EasyLoading.showToast(
                                        'Sai thong tin dang nhap hoac mat khau');
                                  }
                                }),
                            ButtonAnimation(
                              label: 'test',
                              voidCallback: () async {
                                await EasyLoading.show();
                                var res = await API.loginEmployee(
                                    controllerUserName.text,
                                    controllerPassword.text);
                                if (res) {
                                  saveUser();
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context)
                                      .pushReplacementNamed(HomeScreen.id);
                                  EasyLoading.dismiss();
                                } else {
                                  EasyLoading.dismiss();
                                  EasyLoading.showToast(
                                      'Sai thong tin dang nhap hoac mat khau');
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
