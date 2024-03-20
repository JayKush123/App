import 'dart:convert';

import 'package:hive/hive.dart';

part 'ad_banner.g.dart';

@HiveType(typeId: 1)
class AdBanner {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String image;

  AdBanner({required this.id, required this.image});
  factory AdBanner.fromJson(Map<String, dynamic> data) =>
      AdBanner(id: data['id'], image: data['mobile']);
}

List<AdBanner> addBannerListFromJson(String val) => List<AdBanner>.from(json
    .decode(val)['data']['banners']
    .map((banner) => AdBanner.fromJson(banner)));
