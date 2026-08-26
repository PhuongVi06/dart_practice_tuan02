abstract class MonHoc {
  String maMon = '';
  String tenMon = '';
  int soTinChi = 0;

  MonHoc(this.maMon, this.tenMon, this.soTinChi);

  //  hệ 10
  double tinhDTB();

  // Quy đổi hệ 4 & điểm chữ
  String quyDoiDiem() {
    double dtb = tinhDTB();
    if (dtb >= 8.5) return 'A (4.0)';
    if (dtb >= 7.0) return 'B (3.0)';
    if (dtb >= 5.5) return 'C (2.0)';
    if (dtb >= 4.0) return 'D (1.0)';
    return 'F (0.0)';
  }

  void hienThiThongTin() {
    print(
      "Mã: $maMon | Tên: $tenMon | Tín chỉ: $soTinChi | DTB: ${tinhDTB().toStringAsFixed(2)} | Điểm chữ: ${quyDoiDiem()}",
    );
  }
}
