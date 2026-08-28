import 'HoaDon.dart';
class HoaDon_DL extends HoaDon {
int nam;
HoaDon_DL(){
  this.nam=0;
  maKH="KH0001";
  tenKH="Hoa";
  soluong=2;
  giaban=400000;

}
HoaDon_DL(String maKH, String tenKH, int soluong, double giaban, this.nam)
    : super(maKH, tenKH, soluong, giaban);

  @override
 double chietkhau()
  {
     double ck=0.3;
    int ht=nam-5;
    if(ht>0&&ht<=5)
    {
      ck+=0.01*ht;
    }
    else if(ht>5)
    {
      ck=0.35;
    }
    return ck*soluong*giaban;
  }
}
