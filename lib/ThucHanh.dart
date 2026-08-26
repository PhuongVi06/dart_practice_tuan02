import 'MonHoc.dart';

class ThucHanh extends MonHoc {
  double diem1 = 0, diem2 = 0, diem3 = 0;

  ThucHanh(
    String maMon,
    String tenMon,
    int soTinChi,
    this.diem1,
    this.diem2,
    this.diem3,
  ) : super(maMon, tenMon, soTinChi);

  @override
  double tinhDTB() => (diem1 + diem2 + diem3) / 3;
}
