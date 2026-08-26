import 'package:dart_application_tuan_02/Phong.dart';
import 'package:dart_application_tuan_02/PhongA.dart';
import 'package:dart_application_tuan_02/PhongB.dart';

import 'dart:io';

void main() async {
  List<PhongTro> dsPhong = [];
  File file = File('phongthue.txt');

  if (!await file.exists()) {
    print("Không tìm thấy file!");
    return;
  }

  // Đọc file theo từng dòng
  List<String> lines = await file.readAsLines();
  for (var line in lines) {
    if (line.trim().isEmpty) continue;

    // Bổ dữ liệu thành từng mảng qua dấu #
    List<String> parts = line.split('#');
    String maPhong = parts[0];
    int soNguoi = int.parse(parts[1]);
    double soDien = double.parse(parts[2]);
    double soNuoc = double.parse(parts[3]);

    if (maPhong.startsWith('A')) {
      dsPhong.add(
        PhongLoaiA(maPhong, soNguoi, soDien, soNuoc, int.parse(parts[4])),
      );
    } else if (maPhong.startsWith('B')) {
      dsPhong.add(
        PhongLoaiB(
          maPhong,
          soNguoi,
          soDien,
          soNuoc,
          double.parse(parts[4]),
          int.parse(parts[5]),
        ),
      );
    }
  }

  // 1. In toàn bộ danh sách phòng
  print("1. TẤT CẢ PHÒNG");
  dsPhong.forEach((p) => p.hienThiThongTin());

  // 2. Lọc phòng có trên 2 người ở
  print("\n2. PHÒNG CÓ > 2 NGƯỜI");
  dsPhong.where((p) => p.soNguoi > 2).forEach((p) => p.hienThiThongTin());

  // 3. Tính tổng tiền toàn bộ phòng
  double tongTien = dsPhong.fold(0, (sum, p) => sum + p.tinhTienPhong());
  print("\n3. TỔNG TIỀN PHÒNG: $tongTien");

  // 4. Sắp xếp số điện giảm dần (b so sánh với a)
  dsPhong.sort((a, b) => b.soDien.compareTo(a.soDien));
  print("\n4. PHÒNG GIẢM DẦN THEO SỐ ĐIỆN");
  dsPhong.forEach((p) => p.hienThiThongTin());

  // 5. Lọc lấy các phòng thuộc Class PhongLoaiA
  print("\n5. PHÒNG LOẠI A");
  dsPhong.whereType<PhongLoaiA>().forEach((p) => p.hienThiThongTin());
}
