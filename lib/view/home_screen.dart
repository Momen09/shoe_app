import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/consts/list.dart';
import 'package:shoe_app/view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   final HomeViewModel homeViewModel= HomeViewModel();
  @override
  void initState() {
    super.initState();
    homeViewModel.selectedBrand = Lists().BrandName.first;
    homeViewModel.updateBrandDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: const Text(
          'Home Page',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: Drawer(
          elevation: 0,
          backgroundColor: Colors.grey.shade100,
          child: const Icon(Icons.list, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body:Consumer<HomeViewModel>(
        builder: (context,homeViewModel,child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  _searchBar(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Select Category',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _categoryList(context),
                  const SizedBox(
                    height: 20,
                  ),
                  _cartGridView(),
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ], borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(20.0),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(20)),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          hintText: 'Looking for shoes...',
        ),
      ),
    );
  }

  Widget _categoryList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      child: ListView.builder(
        itemCount: Lists().BrandName.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  homeViewModel.selectedBrand = Lists().BrandName[index];
                  homeViewModel.updateBrandDetails();
                });
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      color: homeViewModel.selectedBrand == Lists().BrandName[index]
                          ? const Color(
                              0xff0D6EFD) // Highlight the selected brand
                          : Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Text(
                    Lists().BrandName[index],
                    style: TextStyle(
                        color: homeViewModel.selectedBrand == Lists().BrandName[index]
                            ? Colors.white // Highlight the selected brand
                            : Colors.black,
                        fontWeight: FontWeight.bold),
                  ))),
            ),
          );
        },
      ),
    );
  }

  Widget _cartGridView() {
    return SizedBox(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
        ),
        padding: const EdgeInsets.all(5.0),
        itemCount: homeViewModel.currentBrandDetails.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ], borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child:
                            Image.network(homeViewModel.currentBrandDetails[index]['image'])),
                    IconButton(
                      // style: ButtonStyle(
                      //   surfaceTintColor: MaterialStateProperty.all<Color>(
                      //   Colors.black,
                      // ),),
                      icon: const Icon(Icons.favorite),
                      color: homeViewModel.selectedFavorite ? Colors.red : Colors.grey,
                      onPressed: () {
                        setState(() {
                          homeViewModel.selectedFavorite = !homeViewModel.selectedFavorite;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Best seller',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff0D6EFD),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    homeViewModel.currentBrandDetails[index]['name'],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8),
                      child: Text(
                        ('${homeViewModel.currentBrandDetails[index]['price']}\$').toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.1,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        color: Color(0xff0D6EFD),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
