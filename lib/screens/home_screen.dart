import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horse_app/bloc/home/cubit.dart';
import 'package:horse_app/bloc/home/states.dart';
import 'package:horse_app/bloc/login/cubit.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:horse_app/constants/keys.dart';
import 'package:horse_app/helpers/shared_helper_Screen.dart';
import 'package:horse_app/models/packages_model.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is HomeInitState) {}
      },
      builder: (context, state) {
        HomeCubit _cubit = HomeCubit.get(context);

        var catId;
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 110,
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
                          '1',
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            height: 75.0,
            width: 75.0,
            child: FittedBox(
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: Colors.white,
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Image.asset('assets/images/home.png'),
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: 60,
            child: BottomAppBar(
              color: mPrimaryColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('Contact Us');
                      },
                      child: Image.asset(
                        'assets/images/mail_bulk.png',
                        width: 35,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _cubit.getUserDataById();
                        print('Account Info');
                      },
                      child: Image.asset(
                        'assets/images/chalkboard.png',
                        width: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: state is! GetCategoriesDataLoading
              ? Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: LayoutBuilder(
                      builder: (context, constraint) {
                        var topHeight = constraint.maxHeight;
                        var topWidht = constraint.maxWidth;
                        return Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Center(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: 'إشتراك ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: mPrimaryArabicFont,
                                      color: mPrimaryColor,
                                    ),
                                    children: const <TextSpan>[
                                      TextSpan(
                                        text: 'فعال',
                                        style: TextStyle(
                                          color: Color(0xff079606),
                                        ),
                                      ),
                                      TextSpan(text: ' ( 10 )'),
                                      TextSpan(text: ' '),
                                      TextSpan(text: ' إشتراك '),
                                      TextSpan(
                                        text: 'منتهي ',
                                        style: TextStyle(
                                          color: Color(0xffEE1313),
                                        ),
                                      ),
                                      TextSpan(text: '( 0 )'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                width: double.infinity,
                                height: 0.5,
                                color: Color(0xff707070),
                              ),
                            ),
                            SizedBox(height: 20),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1,
                                            color: Colors.grey.withOpacity(0.9),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: DecoratedBox(
                                          decoration: ShapeDecoration(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(3.0),
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                            ),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                icon: Icon(Icons
                                                    .keyboard_arrow_down_sharp),
                                                iconEnabledColor: mPrimaryColor,
                                                items: _cubit.service.map(
                                                  (s) {
                                                    return DropdownMenuItem(
                                                      onTap: () {
                                                        catId = s.id;
                                                        _cubit
                                                            .getAllCategoriesPackage(
                                                          catId: s.id,
                                                        );
                                                      },
                                                      value: s.name,
                                                      child: Container(
                                                        child: AutoSizeText(
                                                          s.name,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                            color:
                                                                mPrimaryColor,
                                                            fontFamily:
                                                                mPrimaryArabicFont,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).toList(),
                                                value: _cubit.selectedService,
                                                onChanged: (value) {
                                                  _cubit.selecteService(value);
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Container(
                                      width: double.infinity,
                                      height: topHeight / 3,
                                      child: ListView.separated(
                                        reverse: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          if (index == 9) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15.0),
                                              child: _buildHorizontalItem(
                                                topWidht,
                                                topHeight,
                                                _cubit.packagesModel!.data!
                                                    .packages![index],
                                                _cubit.packagesModel!,
                                              ),
                                            );
                                          } else if (index == 0) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 15.0),
                                              child: _buildHorizontalItem(
                                                topWidht,
                                                topHeight,
                                                _cubit.packagesModel!.data!
                                                    .packages![index],
                                                _cubit.packagesModel!,
                                              ),
                                            );
                                          } else {
                                            return _buildHorizontalItem(
                                              topWidht,
                                              topHeight,
                                              _cubit.packagesModel!.data!
                                                  .packages![index],
                                              _cubit.packagesModel!,
                                            );
                                          }
                                        },
                                        separatorBuilder: (context, index) =>
                                            SizedBox(width: 10),
                                        itemCount: _cubit.packagesModel != null
                                            ? _cubit.packagesModel!.data!
                                                .packages!.length
                                            : _cubit.categoriesModel!.data!
                                                .first.packages!.length,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        color: Colors.black,
                                        height: topHeight / 2.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                  color: mPrimaryColor,
                )),
        );
      },
    );
  }

  // HELPER METHODS
  Widget _buildHorizontalItem(topWidht, height, item, PackagesModel p) {
    return Container(
      width: topWidht / 2,
      child: Column(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            child: Image.network(
              '${p.data!.image}',
              fit: BoxFit.cover,
            ),
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: AutoSizeText(
              item != null
                  ? '${item.title}'
                  : '${p.data!.packages!.first.title}',
              maxLines: 2,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                fontFamily: mPrimaryArabicFont,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalItem() {
    return Container();
  }
}
