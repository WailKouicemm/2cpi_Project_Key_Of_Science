
class bottomNavyItem{
  final String title;
  final String icon_asset;
  const bottomNavyItem({required this.title,required this.icon_asset});
}

const List<bottomNavyItem> bottomNavyItems = [
  bottomNavyItem(title: "Home", icon_asset: "assets/icons/home-outline.svg"),
  bottomNavyItem(title: "SCHEDULE", icon_asset: "assets/icons/schedule.svg"),
  bottomNavyItem(title: "POSTS", icon_asset: "assets/icons/post.svg"),
  bottomNavyItem(title: "COURSES", icon_asset: "assets/icons/monitor-outline.svg"),
//  bottomNavyItem(title: "STATISTICS", icon_asset: "icon"),
];