import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:horse_app/bloc/home/cubit.dart';
import 'package:horse_app/bloc/home/states.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:transitioner/transitioner.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';

class EditProfileScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _nameController.text = HomeCubit.get(context).profileModel!.data!.name!;
    _emailController.text = HomeCubit.get(context).profileModel!.data!.email!;
    _phoneController.text = HomeCubit.get(context).profileModel!.data!.mobile!;
    _nameController.text = HomeCubit.get(context).profileModel!.data!.name!;
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is UpdateProfileSuccess) {
          Fluttertoast.showToast(
            msg: "تم الحفظ بنجاح",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
        if (state is UpdateProfileError) {
          Fluttertoast.showToast(
            msg: "فشل الحفظ، الرجاء إعاده المحاوله",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      builder: (context, state) {
        HomeCubit _cubit = HomeCubit.get(context);

        var profileImage = _cubit.profileImage;
        return state is! GetUserDataLoading
            ? Scaffold(
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
                            onPressed: () {
                              _cubit.getUserNotification();
                              _cubit.notificationModel!.data!
                                  .where((element) => element.seen == '0')
                                  .forEach((element) {
                                print(element.id);
                                _cubit.seenAllNotification(noteId: element.id);
                              });
                              Transitioner(
                                context: context,
                                child: NotificationScreen(),
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
                              Icons.notifications_none,
                              size: 30,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 4,
                            child: Container(
                              // padding: const EdgeInsets.all(2),
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(30),
                                // border: Border.all(
                                //   color: Color(0xff707070),
                                // ),
                              ),
                              child: Center(
                                child: Text(
                                  '${_cubit.notificationModel!.data!.where((element) => element.seen == '0').length}',
                                  style: TextStyle(color: Colors.white),
                                ),
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
                      child: GestureDetector(
                        onTap: () {
                          _cubit.getUserDataById();
                          Transitioner(
                            context: context,
                            child: ProfileScreen(),
                            animation: AnimationType.fadeIn, // Optional value
                            duration:
                                Duration(milliseconds: 300), // Optional value
                            replacement: true, // Optional value
                            curveType: CurveType.decelerate, // Optional value
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40.0,
                          child: ClipRRect(
                            child: Image.network(
                              '${_cubit.profileModel!.data!.photo}',
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                body: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraint) {
                          return SingleChildScrollView(
                            child: Column(
                              textDirection: TextDirection.rtl,
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: IconButton(
                                          onPressed: () {
                                            _cubit.profileImage = null;
                                            Transitioner(
                                              context: context,
                                              child: ProfileScreen(),

                                              animation: AnimationType
                                                  .fadeIn, // Optional value
                                              duration: Duration(
                                                  milliseconds:
                                                      300), // Optional value
                                              replacement:
                                                  true, // Optional value
                                              curveType: CurveType
                                                  .decelerate, // Optional value
                                            );
                                          },
                                          icon: Icon(
                                            Icons.double_arrow,
                                            color: mPrimaryColor,
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Center(
                                        child: AutoSizeText(
                                          'تعديل بياناتي',
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Container(
                                    width: double.infinity,
                                    height: 0.5,
                                    color: Color(0xff707070),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Form(
                                    child: Column(
                                      children: [
                                        Center(
                                          child: GestureDetector(
                                            onTap: () async {
                                              _cubit.getProfileImage();
                                            },
                                            child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 60.0,
                                              child: ClipRRect(
                                                child: profileImage == null
                                                    ? Image.network(
                                                        '${_cubit.profileModel!.data!.photo}',
                                                        width: 200,
                                                        height: 200,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Image.file(profileImage),
                                                borderRadius:
                                                    BorderRadius.circular(60.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'الإسم',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                            fontFamily: mPrimaryArabicFont,
                                          ),
                                        ),
                                        SizedBox(height: 3),
                                        Container(
                                          child: TextFormField(
                                            controller: _nameController,
                                            textDirection: TextDirection.rtl,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          height: 60,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'البريد',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                            fontFamily: mPrimaryArabicFont,
                                          ),
                                        ),
                                        SizedBox(height: 3),
                                        Container(
                                          child: TextFormField(
                                            controller: _emailController,
                                            textDirection: TextDirection.rtl,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          height: 60,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'رقم الهاتف',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                            fontFamily: mPrimaryArabicFont,
                                          ),
                                        ),
                                        SizedBox(height: 3),
                                        Container(
                                          child: TextFormField(
                                            textDirection: TextDirection.rtl,
                                            controller: _phoneController,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          height: 60,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          'الباسورد',
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                            fontFamily: mPrimaryArabicFont,
                                          ),
                                        ),
                                        SizedBox(height: 3),
                                        Container(
                                          child: TextFormField(
                                            controller: _passController,
                                            textDirection: TextDirection.rtl,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          height: 60,
                                        ),
                                        SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 40),
                                          child: Center(
                                            child: MaterialButton(
                                              onPressed: () async {
                                                var _image;
                                                if (_cubit.profileImage != null)
                                                  _image = await MultipartFile
                                                      .fromFile(
                                                    profileImage!.path,
                                                  );

                                                final formData =
                                                    FormData.fromMap(
                                                  {
                                                    'name':
                                                        _nameController.text,
                                                    "email":
                                                        _emailController.text,
                                                    "mobile":
                                                        _phoneController.text,
                                                    if (_passController.text
                                                        .toString()
                                                        .isNotEmpty)
                                                      'password':
                                                          _passController.text,

                                                    'photo': _image,
                                                    // '_method': 'put',
                                                  },
                                                );

                                                _cubit.updateProfile(
                                                  formData: formData,
                                                );
                                              },
                                              child:
                                                  state is! UpdateProfileLoading
                                                      ? Text(
                                                          'حفظ',
                                                          style: TextStyle(
                                                            fontFamily: 'Cairo',
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18,
                                                          ),
                                                        )
                                                      : Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                              minWidth: double.infinity,
                                              height: 50,
                                              elevation: 6,
                                              color: mPrimaryColor,
                                            ),
                                          ),
                                        )
                                      ],
                                      textDirection: TextDirection.rtl,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            : Scaffold(
                body: Center(
                  child: Image.asset('assets/images/loading.gif'),
                ),
              );
      },
    );
  }
}
