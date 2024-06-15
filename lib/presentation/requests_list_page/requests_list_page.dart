import 'package:flutter/material.dart';
import 'package:open_signup_login_page1_signup/core/app_export.dart';
import 'package:provider/provider.dart';
import 'provider/requests_list_provider.dart';

class RequestsListPage extends StatefulWidget {
  const RequestsListPage({Key? key}) : super(key: key);

  @override
  RequestsListPageState createState() => RequestsListPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: const RequestsListPage(),
    );
  }
}

class RequestsListPageState extends State<RequestsListPage>
    with AutomaticKeepAliveClientMixin<RequestsListPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final provider = Provider.of<HomeProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color.fromRGBO(250, 249, 246, 1),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 17),
                Container(
                  height: 544,
                  width: 341,
                  margin: EdgeInsets.only(left: 11, right: 8),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (provider.isLoading)
                              CircularProgressIndicator()
                            else if (provider.users.isEmpty)
                              Text('No requests found')
                            else
                              _buildRequestsList(context),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRequestsList(BuildContext context) {
    final requestsListProvider = Provider.of<HomeProvider>(context);
    final requestsList = requestsListProvider.users;

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: requestsList.length,
      itemBuilder: (context, index) {
        final item = requestsList[index];
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 11),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/userProfileScreen');
                  
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(item.Pic),
                      radius: 24,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      child: Text(
                        item.fullname,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 15),
                    Spacer(),
                    SizedBox(width: 5),
                    _buildAcceptButton(context),
                    SizedBox(width: 5),
                    _buildRejectButton(context),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAcceptButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          'Accept',
          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: appTheme.cyan300,
      ),
    );
  }

  Widget _buildRejectButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'Reject',
          style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
