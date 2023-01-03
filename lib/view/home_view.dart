import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mvvm_vidoe_one/view_model/home_viewmodal.dart';
import 'package:mvvm_vidoe_one/view_model/user_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../data/response/status.dart';
import '../res/colors.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils/Utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModal homeViewModal = HomeViewModal();

  @override
  void initState() {
    homeViewModal.fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPref = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              userPref.removeUser().then((value) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    RoutesName.login, (Route<dynamic> route) => false);
              });
            },
            child: const Icon(
              Icons.exit_to_app,
              color: AppColors.whiteColor,
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModal>(
        create: (BuildContext context) => homeViewModal,
        child: Consumer<HomeViewModal>(
          builder: (context, value, child) {
            switch(value.moviesList.status){
              case Status.LOADING:
                return GridView.builder(
                  shrinkWrap: true,
                  padding:  const EdgeInsets.symmetric(horizontal: 6),
                  itemCount: 12,
                  itemBuilder: (context,index) {
                    return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade200,
                        child: Card(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(5),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        color: Colors.grey.shade50,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 5,
                    mainAxisExtent: 264,
                  ),
                );
              case Status.ERROR:
                return Center(
                  child: Text(value.moviesList.message.toString(),style: const TextStyle(fontSize: 18),textAlign: TextAlign.center,),
                );
              case Status.COMPLETED:
                return GridView.builder(
                  shrinkWrap: true,
                  padding:  const EdgeInsets.symmetric(horizontal: 6),
                  itemCount: value.moviesList.data!.tvShows!.length,
                  itemBuilder: (context,index) {
                    return Card(
                      elevation: 6,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    value.moviesList.data!.tvShows![index].imageThumbnailPath.toString(),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(height: 6,),
                                Text(
                                value.moviesList.data!.tvShows![index].name.toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 3,),
                                Row(
                                  children: [
                                    Text(
                                value.moviesList.data!.tvShows![index].country.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(width: 6,),
                                    Text(
                                value.moviesList.data!.tvShows![index].startDate.toString(),
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 5,
                    mainAxisExtent: 264,
                  ),
                );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
