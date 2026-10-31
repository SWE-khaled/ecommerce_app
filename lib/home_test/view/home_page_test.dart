import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/home_test/cubit/cubit/home_cubit_test_cubit.dart';
import 'package:e_commerce/home_test/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class HomePageTest extends StatelessWidget {
  const HomePageTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BlocConsumer<HomeCubitTestCubit, HomeCubitTestState>(
              listener: (context, state) {
                if (state is HomeBannersErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Failed to load banners ")),
                  );
                } else if (state is HomeBannersSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Banners loaded successfully")),
                  );
                }
              },
               builder: (context, state) {
                final cubit = context.read<HomeCubitTestCubit>();
                if (state is HomeBannersLoadingState) {
                  return const Center(
                    child: SpinKitRotatingCircle(
                      color: Colors.white,
                      size: 50.0,
                    ),
                  );
                }
               
                return Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: CarouselSlider(
                    items: [
                      for (var banner in cubit.bannerModel.data ?? [])
                        Container(
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                banner.image ?? ''),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                    ],
                    options: CarouselOptions(
                      height: 200,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                );
              },
            ),
            Row(
              children: [
                Text(
                  'Popular Pack',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'View All',
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ),
              ],
            ),
            BlocConsumer<HomeCubitTestCubit, HomeCubitTestState>(
              listener: (context, state) {
                if (state is HomeProductsErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed to load products')),
                  );
                }
              },
              builder: (context, state) {
                final cubit = context.read<HomeCubitTestCubit>();
                List<Products>? products = cubit.productModel.data?.products;
                if (state is HomeProductsLoadingState) {
                  return const Center(
                    child: SpinKitRotatingCircle(
                      color: Colors.white,
                      size: 50.0,
                    ),
                  );
                }
                return SizedBox(
                  height: 260,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:products?.length, 
                    itemBuilder: (context, index) {
                      return Container(
                        width: 195,
                        height: 240,
                        margin: EdgeInsets.all(8.0),
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  products?[index].image ??'', 
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              products?[index].name ??"", 
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                products?[index].description ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Text('\$${products?[index].price ?? 0}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                FloatingActionButton(
                                  mini: true,
                                  shape: CircleBorder(),
                                  backgroundColor: Colors.green,
                                  onPressed: () {
                                  },
                                  child: Icon(Icons.add, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}