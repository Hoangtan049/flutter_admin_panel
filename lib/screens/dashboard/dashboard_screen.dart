import 'components/dash_board_header.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../utility/constants.dart';
import 'components/add_product_form.dart';
import 'components/order_details_section.dart';
import 'components/product_list_section.dart';
import 'components/product_summery_section.dart';
import 'package:admin_panel/core/data/data_provider.dart';


class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
    DataProvider dataProvider = new DataProvider();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            DashBoardHeader(),
            Gap(defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "My Products",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          ElevatedButton.icon(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: defaultPadding * 1.5,
                                vertical: defaultPadding,
                              ),
                            ),
                            onPressed: () {
                              showAddProductForm(context, null);
                            },
                            icon: Icon(Icons.add),
                            label: Text("Add New"),
                          ),
                          Gap(20),
                          IconButton(
                              onPressed: () async {
                                //TODO: should complete call getAllProduct
                                var result = await dataProvider.getAllProduct();
                              },
                              icon: Icon(Icons.refresh)),
                        ],
                      ),
                      Gap(defaultPadding),
                      ProductSummerySection(),
                      Gap(defaultPadding),
                      ProductListSection(),
                    ],
                  ),
                ),
                SizedBox(width: defaultPadding),
                Expanded(
                  flex: 2,
                  child: OrderDetailsSection(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
