import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobileassignment/feature/glocery_products/presentaion%20layer/bloc/product_bloc.dart';
import 'package:mobileassignment/feature/glocery_products/presentaion%20layer/bloc/product_event.dart';
import 'package:mobileassignment/feature/glocery_products/presentaion%20layer/bloc/product_state.dart';
import 'package:mobileassignment/feature/glocery_products/presentaion%20layer/widgets/burgercard.dart';

class BurgerPage extends StatelessWidget {
  BurgerPage({super.key});

  Future<void> _onRefresh(BuildContext context) async {
    context.read<GroceryBloc>().add(LoadAllGroceriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.circle, color: Colors.white, size: 50),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the title
          children: [
            Image.asset(
              'assets/images/cheese.png',
              height: 24.0,
            ),
            SizedBox(width: 8.0),
            Text('Burger'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.circle, color: Colors.white, size: 50),
            onPressed: () {
              // Navigator.pushNamed(context, '/search');
            },
          ),
        ],
        centerTitle: true, // Center the title in the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0), // Margin for the whole body
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20), // Bottom padding to separate from GridView
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search), // Search icon on the left
                  hintText: 'Search', // Placeholder text
                  suffixIcon: IconButton(
                    icon: Icon(Icons.tune_outlined), // Suffix icon button
                    onPressed: () {
                      // Handle the filter button press
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none, // Remove the border line
                  ),
                  filled: true,
                  fillColor: Colors.grey[200], // Grey background color
                ),
              ),
            ),
            
            // Commented-out GridView code
            // Expanded(
            //   child: GridView.builder(
            //     padding: EdgeInsets.zero, // Remove default padding
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2, // Two columns
            //       crossAxisSpacing: 8.0,
            //       mainAxisSpacing: 8.0,
            //       childAspectRatio: 0.7, // Adjust to fit the card size
            //     ),
            //     itemCount: 4, // Adjust based on the number of items
            //     itemBuilder: (context, index) {
            //       return BurgerCard();
            //     },
            //   ),
            // ),
            
            BlocBuilder<GroceryBloc, GroceryState>(
              builder: (context, state) {
                if (state is GroceryLoadingState) {
                       print('loading');
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is Gloceryfailed) {
                  print('error');
                  return Center(child: Text(state.errorMessage));
                }

                if (state is GroceryLoadedState) {
                  print('loaded');
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: () => _onRefresh(context),
                      child: GridView.builder(
                        padding: EdgeInsets.zero, // Remove default padding
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Two columns
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 0.7, // Adjust to fit the card size
                        ),
                        itemCount: state.products.length, // Adjust based on the number of items
                        itemBuilder: (context, index) {
                          final product = state.products[index];
                          return BurgerCard(product: product);
                        },
                      ),
                    ),
                  );
                }

                return const SizedBox(); // Return an empty widget if none of the states match
              },
            ),
          ],
        ),
      ),
    );
  }
}
