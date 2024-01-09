import 'package:dugbet/consts/app_export.dart';

// ignore: must_be_immutable
class CustomBottomAppBar extends StatelessWidget {
  CustomBottomAppBar({
    super.key,
    this.onChanged,
  }
  );

  RxList<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
        icon: ImageConstant.home,
        activeIcon: ImageConstant.home,
        type: BottomBarEnum.Home,),
    BottomMenuModel(
      icon: ImageConstant.stat,
      activeIcon: ImageConstant.stat,
      type: BottomBarEnum.Stat,
    ),
    BottomMenuModel(
      icon: ImageConstant.wallet,
      activeIcon: ImageConstant.wallet,
      type: BottomBarEnum.Wallet,
    ),
    BottomMenuModel(
      icon: ImageConstant.setting,
      activeIcon: ImageConstant.setting,
      type: BottomBarEnum.Settings,
    )
  ].obs;

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    int indexPage = 0;
     if (Get.arguments != null) {
       indexPage = bottomMenuList.indexWhere(
           (element) => element.type == Get.arguments as BottomBarEnum);
     }

    bottomMenuList[indexPage].isSelected = true;
    return Obx(
      () => BottomAppBar(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 10,
        // add stroke color
        
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const CircularNotchedRectangle(
          // add color #ff15A69D
          
        ),
        // use color #ff15A69D
        // color: ColorPalette.white,
        
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: SizedBox(
            height: 70.v,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                bottomMenuList.length,
                (index) {
                  return InkWell(
                    onTap: () {
                      for (var element in bottomMenuList) {
                        element.isSelected = false;
                      }
                      bottomMenuList[index].isSelected = true;
                      onChanged?.call(bottomMenuList[index].type);
                      bottomMenuList.refresh();
                    },
                    child: bottomMenuList[index].isSelected
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomImageView(
                                imagePath: bottomMenuList[index].activeIcon,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                                color: appTheme.teal40002,
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.navOnSelect,
                                height: 4.v,
                                width: 24.h,
                                margin: EdgeInsets.only(top: 19.v),
                              ),
                            ],
                          )
                        : CustomImageView(
                            imagePath: bottomMenuList[index].icon,
                            height: 24.adaptSize,
                            width: 24.adaptSize,
                            color: appTheme.blueGray900,
                          ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Stat,
  Wallet,
  Settings,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
    this.isSelected = false,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;

  bool isSelected;
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
