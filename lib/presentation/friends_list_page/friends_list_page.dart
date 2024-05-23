import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'models/friends_item_model.dart';
import 'models/friends_list_model.dart';
import 'provider/friends_list_provider.dart';
import 'widgets/friends_item_widget.dart'; // ignore_for_file: must_be_immutable

class FriendsListPage extends StatefulWidget {
  const FriendsListPage({Key? key})
      : super(
          key: key,
        );

  @override
  FriendsListPageState createState() => FriendsListPageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FriendsListProvider(),
      child: FriendsListPage(),
    );
  }
}

class FriendsListPageState extends State<FriendsListPage>
    with AutomaticKeepAliveClientMixin<FriendsListPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillRed,
          child: SingleChildScrollView(
            child: Column(
              children: [SizedBox(height: 30.v), _buildFriends(context)],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFriends(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 18.h,
        right: 11.h,
      ),
      child: Consumer<FriendsListProvider>(
        builder: (context, provider, child) {
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 200.v,
              crossAxisCount: 2,
              mainAxisSpacing: 9.h,
              crossAxisSpacing: 9.h,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemCount: provider.friendsListModelObj.friendsItemList.length,
            itemBuilder: (context, index) {
              FriendsItemModel model =
                  provider.friendsListModelObj.friendsItemList[index];
              return FriendsItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}
