using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Jade_Dragon.Models
{
    public class KhachSanTrinhChieu
    {
        public List<khachsan> ks { get; set; }
        public List<khuvuc> kv { get; set; }
        public List<SoSaoDanhGia> dg { get; set; }
        public List<ThongKeDanhGia> ThongKe { get; set; }
    }
}