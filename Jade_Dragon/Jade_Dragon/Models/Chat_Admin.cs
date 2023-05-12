using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Jade_Dragon.Models
{
    public class Chat_Admin
    {
        public List<PhongChat> phchat { set; get; }
        public List<khachhang> kh { set; get; }
        public List<khachsan> ks { set; get; }
    }
}