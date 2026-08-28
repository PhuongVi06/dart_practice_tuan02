import 'package:collection/collection.dart';

import 'HoaDon.dart';
import 'HoaDonCN.dart';
import 'HoaDonCT.dart';
import 'HoaDonDL.dart';
import 'HoaDon_TG.dart';

import 'dart:io';

class QL_HoaDon {
  List<HoaDon> lstHoaDon = [];

  String input(String label) {
    stdout.write(label);
    return stdin.readLineSync() ?? '';
  }

  void add(HoaDon hd) {
    lstHoaDon.add(hd);
  }

  void Nhap_1hd_CN(HoaDonCN hd) {
    hd.Nhap();
  }

  void Nhap_1hd_DL(HoaDonDL hd) {
    hd.Nhap();
  }

  void Nhap_1hd_CT(HoaDonCT hd) {
    hd.Nhap();
  }

  void Xuat() {
    for (var hd in lstHoaDon) {
      print("Mã khách hàng: ${hd.maKH}");
      print("Tên khách hàng: ${hd.tenKH}");
      print("Số lượng: ${hd.soluong}");
      print("Giá bán: ${hd.giaban}");
      print("Chiết khấu: ${hd.chietkhau()}");
      print("VAT: ${hd.VAT()}");
      print("Thành tiền: ${hd.thanhTien()}");
    }
  }

  double TongThanhTien() {
    double tong = 0;
    for (var hd in lstHoaDon) {
      tong += hd.thanhTien();
    }
    return tong;
  }

  double TongTroGia() {
    double tong = 0;
    for (var hd in lstHoaDon) {
      if (hd is ITroGia) {
        tong += (hd as ITroGia).troGia();
      }
    }
    return tong;
  }

  void KH_MuaMax() {
    if (lstHoaDon.isEmpty) {
      print("Danh sách hóa đơn rỗng!");
      return;
    }

    double max = lstHoaDon[0].thanhTien();
    for (var hd in lstHoaDon) {
      if (hd.thanhTien() > max) {
        max = hd.thanhTien();
      }
    }

    print("Khách hàng mua nhiều nhất (Thành tiền: $max):");
    for (var hd in lstHoaDon) {
      if (hd.thanhTien() == max) {
        print("Mã KH: ${hd.maKH} - Tên KH: ${hd.tenKH}");
      }
    }
  }

  double tongchietkhau_CT() {
    double tong = 0;
    for (var hd in lstHoaDon) {
      if (hd is HoaDonCT) {
        tong += hd.chietkhau();
      }
    }
    return tong;
  }

 void sapXep() {
  lstHoaDon.sort((a, b) {
    int cmp = a.soluong.compareTo(b.soluong);
    if (cmp == 0) {
      cmp = b.thanhTien().compareTo(a.thanhTien());
    }

    return cmp;
  });
}
  void TimHD_MaKH(String ma) {
    String maKh = ma.trim();
    if (maKh.isEmpty) {
      print("Khách hàng lạ (Mã không hợp lệ)");
      return;
    }

    bool timThay = false;
    for (var hd in lstHoaDon) {
      if (hd.maKH == maKh) {
        print("Thông tin hóa đơn của khách hàng có mã $maKh:");
        print("Tên KH: ${hd.tenKH} | Thành tiền: ${hd.thanhTien()}");
        timThay = true;
      }
    }

    if (!timThay) {
      print("Không tìm thấy hóa đơn nào cho mã $maKh");
    }
  }
}
