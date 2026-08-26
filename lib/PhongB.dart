import 'Phong.dart';

class PhongLoaiB extends PhongTro {
  double giatui = 0;
  int somay = 0;

  PhongLoaiB(
    String maPhong,
    int soNguoi,
    double soDien,
    double soNuoc,
    this.giatui,
    this.somay,
  ) : super(maPhong, soNguoi, soDien, soNuoc);

  // Getter & Setter
  double get Giatui => giatui;
  set Giatui(double value) {
    if (value >= 0) giatui = value;
  }

  int get Somay => somay;
  set Somay(int value) {
    if (value >= 0) somay = value;
  }

  @override
  double tinhTienPhong() {
    return 2000 + (2 * soDien) + (8 * soNuoc) + (giatui * 5) + (somay * 100);
  }

  @override
  void hienThiThongTin() {
    super.hienThiThongTin();
    print(
      "Loại: B | Giặt ủi: $giatui kg | Số máy internet: $somay | Tiền phòng: ${tinhTienPhong()}",
    );
  }
}
