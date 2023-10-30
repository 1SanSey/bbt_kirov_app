class AppConstants {
  static const Map<int, String> category = {
    0: 'ВСЕ КНИГИ',
    1: 'МАЛЕНЬКИЕ\n(< 150 стр.)',
    2: 'СРЕДНИЕ\n(150-299 стр.)',
    3: 'БОЛЬШИЕ\n(300-499 стр.)',
    4: 'МАХАБОЛЬШИЕ\n(> 500 стр.)',
    5: 'БХАГАВАД-ГИТА',
    6: 'ШРИМАД\nБХАГАВАТАМ',
    7: 'ШРИ ЧАЙТАНЬЯ\nЧАРИТАМРИТА',
    8: 'КОМПЛЕКТЫ',
    9: 'КУЛИНАРНЫЕ',
  };

  static const List<String> imagesList = [
    'lib/core/assets/images/slides/1_quote.jpg',
    'lib/core/assets/images/slides/2_quote.jpg',
    'lib/core/assets/images/slides/3_quote.jpg'
  ];

  static const String bbtLogo = 'lib/core/assets/images/logo/bbt_logo.webp';

  static const loggedInPref = "loggedInPref";
  static const usernamePref = "usernamePref";
  static const emailPref = "emailPref";
  static const photoPref = "photoPref";
}
