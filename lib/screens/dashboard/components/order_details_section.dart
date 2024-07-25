import '../../../core/data/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utility/constants.dart';
import 'chart.dart';
import 'order_info_card.dart';

class OrderDetailsSection extends StatelessWidget {
  const OrderDetailsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, dataProvider, child) {
        //TODO: should complete Make this order number dynamic bt calling calculateOrdersWithStatus
        int totalOrder = 0;
        int pendingOrder = 0;
        int processingOrder = 0;
        int cancelledOrder = 0;
        int shippedOrder = 0;
        int deliveredOrder = 0;
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
                "Chi tiết đơn hàng",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: defaultPadding),
              Chart(),
              OrderInfoCard(
                svgSrc: "assets/icons/delivery.svg",
                title: "Tất cả đơn hàng",
                totalOrder: totalOrder,
              ),
              OrderInfoCard(
                svgSrc: "assets/icons/pending_delivery.svg",
                title: "Đang chờ phê duyệt",
                totalOrder: pendingOrder,
              ),
              OrderInfoCard(
                svgSrc: "assets/icons/process_delivery.svg",
                title: "Đơn đã xử lý",
                totalOrder: processingOrder,
              ),
              OrderInfoCard(
                svgSrc: "assets/icons/delivery.svg",
                title: "Đơn đã hủy",
                totalOrder: cancelledOrder,
              ),
              OrderInfoCard(
                svgSrc: "assets/icons/delivery.svg",
                title: "Đơn đã giao",
                totalOrder: shippedOrder,
              ),
              
            ],
          ),
        );
      },
    );
  }
}
