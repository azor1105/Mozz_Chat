import 'package:chat/src/core/extensions/date_extensions.dart';
import 'package:chat/src/core/theme/app_text_styles.dart';
import 'package:chat/src/core/theme/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DateItem extends StatelessWidget {
  const DateItem({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: AppUtils.primaryDivider),
          Padding(
            padding: AppUtils.horizontal10,
            child: Text(
              dateTime.isToday ? 'Сегодня' : dateTime.formatToDate,
              style: AppTextStyles.labelMedium,
            ),
          ),
          const Expanded(child: AppUtils.primaryDivider),
        ],
      ),
    );
  }

  final int dateTime;
}
