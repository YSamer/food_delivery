import 'package:flutter/material.dart';
import 'package:food_delivery/screens/home/components/main_food_appbar.dart';
import 'package:food_delivery/screens/home/components/main_food_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: SafeArea(
          child: Column(
            children: const [
              MainFoodAppBar(),
              Expanded(child: SingleChildScrollView(child: MainFoodBody())),
            ],
          ),
        ),
      ),
    );
  }
}
