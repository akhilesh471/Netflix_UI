import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/constats/colors/colors.dart';
import 'package:netflix/constats/size_h_w/size_h_w.dart';
import 'package:netflix/constats/textConstants/text_constants.dart';
import 'package:netflix/constats/video_widget/videoWidget.dart';
import 'package:netflix/domain/newandHot/newandhortFunction.dart';
import 'package:netflix/presentation/homescreen/widgets/playbutton_widget.dart';
import 'package:netflix/presentation/news_and_hot/widgets/comingsoon_widget.dart';
import 'package:netflix/presentation/news_and_hot/widgets/everoneWatchingWidget.dart';
import 'package:netflix/presentation/news_and_hot/widgets/tabs.dart';

class NewAndHot extends StatelessWidget {
  const NewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            title: Text(
              'New & Hot',
              style: GoogleFonts.montserrat(
                  fontSize: 23, fontWeight: FontWeight.bold),
            ),
            actions: const [
              Icon(
                Icons.cast,
                color: Colors.white,
                size: 25,
              ),
              kwidth20,
              SizedBox(
                height: 25,
                width: 25,
                child: Image(image: AssetImage('lib/assets/avatarimage.jpg')),
              ),
              kwidth20
            ],
            bottom: TabBar(
                isScrollable: true,
                indicator: BoxDecoration(
                    color: kiconWhiteColor, borderRadius: kradius30),
                labelColor: Colors.black,
                unselectedLabelColor: ktextWhiteColor,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                tabs: const [
                  tabsNewsAndHot(title: '🍿Coming Soon'),
                  tabsNewsAndHot(title: '🔥Everyone\'s Watching'),
                  tabsNewsAndHot(title: '💯Top 100')
                ]),
          ),
          preferredSize: Size.fromHeight(80),
        ),
        body: TabBarView(children: [
          _buildComingSoon(),
          _buildEveroneWatching(),
          _buildTop10(),
        ]),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemBuilder: (BuildContextcontext, index) {
        return ComingSoonWidget(index: index);
      },
      itemCount: 10,
    );
  }

  Widget _buildEveroneWatching() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return EveryoneWatchingwidget(
            index: index,
          );
        });
  }

  Widget _buildTop10() {
    return Container();
  }
}
