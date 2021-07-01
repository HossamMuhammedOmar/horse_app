import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horse_app/bloc/home/cubit.dart';
import 'package:horse_app/bloc/home/states.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:horse_app/screens/profile_screen.dart';
import 'package:horse_app/screens/trainer_subscrip_screen.dart';
import 'package:transitioner/transitioner.dart';

class TrainerReservationListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit _cubit = HomeCubit.get(context);
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: LayoutBuilder(
                  builder: (context, constraint) {
                    var topHeight = constraint.maxHeight;
                    var topWidht = constraint.maxWidth;
                    return Column(
                      textDirection: TextDirection.rtl,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: IconButton(
                                  onPressed: () {
                                    Transitioner(
                                      context: context,
                                      child: ProfileScreen(),
                                      animation: AnimationType
                                          .fadeIn, // Optional value
                                      duration: Duration(
                                          milliseconds: 300), // Optional value
                                      replacement: true, // Optional value
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Center(
                                child: AutoSizeText(
                                  'إشتراك جديد',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: mPrimaryArabicFont,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          alignment: Alignment.centerRight,
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            width: double.infinity,
                            height: 0.5,
                            color: Color(0xff707070),
                          ),
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20, left: 20),
                            child: ListView.separated(
                              itemBuilder: (context, index) {
                                return _buildItem(
                                  _cubit.trainersModel!.data![index],
                                  context,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 30);
                              },
                              itemCount: _cubit.trainersModel!.data!.length,
                            ),
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
      },
    );
  }

  Widget _buildItem(item, context) {
    return Column(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Color(0xffEEA412),
          width: double.infinity,
          height: 50,
          child: Center(
            child: AutoSizeText(
              '${item.name}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: mPrimaryArabicFont,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
        SizedBox(height: 5),
        Container(
          child: Image.asset(
            'assets/images/1621245854.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 250,
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: AutoSizeText(
            '${item.datumAbstract}',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: mPrimaryArabicFont,
              fontSize: 15,
            ),
          ),
        ),
        SizedBox(height: 20),
        MaterialButton(
          onPressed: () {
            Transitioner(
              context: context,
              child: TrainerSubscribeScreen(
                id: item.id,
                name: item.name,
              ),
              animation: AnimationType.fadeIn, // Optional value
              duration: Duration(milliseconds: 300), // Optional value
              replacement: true, // Optional value
              curveType: CurveType.decelerate, // Optional value
            );
          },
          child: Text(
            'إحجز الآن',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Cairo',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          color: Color(0xff7AB861),
          minWidth: double.infinity,
          height: 50,
        )
      ],
    );
  }
}
