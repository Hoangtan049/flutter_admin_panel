import '../../../utility/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(
              "assets/images/logo.png",
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.image),
            ),
          ),
          DrawerListTile(
            title: "Trang chủ",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {
              context.mainScreenProvider.navigateToScreen('Dashboard');
            },
          ),
          DrawerListTile(
            title: "Danh mục",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              context.mainScreenProvider.navigateToScreen('Category');
            },
          ),
          // DrawerListTile(
          //   title: "Sub Category",
          //   svgSrc: "assets/icons/menu_task.svg",
          //   press: () {
          //     context.mainScreenProvider.navigateToScreen('SubCategory');
          //   },
          // ),
          // DrawerListTile(
          //   title: "Brands",
          //   svgSrc: "assets/icons/menu_doc.svg",
          //   press: () {
          //     context.mainScreenProvider.navigateToScreen('Brands');
          //   },
          // ),
          // DrawerListTile(
          //   title: "Variant Type",
          //   svgSrc: "assets/icons/menu_store.svg",
          //   press: () {
          //     context.mainScreenProvider.navigateToScreen('VariantType');
          //   },
          // ),
          // DrawerListTile(
          //   title: "Variants",
          //   svgSrc: "assets/icons/menu_notification.svg",
          //   press: () {
          //     context.mainScreenProvider.navigateToScreen('Variants');
          //   },
          // ),
          DrawerListTile(
            title: "Đơn hàng",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {
              context.mainScreenProvider.navigateToScreen('Order');
            },
          ),
          DrawerListTile(
            title: "Mã khuyến mãi",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {
              context.mainScreenProvider.navigateToScreen('Coupon');
            },
          ),
          // DrawerListTile(
          //   title: "Posters",
          //   svgSrc: "assets/icons/menu_doc.svg",
          //   press: () {
          //     context.mainScreenProvider.navigateToScreen('Poster');
          //   },
          // ),
          // DrawerListTile(
          //   title: "Notifications",
          //   svgSrc: "assets/icons/menu_notification.svg",
          //   press: () {
          //     context.mainScreenProvider.navigateToScreen('Notifications');
          //   },
          // ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(svgSrc, height: 16, color: Colors.white54),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
