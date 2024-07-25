import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/data/data_provider.dart';
import '../../../models/product_summery_info.dart';
import '../../../utility/constants.dart';
import 'product_summery_card.dart';

class ProductSummerySection extends StatelessWidget {
  const ProductSummerySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Consumer<DataProvider>(
      builder: (context, dataProvider, _) {
        int totalProduct = dataProvider.products.length;
        int outOfStockProduct = 0;
        int limitedStockProduct = 0;
        int otherStockProduct =
            totalProduct - outOfStockProduct - limitedStockProduct;

        List<ProductSummeryInfo> productSummeryItems = [
            ProductSummeryInfo(
              title: "Tất cả sản phẩm",
              productsCount: totalProduct,
              svgSrc: "assets/icons/product.svg",
              color: primaryColor,
              percentage: 100,
            ),
            ProductSummeryInfo(
              title: "Hết hàng",
              productsCount: outOfStockProduct,
              svgSrc: "assets/icons/stock_out.svg",
              color: Color(0xFFEA3829),
              percentage: totalProduct != 0
                ? (outOfStockProduct / totalProduct) * 100
                : 0,
          ),
          ProductSummeryInfo(
            title: "Số lượng còn ít",
            productsCount: limitedStockProduct,
            svgSrc: "assets/icons/product.svg",
            color: Color(0xFFECBE23),
            percentage: totalProduct != 0
                ? (limitedStockProduct / totalProduct) * 100
                : 0,
          ),
          ProductSummeryInfo(
            title: "Khác",
            productsCount: otherStockProduct,
            svgSrc: "assets/icons/product.svg",
            color: Color(0xFF47e228),
            percentage: totalProduct != 0
                ? (otherStockProduct / totalProduct) * 100
                : 0,
          ),
        ];

        return Column(
          children: [
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: productSummeryItems.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: defaultPadding,
                mainAxisSpacing: defaultPadding,
                childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
              ),
              itemBuilder: (context, index) => ProductSummeryCard(
                info: productSummeryItems[index],
                onTap: (productType) {
                  //TODO: should complete call filterProductsByQuantity
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
