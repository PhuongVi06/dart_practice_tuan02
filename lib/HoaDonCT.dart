import 'HoaDon.dart';
import 'HoaDon_TG.dart';
import 'dart:io';
class HoaDonCT extends HoaDon implements ITroGia {
  int soluongNV;

 
  HoaDonCT()
      : soluongNV = 0,
        super();

  HoaDonCT.dayDu(
    String maKH,
    String tenKH,
    int soluong,
    double giaban,
    this.soluongNV,
  ) : super();

@override
  double chietkhau() {
    double ck = 0;
    if (soluongNV > 5000) {
      ck = 0.07;
    } else if (soluongNV > 1000) {
      ck = 0.05;
    }
    return ck * soluong * giaban;
  }
 @override
  double troGia() {
    return 120000.0 * soluong;
  }
  void Nhap(){
    super.Nhap();
    print("Nhập số lượng nhân viên: ");
    soluongNV = int.parse(stdin.readLineSync() ?? '0');
  }

void Xuat(){
    super.Xuat();
    print("Số lượng nhân viên: ${soluongNV}");
  }
}