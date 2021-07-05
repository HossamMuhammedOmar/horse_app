import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:horse_app/screens/my_ind_subscribe_follow.dart';
import 'package:intl/intl.dart';
import 'package:transitioner/transitioner.dart';
import 'package:flutter/material.dart' as ui;

class ConfirmIndSubscribeScreen extends StatelessWidget {
  final _dateteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 110,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          margin: const EdgeInsets.only(right: 15, top: 15),
          child: Image.asset(
            'assets/images/logo.png',
            width: 140,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Container(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    size: 30,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Color(0xff707070),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '0',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30.0,
              child: ClipRRect(
                child: Image.asset(
                  'assets/images/hore_image.jpeg',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(60.0),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: LayoutBuilder(
              builder: (context, constraint) {
                var topHeight = constraint.maxHeight;
                var topWidht = constraint.maxWidth;
                return Column(
                  textDirection: ui.TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: IconButton(
                              onPressed: () {
                                Transitioner(
                                  context: context,
                                  child: MyIndSubscribeFollow(),
                                  animation:
                                      AnimationType.fadeIn, // Optional value
                                  duration: Duration(
                                      milliseconds: 300), // Optional value
                                  replacement: true, // Optional value
                                  curveType:
                                      CurveType.decelerate, // Optional value
                                );
                              },
                              icon: Icon(
                                Icons.double_arrow,
                                color: mPrimaryColor,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: AutoSizeText(
                              'بيانات الدفع',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: mPrimaryArabicFont,
                              ),
                            ),
                          ),
                        ),
                      ],
                      alignment: Alignment.centerRight,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        height: 0.5,
                        color: Color(0xff707070),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        textDirection: ui.TextDirection.rtl,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          AutoSizeText(
                            'الحسابات البنكيه',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: mPrimaryArabicFont,
                            ),
                            textDirection: ui.TextDirection.rtl,
                          ),
                          SizedBox(height: 25),
                          Image.asset('assets/images/group_56843.jpg'),
                          SizedBox(height: 30),
                          AutoSizeText(
                            'التاريخ',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: mPrimaryArabicFont,
                            ),
                          ),
                          SizedBox(height: 5),
                          Form(
                            child: Container(
                              child: TextFormField(
                                controller: _dateteController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'هذا الحقل مطلوب';
                                  }
                                },
                                onTap: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2222))
                                      .then((value) => _dateteController.text =
                                          DateFormat('yyyy-MM-dd')
                                              .format(value!));
                                },
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              width: double.infinity,
                            ),
                          ),
                          SizedBox(height: 20),
                          Column(
                            children: [
                              AutoSizeText(
                                'أرفق صوره التحويل',
                                style: TextStyle(
                                  fontFamily: mPrimaryArabicFont,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 5),
                              Image.asset('assets/images/choose.jpg'),
                            ],
                            textDirection: ui.TextDirection.rtl,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: MaterialButton(
                              onPressed: () {},
                              minWidth: double.infinity,
                              height: 50,
                              child: AutoSizeText(
                                'إرسال',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              color: Color(0xff157347),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
