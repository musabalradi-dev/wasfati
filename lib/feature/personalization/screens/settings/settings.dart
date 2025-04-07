import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wasfati/common/widgets/texts/section_heading.dart';
import 'package:wasfati/feature/personalization/controllers/settings/settings.dart';
import 'package:wasfati/feature/personalization/screens/about/about.dart';
import 'package:wasfati/feature/personalization/screens/settings/widgets/settings_menu_tile.dart';
import 'package:wasfati/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(title: Text('settings'.tr),),
      body: Obx(() => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeading(title: 'general', showActionButton: false,),
              SizedBox(height: MySizes.spaceBtwItem,),
              SettingsMenuTile(icon: Iconsax.moon,
                title: 'darkMode',
                trailing:
                Switch(value: controller.isDarkMode.value,
                  onChanged: (value) => controller.changeTheme(value),),),
              SettingsMenuTile(icon: Iconsax.translate,
                title: 'language',
                trailing:DropdownButton<String>(
                  value: controller.language,
                  icon: const Icon(Icons.language),
                  items: [
                    DropdownMenuItem(
                      value: 'en',
                      child: Text('english'.tr),
                    ),
                    DropdownMenuItem(
                      value: 'ar',
                      child: Text('arabic'.tr),
                    ),
                  ],
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      controller.changeLanguage(newValue);
                    }
                  },
                ),
              ),

              SettingsMenuTile(
                onPressed: () =>  Get.dialog(const AboutUsDialog()), icon: Iconsax.info_circle, title: 'about',),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
