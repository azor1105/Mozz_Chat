import 'package:chat/src/controllers/main/main_controller.dart';
import 'package:chat/src/core/theme/app_colors.dart';
import 'package:chat/src/core/theme/app_text_styles.dart';
import 'package:chat/src/core/theme/app_utils.dart';
import 'package:chat/src/presentation/components/dialogs/ask_dialog.dart';
import 'package:chat/src/presentation/components/fields/input_field.dart';
import 'package:chat/src/presentation/ui/main/widgets/user_item.dart';
import 'package:chat/src/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<MainController>(
          builder: (controller) {
            return Column(
              children: [
                // Header
                Padding(
                  padding: AppUtils.horizontal20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppUtils.height14,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Чаты',
                            style: AppTextStyles.titleLarge,
                          ),
                          IconButton(
                            onPressed: () {
                              Get.dialog(
                                AskDialog(
                                  title: 'Выйти?',
                                  description: 'Вы уверены что хотите выйти?',
                                  onTap: controller.logOut,
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.logout,
                              color: AppColors.lightRed,
                            ),
                          ),
                        ],
                      ),
                      AppUtils.height12,
                      InputField(
                        focusNode: controller.searchFocus,
                        controller: controller.searchController,
                        hintText: 'Поиск',
                        prefixIcon: CupertinoIcons.search,
                        onChanged: controller.onSearch,
                        onSuffixTap: controller.clearSearch,
                        suffixIcon: controller.searchController.text.isNotEmpty
                            ? CupertinoIcons.xmark
                            : null,
                      ),
                      AppUtils.height20,
                    ],
                  ),
                ),
                AppUtils.primaryDivider,
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      var user = controller.users[index];
                      return UserItem(
                        user: user,
                        onTap: () => Get.toNamed(
                          AppRoutes.chat,
                          arguments: user,
                        ),
                      );
                    },
                    itemCount: controller.users.length,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
