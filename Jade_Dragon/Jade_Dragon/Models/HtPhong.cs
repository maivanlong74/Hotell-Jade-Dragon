using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Jade_Dragon.Models
{
    [Serializable]
    public class HtPhong
    {
        public List<PhongKhachSan> phongks { get; set; }
        public List<SoTangKhachSan> tangks { get; set; }
        public List<chitiethoadon> cthd { get; set; }
    }
}