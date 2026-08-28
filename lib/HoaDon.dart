import 'dart:io';

abstract class HoaDon {
  String _maKH = "KH0000";
  String _tenKH = "Hùng";
  int _soluong = 0;
  double _giaban = 0.0;

  HoaDon();

  HoaDon.dayDu(String maKH, String tenKH, int soluong, double giaban) {
    this.maKH = maKH;
    this.tenKH = tenKH;
    this.soluong = soluong;
    this.giaban = giaban;
  }

  double thanhTien() {
    return (soluong * giaban) - chietkhau() + VAT();
  }

  double chietkhau();

  double VAT() {
    return 0.1 * giaban * soluong;
  }

  String get maKH => _maKH;
  set maKH(String value) {
    if (value.length == 6 &&
        value.startsWith('KH') &&
        int.tryParse(value.substring(2)) != null) {
      _maKH = value;
    } else {
      print("Mã khách hàng không hợp lệ!");
    }
  }

  String get tenKH => _tenKH;
  set tenKH(String value) {
    if (value.isNotEmpty) {
      _tenKH = value;
    } else {
      print("Tên khách hàng không hợp lệ!");
    }
  }

  int get soluong => _soluong;
  set soluong(int value) {
    if (value >= 0) {
      _soluong = value;
    } else {
      print("Số lượng không hợp lệ!");
    }
  }

  double get giaban => _giaban;
  set giaban(double value) {
    if (value >= 0) {
      _giaban = value;
    } else {
      print("Giá bán không hợp lệ!");
    }
  }

  void Nhap() {
    print("Nhập mã khách hàng: ");
    maKH = input("");
    print("Nhập tên khách hàng: ");
    tenKH = input("");
    print("Nhập số lượng: ");
    soluong = int.parse(input(""));
    print("Nhập giá bán: ");
    giaban = double.parse(input(""));
  }
  void Xuat() {
    print("Mã khách hàng: ${maKH}");
    print("Tên khách hàng: ${tenKH}");
    print("Số lượng: ${soluong}");
    print("Giá bán: ${giaban}");
    print("Chiết khấu: ${chietkhau()}");
    print("VAT: ${VAT()}");
    print("Thành tiền: ${thanhTien()}");
  }

  String input(String label) {
  stdout.write(label);
  return stdin.readLineSync() ?? '';
}

}
