import 'MonHoc.dart';

class DoAn extends MonHoc {
  double diemGVHD = 0;
  double diemGVPB = 0;

  DoAn(String maMon, String tenMon, int soTinChi, this.diemGVHD, this.diemGVPB)
    : super(maMon, tenMon, soTinChi);

  @override
  double tinhDTB() => (diemGVHD + diemGVPB) / 2;
}
