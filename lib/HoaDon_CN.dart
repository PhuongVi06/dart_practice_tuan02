import 'HoaDon.dart';
import 'HoaDon_TG.dart';
class HoaDon_CN extends HoaDon implements ITroGia {
 double khoangCach;



  HoaDon_CN(String maKH, String tenKH, int soluong, double giaban, this.khoangCach)
    : super(maKH, tenKH, soluong, giaban);

  @override
 double chietkhau()
  {double ck=0;

    if( soluong>=3)
    {ck=0.05*giaban*soluong;}
    else ck=0;

    if (khoangCach<10){
      ck+=50000*soluong;
    }
    return ck;
  }
  double ITroGia(){
    double tg=0.02;
if (soluong>2){
  return tg*giaban*soluong+100000;
}
else return tg*giaban*soluong;

  }
  
}