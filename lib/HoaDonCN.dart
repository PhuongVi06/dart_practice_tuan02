import 'HoaDon.dart';
import 'HoaDon_TG.dart';

import 'dart:io';

class HoaDonCN extends HoaDon implements ITroGia {
  double khoangCach;
  HoaDonCN() : khoangCach = 0, super.dayDu('KH0001', 'Hoa', 2, 400000.0);
  HoaDonCN.dayDu(
    String maKH,
    String tenKH,
    int soluong,
    double giaban,
    this.khoangCach,
  ) : super();

  @override
  double chietkhau() {
    double ck = 0;

    if (soluong >= 3) {
      ck = 0.05 * giaban * soluong;
    } else
      ck = 0;

    if (khoangCach < 10) {
      ck += 50000 * soluong;
    }
    return ck;
  }

  @override
  double troGia() {
    double tg = 0.02;
    if (soluong > 2) {
      return tg * giaban * soluong + 100000;
    } else
      return tg * giaban * soluong;
  }

  void Xuat() {
    print("Mã khách hàng: ${maKH}");
    print("Tên khách hàng: ${tenKH}");
    print("Số lượng: ${soluong}");
    print("Giá bán: ${giaban}");
    print("Khoảng cách: ${khoangCach}");
    print("Chiết khấu: ${chietkhau()}");
    print("VAT: ${VAT()}");
    print("Thành tiền: ${thanhTien()}");
  }

  void Nhap() {
    super.Nhap();
    print("Nhập khoảng cách: ");
    khoangCach = double.parse(stdin.readLineSync() ?? '0');
  }
}
