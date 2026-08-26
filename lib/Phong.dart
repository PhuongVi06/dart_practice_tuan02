abstract class PhongTro {
  String maPhong = '';
  int soNguoi = 0;
  double soDien = 0;
  double soNuoc = 0;

  PhongTro(this.maPhong, this.soNguoi, this.soDien, this.soNuoc);

  // Getter & Setter
  String get MaPhong => maPhong;
  set MaPhong(String value) => maPhong = value;

  int get SoNguoi => soNguoi;
  set SoNguoi(int value) {
    if (value >= 0) soNguoi = value;
  }

  double get SoDien => soDien;
  set SoDien(double value) {
    if (value >= 0) soDien = value;
  }

  double get SoNuoc => soNuoc;
  set SoNuoc(double value) {
    if (value >= 0) soNuoc = value;
  }

  double tinhTienPhong();

  void hienThiThongTin() {
    print(
      "Mã phòng: $maPhong | Số người: $soNguoi | Điện: $soDien kWh | Nước: $soNuoc m³",
    );
  }
}
