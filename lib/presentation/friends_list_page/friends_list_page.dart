import 'package:flutter/material.dart';
import 'package:open_signup_login_page1_signup/core/utils/size_utils.dart';
import 'package:provider/provider.dart';
import '../../theme/app_decoration.dart';
import 'models/friends_list_model.dart';
import 'provider/friends_list_provider.dart';
import 'widgets/friends_item_widget.dart';
class FriendsListPage extends StatefulWidget {
  const FriendsListPage({Key? key}) : super(key: key);

  @override
  FriendsListPageState createState() => FriendsListPageState();
  
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(), 
      child: FriendsListPage(),
    );
  }
}

class FriendsListPageState extends State<FriendsListPage> with AutomaticKeepAliveClientMixin<FriendsListPage> {
  @override
  bool get wantKeepAlive => true;

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

  Widget _buildFriends(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18.h, right: 11.h),
      child: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (provider.users.isEmpty) {
            return Center(child: Text('No friends found'));
          }

          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 200.v,
              crossAxisCount: 2,
              mainAxisSpacing: 9.h,
              crossAxisSpacing: 9.h,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemCount: provider.users.length,
            itemBuilder: (context, index) {
              FriendsListModel model = provider.users[index];
              return FriendsItemWidget(model);
            },
          );
        },
      ),
    );
  }
}
