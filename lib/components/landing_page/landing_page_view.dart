import 'package:comet_currency/model/product_model.dart';
import 'package:flutter/material.dart';
import './landing_page_view_model.dart';
import 'landing_page.dart';

class LandingPageView extends State<LandingPage> {
  late LandingPageViewModel _viewModel;
  LandingPageView() {
    _viewModel = LandingPageViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: body(),
        ));
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topSection(),
          const SizedBox(
            height: 18,
          ),
          title(),
          const SizedBox(
            height: 18,
          ),
          itemList()
        ],
      ),
    );
  }

  Widget topSection() {
    return Container(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: (){
          _viewModel.logOut();
        },
        child: const Icon(
          Icons.person_outline,
          size: 28,
        ),
      ),
    );
  }

  Widget title() {
    return const Text(
      'Discover products',
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
    );
  }

  Widget itemList() {
    return Expanded(
      child: GridView.builder(
        itemCount: _viewModel.productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 0.8),
        itemBuilder: (context, index) {
          return productCard(_viewModel.productList[index]);
        },
      ),
    );
  }

  Widget productCard(Product product) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3)]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 18 / 100,
            child: Image.network(
              product.image ?? '',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(9, 9, 9, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name ?? '',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text('\u{20B9}${product.price}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
