import 'package:amazon/common/widgets/loader.dart';
import 'package:amazon/features/admin/models/sales.dart';
import 'package:amazon/features/admin/services/admin_services.dart';
// import 'package:amazon/features/admin/widgets/category_products_chart.dart';
// import 'package:flutter_charts/flutter_charts.dart' as charts;
import 'package:flutter/material.dart';

class AnalyticScreen extends StatefulWidget {
  const AnalyticScreen({super.key});

  @override
  State<AnalyticScreen> createState() => _AnalyticScreenState();
}

class _AnalyticScreenState extends State<AnalyticScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSales;
  List<Sales>? earnings;

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  getEarnings() async {
    var earningData = await adminServices.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return earnings == null || totalSales == null
        ? const Loader()
        : Column(
            children: [
              Text(
                '\$$totalSales',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // SizedBox(
              //   height: 250,
              //   child: CategoryProductsChart(
              //     seriesList: [
              //       charts.Series(
              //         id: 'Sales',
              //         data: earnings!,
              //         domainFn: (Sales sales, _) => sales.label,
              //         measureFn: (Sales sales, _) => sales.earning,
              //       )
              //     ],
              //   ),
              // )
            ],
          );
  }
}
