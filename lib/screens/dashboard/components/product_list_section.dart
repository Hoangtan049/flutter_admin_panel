import '../../../core/data/data_provider.dart';
import '../../../models/product.dart';
import 'add_product_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utility/constants.dart';
import '../../../utility/numbers.dart';
class ProductListSection extends StatefulWidget {
  const ProductListSection({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductListSection> createState() => _ProductListSectionState();
}

class _ProductListSectionState extends State<ProductListSection> {

    @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     DataProvider dataProvider = Provider.of<DataProvider>(context, listen: false);
    dataProvider.getAllProduct();
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tất cả sản phẩm",
            style: Theme
                .of(context)
                .textTheme
                .titleMedium,
          ),
          SizedBox(
            width: double.infinity,
            child: Consumer<DataProvider>(
              builder: (context, dataProvider, child) {
                return DataTable(
                  columnSpacing: defaultPadding,
                  // minWidth: 600,
                  columns: [
                    DataColumn(
                      label: Text("Tên sản phẩm"),
                    ),
                    DataColumn(
                      label: Text("Danh mục"),
                    ),
                    // DataColumn(
                    //   label: Text("Sub Category"),
                    // ),
                    DataColumn(
                      label: Text("Giá"),
                    ),
                    DataColumn(
                      label: Text("Sửa"),
                    ),
                    DataColumn(
                      label: Text("Xóa"),
                    ),
                  ],
                  rows: List.generate(
                    dataProvider.products.length,
                        (index) => productDataRow(dataProvider.products[index],edit: () {
                          showAddProductForm(context, dataProvider.products[index]);
                        },
                          delete: () {
                            //TODO: should complete call deleteProduct
                          },),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

DataRow productDataRow(Product productInfo,{Function? edit, Function? delete}) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Image.network(
              productInfo.image ?? '',
              height: 30,
              width: 30,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return Icon(Icons.error);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(productInfo.name ?? ''),
            ),
          ],
        ),
      ),
      DataCell(Text(productInfo.proCategoryId?.name ?? 'Đồ uống')),
      //DataCell(Text(productInfo.proSubCategoryId?.name ?? '')),
      DataCell(Text('${numberFormatter(productInfo.price ?? 9000)}'),),
      DataCell(IconButton(
          onPressed: () {
            if (edit != null) edit();
          },
          icon: Icon(
            Icons.edit,
            color: Colors.white,
          ))),
      DataCell(IconButton(
          onPressed: () {
            if (delete != null) delete();
          },
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ))),
    ],
  );
}
