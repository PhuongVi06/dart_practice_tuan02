import 'HoaDon.dart';
import 'dart:io';

class HoaDonDL extends HoaDon {
int nam;
HoaDonDL()
      : nam = 0,
        super.dayDu('KH0001', 'Hoa', 2, 400000.0);
HoaDonDL.dayDu(
    String maKH,
    String tenKH,
    int soluong,
    double giaban,
    this.nam,
  ) : super.dayDu(maKH, tenKH, soluong, giaban);
 @override
  double chietkhau() {
    double ck = 0.3;
    int ht = nam - 5;

    if (ht > 0 && ht <= 5) {
      ck += 0.01 * ht;
    } else if (ht > 5) {
      ck = 0.35;
    }

    return ck * soluong * giaban;
  }
  void Nhap() {
    super.Nhap();
    print("Nhập năm: ");
    nam = int.parse(stdin.readLineSync() ?? '0');
  }
}