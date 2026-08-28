abstract class HoaDon  {
  String maKH;
  String tenKH;
  int soluong;
  double giaban;


HoaDon(){
  this.maKH="KH0000";
  this.tenKH="Hùng";
  this.soluong=0;
  this.giaban=0;
  
}
  HoaDon(this.maKH, this.tenKH, this.soluong, this.giaban);
  double thanhTien()
  {
    return giaban-chietkhau() +VAT();

  }
  double chietkhau();
  double VAT()
  {
   return 0.1*giaban*soluong;
  }

 String get maKH => maKH;
 String set maKH(String value) {
if(value.length==6 && value.startsWith('KH')&& value.substring(2).All.isDigit())
{
  maKH=value;
  }
  else print("Mã khách hàng không hợp lệ");
 }
  String get tenKH => tenKH;
  String set tenKH(String value) {
    if (value!=null && value.isNotEmpty) {
      tenKH = value;
    } else {
      print("Tên khách hàng không hợp lệ");
    }
  }
  int get soluong => soluong;
  int set soluong(int value) {
    if (value > 0) {
      soluong = value;
    } else {
      print("Số lượng không hợp lệ");
    }
  }
  double get giaban => giaban;
  double set giaban(double value) {
    if (value > 0) {
      giaban = value;
    } else {
      print("Giá bán không hợp lệ");
    }
  }
}
