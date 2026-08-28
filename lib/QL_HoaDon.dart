import 'package:collection/collection.dart';

class QL_HoaDon{
  List<HoaDon> lstHoaDon=[];

void Nhap_1hd(HoaDon h){

  h.maKH=input("Nhập mã khách hàng: ");
  h.tenKH=input("Nhập tên khách hàng: ");
  h.soluong=int.parse(input("Nhập số lượng: "));
  h.giaban=double.parse(input("Nhập giá bán: "));
}
void Nhap_1hd_CN(HoaDon_CN h){
  Nhap_1hd(h);
  h.khoangCach=double.parse(input("Nhập khoảng cách: "));

}
void Nhap_1hd_DL(HoaDon_DL h){
  Nhap_1hd(h);
  h.nam=int.parse(input("Nhập năm: "));

}
void Nhap_1hd_CT(HoaDon_CT h){
  Nhap_1hd(h);
  h.soluongNV=int.parse(input("Nhập số lượng nhân viên: "));

}
void Xuat(){
  for (var hd in lstHoaDon){
    print("Mã khách hàng: ${hd.maKH}");
    print("Tên khách hàng: ${hd.tenKH}");
    print("Số lượng: ${hd.soluong}");
    print("Giá bán: ${hd.giaban}");
    print("Chiết khấu: ${hd.chietkhau()}");
    print("VAT: ${hd.VAT()}");
    print("Thành tiền: ${hd.thanhTien()}");
  }

}
double TongThanhTien(){
  double tong=0;
  for (var hd in lstHoaDon){
    tong+=hd.thanhTien();
  }
  return tong;
}
double TongTroGia(){
  double tong=0;
  for (var hd in lstHoaDon){
    if(hd is ITroGia){
      tong+=(hd as ITroGia).ITroGia();
    }
  }
  return tong;
}
void KH_MuaMax(){
  double max=lstHoaDon[0].thanhTien();
  for (var hd in lstHoaDon){
    if(hd.thanhTien()>max){
      max=hd.thanhTien();
    }
  }
  print("Khách hàng mua nhiều nhất: ");
  for (var hd in lstHoaDon){
    if(hd.thanhTien()==max){
     
     hd.Xuat();
    }
  }
}
double tongchietkhau_CT()
{
  double tong=0;
  for (var hd in lstHoaDon){
    if(hd is HoaDon_CT){
      tong+=hd.chietKhau();
    }
  }
  return tong;
}
void SapXep(){
  
  lstHoaDon.sort((a,b)=> compareMultiple([
    ()=>a.soluong.compareTo(b.soluong),
    ()=>b.thanhTien().compareTo(a.thanhTien())
  ]));
}

void TimHD_MaKH(String ma)
{
  if(ma!=null && ma.isNotEmpty)
  {
    for (var hd in lstHoaDon){
      if(hd.maKH==ma)
      {
        print("Thông tin các háo đơn của khách hàng có mã $ma: ");
        hd.Xuat();
      }
    }
  }
  else print("Khách hàng lạ");
}}
