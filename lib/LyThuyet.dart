import 'MonHoc.dart';

class LyThuyet extends MonHoc {
  double diemTieuLuan = 0;
  double diemCuoiKy = 0;

  LyThuyet(
    String maMon,
    String tenMon,
    int soTinChi,
    this.diemTieuLuan,
    this.diemCuoiKy,
  ) : super(maMon, tenMon, soTinChi);

  @override
  double tinhDTB() => (diemTieuLuan * 0.3) + (diemCuoiKy * 0.7);
}
