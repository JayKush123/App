import 'package:hive/hive.dart';
import 'package:test/model/ad_banner.dart';

class LocalAdBannerService {
  late Box<AdBanner> _adBannerBox;

  Future<void> init() async {
    _adBannerBox = await Hive.openBox<AdBanner>('AdBanner');
  }

  Future<void> assignAllAdBanners({required List<AdBanner> adBanners}) async {
    await _adBannerBox.clear();
    await _adBannerBox.addAll(adBanners);
  }

  List<AdBanner> getAdBanners() => _adBannerBox.values.toList();
}
