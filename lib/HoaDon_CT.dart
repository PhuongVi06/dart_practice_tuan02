import 'HoaDon.dart';
import 'HoaDon_TG.dart';  
  
class HoaDon_CT extends HoaDon implements ITroGia {
int soluongNV;

HoaDon_CT(){
  this.soluongNV=0;
  maKH="KH0001";
  tenKH="Kim";
  soluong=5;
  giaban=4000000;
}
HoaDon_CT(string maKH, string tenKH, int soluong, double giaban, this.soluongNV)
    : super(maKH, tenKH, soluong, giaban){
  this.soluongNV=soluongNV;
}
@Override 
double chietKhau()
{
  double ck=0;
if(soluongNV>5000)
ck+=0.07;


else if (soluongNV>1000)
{
  ck+=0.05;

}
return ck*soluong*giaban;
}

double ITroGia(){
  double tg=120000;
  return tg*soluong;
}

import 'HoaDon.dart';
import 'HoaDon_TG.dart';

class HoaDon_CT extends HoaDon implements ITroGia {
  int soluongNV;

  HoaDon_CT()
      : soluongNV = 0,
        super("KH0001", "Kim", 5, 4000000);

  HoaDon_CT.dayDu(
    String maKH,
    String tenKH,
    int soluong,
    double giaban,
    this.soluongNV,
  ) : super(maKH, tenKH, soluong, giaban);

  @override
  double chietKhau() {
    double ck = 0;

    if (soluongNV > 5000) {
      ck = 0.07;
    } else if (soluongNV > 1000) {
      ck = 0.05;
    }

    return ck * soluong * giaban;
  }

  @override
  double ITroGia() {
    return 120000 * soluong;
  }
}