import 'package:app/Widgets/HorizontalCard/horizontal_card.dart';
import 'package:app/Widgets/Info/info.dart';
import 'package:app/Widgets/RecipeCard/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:app/Widgets/Home/models/recipe.dart';
import 'package:app/Widgets/Home/models/recipe.api.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Recipe> _recipes;
  late ScrollController _scrollController;
  double _scrollPosition = 0.0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  bool _isLoading = true;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          toolbarHeight: size.height / 8,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const Text(
            "Recipe",
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w900,
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 35,
                ),
              ),
            ),
          ],
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _scrollPosition > 20 ? 0 : 1,
                    child: Container(
                      margin: const EdgeInsets.only(top: 35, left: 20),
                      child: const Text(
                        "Today's recipe",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(top: 100),
                          height: _scrollPosition > 20 ? 0 : size.height / 2.5,
                          // height: 0,
                          child: ListView.builder(
                              reverse: true,
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: 20,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Info(
                                                title: _recipes[index]
                                                    .title
                                                    .toString(),
                                                id: "1.0",
                                                img: _recipes[index]
                                                    .image
                                                    .toString(),
                                                level: _recipes[index].servings,
                                                time: _recipes[index]
                                                    .totalTime)));
                                  },
                                  child: HorizontalCard(
                                    reating: _recipes[index].servings,
                                    img: _recipes[index].image,
                                    title: _recipes[index].title,
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    margin:
                        EdgeInsets.only(top: _scrollPosition > 20 ? 0 : 455),
                    child: Stack(
                      children: [
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 150),
                          opacity: _scrollPosition > 20 ? 0.0 :1.0,
                          child: const Padding(
                            padding: EdgeInsets.only(left:20.0),
                            child: Text("Recommended",style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                            ),),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:20.0),
                          child: Container(
                            child: ListView.builder(
                                controller: _scrollController,
                                scrollDirection: Axis.vertical,
                                physics: const BouncingScrollPhysics(),
                                itemCount: _recipes.length,
                                itemBuilder: (context, index) {
                                  return RecipeCard(
                                    key: Key(index.toString()),
                                    title: _recipes[index].title,
                                    // title: _scrollPosition.toString(),
                                    level: _recipes[index].servings,
                                    time: _recipes[index].totalTime,
                                    img: _recipes[index].image,
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
  }
}
