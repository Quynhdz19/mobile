import 'package:flutter/material.dart';
import 'package:mobile_front_end/pages/profile/favoritePage/components/favorite_video_box.dart';
import 'package:mobile_front_end/pages/profile/favoritePage/components/favorite_word_box.dart';
import 'package:mobile_front_end/services/locator.dart';
import 'package:mobile_front_end/services/navigation_service.dart';
import 'package:mobile_front_end/utils/constants.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: Stack(children: [
        SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/favoritebg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 35,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  child: IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () {
                      _navigationService.goBack();
                    },
                  ),
                ),
              ),
              Spacer(
                flex: 3,
              ),
              Container(
                height: MediaQuery.of(context).size.height - 320,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        child: TabBar(
                          controller: _tabController,
                          // isScrollable: true,
                          labelColor: favoriteColor,
                          unselectedLabelColor:
                              Color.fromRGBO(113, 188, 191, 1),
                          indicatorColor: favoriteColor,
                          tabs: [
                            Tab(text: "Videos"),
                            Tab(text: "Vocabularies"),
                          ],
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 350,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            PageView.builder(
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                return FavoriteVideoBox();
                              },
                            ),
                            Container(
                              height: 400,
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: List.generate(
                                   5, (index) => Container(
                                      child: FavoriteWordBox(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ]),
    );
  }
}
