import 'dart:io';

import 'package:dart_application_tuan_02/MonHoc.dart';
import 'package:dart_application_tuan_02/LyThuyet.dart';
import 'package:dart_application_tuan_02/ThucHanh.dart';
import 'package:dart_application_tuan_02/DoAn.dart';

void main() async {
  List<MonHoc> dsMonHoc = [];

  // Đọc dữ liệu từ file monhoc.txt
  File file = File('monhoc.txt');
  if (await file.exists()) {
    List<String> lines = await file.readAsLines();
    for (var line in lines) {
      if (line.trim().isEmpty) continue;
      var p = line.split('#');
      String loai = p[0], ma = p[1], ten = p[2];
      int tc = int.parse(p[3]);

      if (loai == 'LT')
        dsMonHoc.add(
          LyThuyet(ma, ten, tc, double.parse(p[4]), double.parse(p[5])),
        );
      if (loai == 'TH')
        dsMonHoc.add(
          ThucHanh(
            ma,
            ten,
            tc,
            double.parse(p[4]),
            double.parse(p[5]),
            double.parse(p[6]),
          ),
        );
      if (loai == 'DA')
        dsMonHoc.add(DoAn(ma, ten, tc, double.parse(p[4]), double.parse(p[5])));
    }
    print("Đã đọc ${dsMonHoc.length} môn từ file.");
  }

  // Nhập thêm môn từ bàn phím (Nhập riêng lẻ từng cột điểm)
  stdout.write("\nNhập số lượng môn muốn thêm: ");
  int n = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  for (int i = 0; i < n; i++) {
    print("\n--- Nhập thông tin môn thứ ${i + 1} ---");
    stdout.write("Loại môn (1-Lý thuyết, 2-Thực hành, 3-Đồ án): ");
    int loai = int.parse(stdin.readLineSync()!);
    stdout.write("Mã môn: ");
    String ma = stdin.readLineSync()!;
    stdout.write("Tên môn: ");
    String ten = stdin.readLineSync()!;
    stdout.write("Số tín chỉ: ");
    int tc = int.parse(stdin.readLineSync()!);

    if (loai == 1) {
      stdout.write("-> Nhập điểm tiểu luận: ");
      double dTL = double.parse(stdin.readLineSync()!);
      stdout.write("-> Nhập điểm cuối kỳ: ");
      double dCK = double.parse(stdin.readLineSync()!);
      dsMonHoc.add(LyThuyet(ma, ten, tc, dTL, dCK));
    } else if (loai == 2) {
      stdout.write("-> Nhập điểm kiểm tra 1: ");
      double d1 = double.parse(stdin.readLineSync()!);
      stdout.write("-> Nhập điểm kiểm tra 2: ");
      double d2 = double.parse(stdin.readLineSync()!);
      stdout.write("-> Nhập điểm kiểm tra 3: ");
      double d3 = double.parse(stdin.readLineSync()!);
      dsMonHoc.add(ThucHanh(ma, ten, tc, d1, d2, d3));
    } else if (loai == 3) {
      stdout.write("-> Nhập điểm GV hướng dẫn: ");
      double dGVHD = double.parse(stdin.readLineSync()!);
      stdout.write("-> Nhập điểm GV phản biện: ");
      double dGVPB = double.parse(stdin.readLineSync()!);
      dsMonHoc.add(DoAn(ma, ten, tc, dGVHD, dGVPB));
    }
  }

  // In danh sách môn học kèm điểm chi tiết
  print("\nDanh sách môn học:");
  dsMonHoc.forEach((m) => m.hienThiThongTin());

  // Kiểm tra danh sách có tăng dần theo tên không
  bool isSortedByName = true;
  for (int i = 0; i < dsMonHoc.length - 1; i++) {
    if (dsMonHoc[i].tenMon.compareTo(dsMonHoc[i + 1].tenMon) > 0) {
      isSortedByName = false;
      break;
    }
  }
  print(
    "\nDanh sách ${isSortedByName ? 'ĐÃ' : 'CHƯA'} sắp xếp tăng dần theo tên.",
  );

  // Sắp xếp tăng dần theo số tín chỉ
  dsMonHoc.sort((a, b) => a.soTinChi.compareTo(b.soTinChi));
  print("\nDanh sách sau khi xếp tăng dần theo tín chỉ:");
  dsMonHoc.forEach((m) => m.hienThiThongTin());

  // Lọc môn có số tín chỉ cao nhất
  int maxTC = dsMonHoc.map((m) => m.soTinChi).reduce((a, b) => a > b ? a : b);
  print("\nCác môn có tín chỉ cao nhất ($maxTC TC):");
  dsMonHoc
      .where((m) => m.soTinChi == maxTC)
      .forEach((m) => m.hienThiThongTin());

  // Tìm môn theo tên, thêm mới từng loại điểm nếu không tìm thấy
  stdout.write("\nNhập tên môn cần tìm: ");
  String timTen = stdin.readLineSync()!.trim();
  var timThay = dsMonHoc.where(
    (m) => m.tenMon.toLowerCase() == timTen.toLowerCase(),
  );

  if (timThay.isNotEmpty) {
    print("Thông tin môn tìm thấy:");
    timThay.forEach((m) => m.hienThiThongTin());
  } else {
    print("Không tìm thấy. Tiến hành thêm mới môn '$timTen'...");
    stdout.write("Mã môn mới: ");
    String maMoi = stdin.readLineSync()!;
    stdout.write("Số tín chỉ: ");
    int tcMoi = int.parse(stdin.readLineSync()!);
    stdout.write("-> Nhập điểm tiểu luận: ");
    double dTL = double.parse(stdin.readLineSync()!);
    stdout.write("-> Nhập điểm cuối kỳ: ");
    double dCK = double.parse(stdin.readLineSync()!);

    dsMonHoc.add(LyThuyet(maMoi, timTen, tcMoi, dTL, dCK));
    print("Đã thêm môn mới vào cuối danh sách!");
  }

  // Tính số tín chỉ trung bình
  if (dsMonHoc.isNotEmpty) {
    double tongTC = dsMonHoc.fold(0, (sum, m) => sum + m.soTinChi);
    double tbTC = tongTC / dsMonHoc.length;
    print("\nSố tín chỉ trung bình: ${tbTC.toStringAsFixed(2)}");
  }
}
