using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Data;

namespace BUS
{
    public class BenhNhanService
    {
        public List<BenhNhan> GetAll()
        {
            DentalContextDB1 db1 = new DentalContextDB1();
            return db1.BenhNhans.ToList();
        }
        public BenhNhan FindIDBenhNhan(string idBenhNhan)
        {
            DentalContextDB1 db1 = new DentalContextDB1 ();
            return db1.BenhNhans.FirstOrDefault(p => p.IDBenhNhan == idBenhNhan);
        }
        public List<BenhNhan> FindBenhNhanWithMonth(int startMonth, int endMonth)
        {
            DentalContextDB1 db1 = new DentalContextDB1();
            return db1.BenhNhans.Where(p => p.NgayKhamDau.Month < endMonth && p.NgayKhamDau.Month > startMonth).ToList();
        }
    }
}
