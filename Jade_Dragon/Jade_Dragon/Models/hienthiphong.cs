﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Jade_Dragon.Models
{
    [Serializable]
    public class hienthiphong
    {
        public List<PhongKhachSan> ph { get; set; }
        public List<khachsan> ks { get; set; }
        public List<PhongKhachSan> ctphong { get; set; }
        public List <khuvuc> khu_vuc { get; set; }
        public PhongKhachSan giodonhang { get; set; }
    }

    

}