// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

Color kWhiteColor = const Color(0xffFFFFFF);
Color kBlueColor = const Color(0xff004C8B);
Color kRedColor = const Color(0xffDE0046);
Color kOrangeColor = const Color(0xffF7A34B);
Color kGreyColor = const Color(0xffC4C4C4);
Color kBlackColor = const Color(0xFF000000);

TextStyle blackTextStyle = TextStyle(color: kBlackColor);
TextStyle blueTextStyle = TextStyle(color: kBlueColor);

class InstagramScreen extends StatelessWidget {
  InstagramScreen({Key? key}) : super(key: key);

  var faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: appBarMethod(),
      bottomNavigationBar: bottomNavBarMethod(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 76,
                      height: 76,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [kOrangeColor, kRedColor]),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          Container(
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                              border: Border.all(color: kWhiteColor, width: 2),
                              borderRadius: BorderRadius.circular(100),
                              color: kWhiteColor,
                              image: DecorationImage(image: NetworkImage('https://picsum.photos/300/300'), fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _profileCount(count: '99', title: 'Posts'),
                    _profileCount(count: '168', title: 'Followers'),
                    _profileCount(count: '199', title: 'Following'),
                  ],
                ),
                // username
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    faker.person.name(),
                    style: blackTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(children: [
                      const TextSpan(text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy '),
                      TextSpan(text: '#hashtag', style: blueTextStyle)
                    ], style: blackTextStyle),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    'Link goes here',
                    textAlign: TextAlign.justify,
                    style: blueTextStyle,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'Edit Profile',
                      style: blackTextStyle,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _storiesHighlights(title: 'Story 1', imgUrl: 'https://picsum.photos/id/100/300/300'),
                    _storiesHighlights(title: 'Story 2', imgUrl: 'https://picsum.photos/id/200/300/300'),
                    _storiesHighlights(title: 'Story 3', imgUrl: 'https://picsum.photos/id/300/300/300'),
                    _storiesHighlights(title: 'Story 4', imgUrl: 'https://picsum.photos/id/400/300/300'),
                    _storiesHighlights(title: 'Add', add: true),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        AssetImage('assets/icon/vector.png'),
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        AssetImage('assets/icon/union.png'),
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 1, mainAxisSpacing: 1),
            scrollDirection: Axis.vertical,
            itemCount: 24,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://picsum.photos/id/${69 + index}/300/300'),
                  ),
                ),
                // child: Center(
                //   child: Text('${index + 1}'),
                // ),
              );
            },
          )
        ],
      ),
    );
  }

  Column _storiesHighlights({
    required String title,
    String imgUrl = '',
    bool add = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 68,
          height: 68,
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: kGreyColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: kWhiteColor, width: 2),
              image: DecorationImage(
                image: NetworkImage(imgUrl),
              ),
            ),
            child: add == true ? Image.asset('assets/icon/group1.png') : SizedBox(),
          ),
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: blackTextStyle.copyWith(fontSize: 12),
        )
      ],
    );
  }

  Column _profileCount({
    required String count,
    required String title,
  }) {
    return Column(
      children: [
        Text(
          count,
          style: blackTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        Text(
          title,
          style: blackTextStyle.copyWith(fontWeight: FontWeight.w400, fontSize: 16),
        ),
      ],
    );
  }

  BottomNavigationBar bottomNavBarMethod() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: kWhiteColor,
      unselectedItemColor: kBlackColor,
      selectedItemColor: kBlueColor,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      items: [
        const BottomNavigationBarItem(
          label: 'Home',
          icon: ImageIcon(
            AssetImage('assets/icon/home.png'),
          ),
        ),
        const BottomNavigationBarItem(
          label: 'Search',
          icon: ImageIcon(
            AssetImage('assets/icon/search.png'),
          ),
        ),
        const BottomNavigationBarItem(
          label: 'Reels',
          icon: ImageIcon(
            AssetImage('assets/icon/reels.png'),
          ),
        ),
        const BottomNavigationBarItem(
          label: 'Shop',
          icon: ImageIcon(
            AssetImage('assets/icon/shop.png'),
          ),
        ),
        BottomNavigationBarItem(
          label: 'User',
          icon: Image.asset('assets/icon/avatar.png'),
        ),
      ],
    );
  }

  AppBar appBarMethod() {
    return AppBar(
      elevation: 0,
      backgroundColor: kWhiteColor,
      title: Row(
        children: [
          Text(
            faker.person.firstName(),
            style: blackTextStyle,
          ),
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage('assets/icon/dropdown.png'),
              color: Colors.black,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.add_box_outlined),
          color: kBlackColor,
        ),
        IconButton(
          onPressed: () {},
          icon: ImageIcon(
            AssetImage('assets/icon/burger.png'),
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
