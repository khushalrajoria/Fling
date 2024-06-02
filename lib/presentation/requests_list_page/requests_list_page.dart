import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'provider/requests_list_provider.dart';

class RequestsListPage extends StatefulWidget {
  const RequestsListPage({Key? key}) : super(key: key);

  @override
  RequestsListPageState createState() => RequestsListPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RequestsListProvider(),
      child: RequestsListPage(),
    );
  }
}

class RequestsListPageState extends State<RequestsListPage>
    with AutomaticKeepAliveClientMixin<RequestsListPage> {
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
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 17.v),
                Container(
                  height: 544.v,
                  width: 341.h,
                  margin: EdgeInsets.only(
                    left: 11.h,
                    right: 8.h,
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
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
    final requestsListProvider = Provider.of<RequestsListProvider>(context);
    final requestsList = requestsListProvider.requestsList;

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: requestsList.length,
      itemBuilder: (context, index) {
        final item = requestsList[index];
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 7.v),
              child: InkWell(
                onTap: (){
                 NavigatorService.pushNamed(
              AppRoutes.userProfileScreen,
    );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (item.hasCircle)
                      Container(
                        height: 40.v,
                        width: 49.h,
                        decoration: BoxDecoration(
                          color: appTheme.black900,
                          borderRadius: BorderRadius.circular(24.h),
                          border: Border.all(
                            color: appTheme.blue50,
                            width: 2.h,
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 8.v),
                      child: Text(
                        item.name.tr,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    Spacer(),
                    _buildAcceptButton(context),
                    SizedBox(width: 5.h,),
                    _buildRejectButton(context),
                  ],
                ),
              ),
            ),
            Divider(),
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
        child: Text('Accept',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color?>(appTheme.cyan300)
      ),
    );
  }

  Widget _buildRejectButton(BuildContext context) {
     return ElevatedButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text('Reject',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color?>(Colors.transparent)
      ),
    );
  }

  onTapTxtPatriciad(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.userProfileScreen,
    );
  }
}