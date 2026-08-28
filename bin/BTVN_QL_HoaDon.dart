import 'package:dart_application_tuan_02/HoaDon.dart';
import 'package:dart_application_tuan_02/HoaDonCN.dart';
import 'package:dart_application_tuan_02/HoaDonCT.dart';
import 'package:dart_application_tuan_02/HoaDonDL.dart';
import 'dart:io';
import 'package:dart_application_tuan_02/QLHoaDon.dart';

String input(String label) {
  stdout.write(label);
  return stdin.readLineSync() ?? '';
}
void main(List<String> arguments) {
  QL_HoaDon ql=QL_HoaDon();
  while (true) {
    print('\Menu quản lý hoá đơn');
    print('1. Nhập Hóa đơn Cá nhân');
    print('2. Nhập Hóa đơn Đsị lý');
    print('3. Nhập Hóa đơn Công ty');
    print('4. Xuất tất cả Hóa đơn');
    print('5. Sắp xếp danh sách (tăng dần theo Số lượng, giảm dần theo Thành tiền)');
    print('6. Tính Tổng thành tiền tất cả Hóa đơn');
    print('7. Tính Tổng tiền Trợ giá');
    print('8. Tính Tổng chiết khấu của Hóa đơn Công ty');
    print('9. Tìm Khách hàng mua nhiều nhất');
    print('10. Tìm Hóa đơn theo Mã Khách hàng');
    print('0. Thoát');
    print('------------------------------------------------');

    String chon = input('Mời bạn chọn chức năng (0-10): ');

    switch (chon) {
      case '1':
        print('\n--- Nhập Hóa đơn Cá nhân ---');
        HoaDonCN hdCN = HoaDonCN();
        ql.Nhap_1hd_CN(hdCN);
        ql.lstHoaDon.add(hdCN);
        print('=> Thêm hóa đơn thành công!');
        break;

      case '2':
        print('\n--- Nhập Hóa đơn Đa lợi ---');
        HoaDonDL hdDL = HoaDonDL();
        ql.Nhap_1hd_DL(hdDL);
        ql.lstHoaDon.add(hdDL);
        print('=> Thêm hóa đơn thành công!');
        break;

      case '3':
        print('\n--- Nhập Hóa đơn Công ty ---');
        HoaDonCT hdCT = HoaDonCT();
        ql.Nhap_1hd_CT(hdCT);
        ql.add(hdCT);
        print('=> Thêm hóa đơn thành công!');
        break;

      case '4':
        if (ql.lstHoaDon.isEmpty) {
          print('\nDanh sách hóa đơn đang trống!');
        } else {
          print('\n--- DANH SÁCH HÓA ĐƠN ---');
          ql.Xuat();
        }
        break;

      case '5':
        if (ql.lstHoaDon.isEmpty) {
          print('\nDanh sách trống, không thể sắp xếp!');
        } else {
          ql.sapXep();
          print('\n=> Đã sắp xếp xong! Danh sách sau khi sắp xếp:');
          ql.Xuat();
        }
        break;

      case '6':
        print('\nTổng thành tiền của tất cả hóa đơn: ${ql.TongThanhTien()}');
        break;

      case '7':
        print('\nTổng tiền trợ giá: ${ql.TongTroGia()}');
        break;

      case '8':
        print('\nTổng chiết khấu HĐ Công ty: ${ql.tongchietkhau_CT()}');
        break;

      case '9':
        if (ql.lstHoaDon.isEmpty) {
          print('\nDanh sách hóa đơn đang trống!');
        } else {
          ql.KH_MuaMax();
        }
        break;

      case '10':
        String ma = input('\nNhập mã khách hàng cần tìm: ');
        ql.TimHD_MaKH(ma);
        break;

      case '0':
        print('\nChương trình kết thúc. Tạm biệt!');
        exit(0);

      default:
        print('\nLựa chọn không hợp lệ, vui lòng thử lại!');
    }
  }
}
