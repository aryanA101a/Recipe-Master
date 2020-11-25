import 'package:chefz_kit/models/meals_ds.dart';
import 'package:chefz_kit/screens/favourites_screen.dart';
import 'package:chefz_kit/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';
import '../main.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Meal> favouriteItems;
  CategoriesScreen(this.favouriteItems);

//  void selectFavScr(BuildContext ctx){Navigator.of(ctx).pushNamed('/favorite');}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('MasterRecipies'),
//        actions: <Widget>[IconButton(icon: Icon(Icons.favorite,), onPressed:(){
//          Navigator.push(context, new MaterialPageRoute(builder: (context) =>Favorites(favouriteItems)));
//              })],
      ),
      body:
//      ListView.separated(
//        padding: const EdgeInsets.all(15),
//        itemCount: DUMMY_CATEGORIES.length,
//        itemBuilder: (BuildContext context, int index) {
//          return CategoryItem(DUMMY_CATEGORIES[index].id,DUMMY_CATEGORIES[index].title,DUMMY_CATEGORIES[index].color,);
//        },
//        separatorBuilder: (BuildContext context, int index) => const Divider(),
//      )
      GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map(
              (catData) =>
              CategoryItem(
                catData.id,
                catData.title,
                catData.color,
                catData.icon,
              ),
        )
            .toList(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
