import 'package:flutter/material.dart';
import 'package:portfolio_student_app/screens/portfolio_tab_screens/achievement_screen.dart';
import 'package:portfolio_student_app/screens/portfolio_tab_screens/project_screen.dart';
import 'package:portfolio_student_app/screens/portfolio_tab_screens/saved_screen.dart';
import 'package:portfolio_student_app/screens/portfolio_tab_screens/share_screen.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title:const  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Portfilio",style: TextStyle(color: Colors.black),),
                SizedBox(width: 65,),
                Icon(Icons.business_center_outlined,color: Colors.red,),
                Icon(Icons.add_alert_sharp,color: Colors.red,)
              ],
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Project'),
                Tab(text: 'Saved'),
                Tab(text: 'Shared'),
                Tab(text: 'Achievement'),
              ],
            ),
          ),
          body: const TabBarView(physics: ScrollPhysics(),
            children: [
              ProjectScreen(),
              SavedScreen(),
              ShareScreen(),
              AchievementScreen(),
            ],
          ),
        ));
  }
}
