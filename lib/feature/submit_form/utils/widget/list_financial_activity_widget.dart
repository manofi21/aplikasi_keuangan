import 'package:aplikasi_keuangan/feature/financial_activity/domain/entities/financial_activity_status.dart';
import 'package:aplikasi_keuangan/ui_export.dart';
import 'package:intl/intl.dart';
import '../../../../core/converter/currency_idr_string.dart';
import '../../../financial_activity/domain/entities/financial_activity.dart';
import '../../persentation/provider/list_financial_acitivity_provider.dart';

class ListFinancialActivityWidget extends StatefulWidget {
  const ListFinancialActivityWidget({super.key});

  @override
  State<ListFinancialActivityWidget> createState() =>
      _ListFinancialActivityWidgetState();
}

class _ListFinancialActivityWidgetState
    extends State<ListFinancialActivityWidget> {
  @override
  Widget build(BuildContext context) {
    final financialActivityProv = context.watch<ListFinancialActivityProvider>();
    if (financialActivityProv.isLoading) {
      return const Center(child: CircularProgressIndicator(),);
    }

    final listFinancialActivity = financialActivityProv.listFinancialActivity;
    return ListView.separated(
      itemCount: listFinancialActivity.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
      itemBuilder: (context, index) {
        return FinancialActivityItem(
          financialActivity: listFinancialActivity[index],
        );
      },
    );
  }
}

class FinancialActivityItem extends StatelessWidget {
  final FinancialActivity financialActivity;
  const FinancialActivityItem({Key? key, required this.financialActivity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget childItem(String title, String content) {
      final theme = Theme.of(context);
      return Row(children: [
        Expanded(
            flex: 2,
            child: Text(
              title,
              style: theme.textTheme.bodyLarge,
            )),
        const Text(":"),
        const SizedBox(
          width: 15,
        ),
        Expanded(
            flex: 2,
            child: Text(
              content,
              style: theme.textTheme.bodyLarge,
            )),
      ]);
    }

    return Card(
      margin: const EdgeInsets.only(left: 20, top: 10, bottom: 20, right: 20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            childItem("Status", financialActivity.status.asStringTitle),
            childItem("Category", financialActivity.category),
            childItem(
              "Date",
              DateFormat('EEEE MMMM yyyy, h:mm a')
                  .format(financialActivity.dateTime),
            ),
            childItem("Amount", currencyIdrString(financialActivity.amount)),
            childItem("Memo", financialActivity.memo ?? ' - '),
          ],
        ),
      ),
    );
  }
}
