import 'package:day_bus_user/core/utils/ui_extensions.dart';
import 'package:day_bus_user/core/widgets/app_bar.dart';
import 'package:day_bus_user/features/home/presentation/widgets/offer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenOffers extends StatelessWidget {
  const ScreenOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(context: context, title: "Offers"),
      body: ListView(
        padding: EdgeInsets.all(20.w),
        children: [
          OfferCard(
            width: double.infinity,
            title: "Flat 12% off on Saturday & Sunday bookings",
            description: "A little thank-you for choosing Day Bus.",
            validity: "Valid till 25 Nov 2025",
            onApply: () {},
          ),
          20.hBox,
          OfferCard(
            width: double.infinity,
            title: "Unlock 20% off on your first Day Bus ticket",
            description: "Valid for 7 days after signup",
            validity: "", // Empty or hidden if not needed, layout might adjust
            onApply: () {},
          ),
          20.hBox,
          OfferCard(
            width: double.infinity,
            title: "Grab 10% off on trips after 9 PM",
            description: "Valid till 31 Dec 2025",
            validity: "",
            onApply: () {},
          ),
        ],
      ),
    );
  }
}
