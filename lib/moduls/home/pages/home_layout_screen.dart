import 'package:coder/core/constansts/asset_manger.dart';
import 'package:coder/core/constansts/context_extensions.dart';
import 'package:coder/core/theme/app_colors.dart';
import 'package:coder/moduls/deep_search/presentation/pages/deep_search_screen.dart';
import 'package:coder/moduls/direct_search/presentation/pages/direct_search_screen.dart';
import 'package:coder/moduls/diseases_tree/presentation/pages/show_tree_screen.dart';
import 'package:coder/moduls/home/widgets/tab_bar.dart';
import 'package:flutter/material.dart';

class HomeLayoutScreen extends StatefulWidget  {
  const HomeLayoutScreen({super.key});

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> with SingleTickerProviderStateMixin  {
  late TabController _tabController;

@override
void initState() {
_tabController = TabController(length: 4, vsync: this);
super.initState();
}
void openDrawer(BuildContext context) {
Scaffold.of(context).openDrawer();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      backgroundColor: Colors.white,
      
      body: Container(
        decoration: BoxDecoration(
  image: DecorationImage(
    image: AssetImage(AssetManger.login),
    opacity:  0.9,
    fit: BoxFit.cover,
  ),

),
        child: Row(
          children: [
           Container( decoration: BoxDecoration(color: Colors.white, ),
           width: context.propWidth(150),height: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: Container(height: context.propHeight(450),
                    child: TabBarWidget(tabs: ["Direct search","Deep search"," Manual search","interventions",] , controller: _tabController, )),
                ),
             
            Expanded(
              child: Divider(
            color: HexColor('EEEDF1'),
            height: context.propHeight(110),
            thickness: context.propHeight(10),
            indent: context.propWidth(0),
            endIndent: context.propWidth(0),
            ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.settings,color: Colors.black.withOpacity(0.8),)),
                  Text('Help?',style: TextStyle(
                    color: Colors.black.withOpacity(0.8)
                  ) ,)
                ],
              ),
            ),
           
              ],
            )),
          
           Container(
             width: context.propWidth(730),
                  child: TabBarView(
                    controller: _tabController,
                    
                    children: [
                     
                     DirectSearchScreen(),
                      DiseaseSearchPage(),
                      ShowTreeScreen(),
                      Container(),
                    ],
                  ),
                )
                    
          ],
        ),
      ),
    );
  ;
  }
}