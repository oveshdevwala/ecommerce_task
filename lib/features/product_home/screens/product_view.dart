part of 'product_page.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _productHomeAppBar(context),
        body: BlocBuilder<ProductHomeBloc, ProductHomeState>(
          builder: (context, state) {
            if (state.status == ProductHomeStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.status == ProductHomeStatus.failure) {
              return Center(child: Text(state.error ?? 'No Product'));
            }
            if (state.status == ProductHomeStatus.success) {
              List<ProductModel> product = [];

              if (state.query == null || state.query!.isEmpty) {
                product = state.products!.products!;
              } else {
                product = state.searchedProducts!.products!;
              }
              return Padding(
                padding: const EdgeInsets.all(8.0).r,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  children: product
                      .map((e) => ProductCard(
                            product: e,
                          ))
                      .toList(),
                ),
              );
            }
            return const SizedBox();
          },
        ));
  }

  AppBar _productHomeAppBar(BuildContext context) => AppBar(
        title: InkWell(
          onTap: () {
            getIt<ProductHomeBloc>().add(ProductHomeFetchEvents());
          },
          child: Text(
            'Catalogue',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 18.sp),
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(1.sw, 40),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4),
            child: TextField(
              onChanged: (value) {
                if (value.isNotEmpty) {
                  getIt<ProductHomeBloc>()
                      .add(ProductFetchBySearchEvent(value));
                }
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12).w,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12).r,
                ),
                hintText: 'Search Here',
              ),
            ),
          ),
        ),
        actions: [
          BlocSelector<CartBloc, CartState, int>(
            selector: (state) {
              return state.cartItems.length;
            },
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    Navigator.push(context, CartPage.route());
                  },
                  icon: Badge.count(
                    count: state,
                    padding: const EdgeInsets.all(1),
                    child: const Icon(Icons.shopping_cart_outlined),
                  ));
            },
          ),
          10.horizontalSpace,
        ],
      );
}
