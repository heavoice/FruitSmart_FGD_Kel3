import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_shop_app/dummy/fruits_list.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductListScreen> {
  List<Product> filteredProduct = products;

  filterProduct(String query) {
    setState(() {
      filteredProduct = products
          .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF1AD),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 100,
              title: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/homescreen');
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFF5F5F5),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: const Icon(
                          Icons.home,
                          color: Color(0xFF130F26),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFF5F5F5),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Color(0xFF130F26),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/wishlist');
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFFF5F5F5),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: Color(0xFF130F26),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              automaticallyImplyLeading: false,
              backgroundColor: const Color(0xFFFFF1AD),
              elevation: 0, // Menghilangkan bayangan
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        "Explore Fruits & Berries",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 20),
                    child: TextField(
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                      ),
                      onChanged: filterProduct,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        fillColor: const Color(0xFFF5F5F5),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 20),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        if (filteredProduct.isEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Text(
                              'No product found',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        else
                          for (final product in filteredProduct)
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/detail',
                                  arguments: product,
                                );
                              },
                              child: Container(
                                width: (MediaQuery.of(context).size.width / 2) -
                                    45,
                                decoration: BoxDecoration(
                                  color:
                                      Color(int.parse('0xFF${product.color}')),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                              product.name,
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                              "\$ ${product.price} / kg",
                                              style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Image.asset(
                                        product.image,
                                        fit: BoxFit.contain,
                                        width: 90,
                                        height: 90,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: TextButton(
                                        onPressed: () {
                                          // Aksi saat tombol ditekan
                                          // ignore: avoid_print
                                          print('Favorite button pressed');
                                        },
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets
                                              .zero, // Menghilangkan padding default
                                          minimumSize: const Size(
                                              45, 45), // Ukuran tombol
                                          backgroundColor: Color(
                                            int.parse(
                                                '0xFF${product.secondaryColor}'),
                                          ),
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                          ),
                                        ),
                                        child: const Icon(
                                          CupertinoIcons.heart_fill,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
