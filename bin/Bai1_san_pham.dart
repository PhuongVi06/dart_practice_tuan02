import 'package:dart_application_tuan_02/SanPham.dart';

void main(List<String> arguments) {
  SanPham sp = SanPham();
  sp.showInfo();

  SanPham sp1 = SanPham.fullPara('SP001', 'Bánh gạo Nhật', 25000, 0);
  sp1.showInfo();
}
