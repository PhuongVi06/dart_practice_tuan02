class SanPham {
  String _maSP = '';
  String _tenSP = '';
  double _donGia = 0;
  double _giamGia = 0;

  // Constructor mặc định
  SanPham() {
    _maSP = "SP000";
    _tenSP = "Unknow";
    _donGia = 0;
    _giamGia = 0;
  }

  // Constructor đầy đủ tham số
  SanPham.fullPara(String masp, String tensp, double gia, double giam) {
    _maSP = masp;
    _tenSP = tensp;
    _donGia = gia;
    _giamGia = giam;
  }

  // Getter/Setter cho Mã sản phẩm
  String get maSP => _maSP;
  set maSP(String value) {
    if (value.isNotEmpty) {
      _maSP = value;
    }
  }

  // Getter/Setter cho Tên sản phẩm
  String get tenSP => _tenSP;
  set tenSP(String value) {
    if (value.isNotEmpty) {
      _tenSP = value;
    }
  }

  // Getter/Setter cho Đơn giá
  double get donGia => _donGia;
  set donGia(double value) {
    if (value > 0) {
      _donGia = value;
    }
  }

  // Getter/Setter cho Giảm giá
  double get giamGia => _giamGia;
  set giamGia(double value) {
    if (value >= 0) {
      _giamGia = value;
    }
  }

  // Phương thức tính thuế nhập khẩu
  double tinhThueNhapKhau() {
    return 0.01 * _donGia;
  }

  // Phương thức hiển thị thông tin
  void showInfo() {
    print(
      "Mã sản phẩm: $_maSP, tên: $_tenSP, giá bán: $_donGia, "
      "giảm giá: $_giamGia, thuế: ${tinhThueNhapKhau()}",
    );
  }
}
