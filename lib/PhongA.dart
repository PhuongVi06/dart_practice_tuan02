import 'Phong.dart';

class PhongLoaiA extends PhongTro {
  int soNguoithan = 0;
  PhongLoaiA(
    String maPhong,
    int soNguoi,
    double soDien,
    double soNuoc,
    int soNguoithan,
  ) : super(maPhong, soNguoi, soDien, soNuoc) {
    soNguoithan = soNguoithan;
  }
  // Getter & Setter
  int get SoNguoithan => soNguoithan;
  set SoNguoithan(int value) {
    if (value >= 0) soNguoithan = value;
  }

  @override
  double tinhTienPhong() {
    return 1400 + (2 * soDien) + (8 * soNuoc) + (50 * soNguoithan);
  }

  @override
  void hienThiThongTin() {
    super.hienThiThongTin();
    print(
      "Loại: A | Người thân ở lại: $soNguoithan | Tiền phòng: ${tinhTienPhong()}",
    );
  }
}
