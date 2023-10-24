using DAL.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class VatTuService
    {
        public DungCuNhaKhoa FindID(string id)
        {
            DentalContextDB context = new DentalContextDB();
            return context.DungCuNhaKhoas.FirstOrDefault(p => p.IDDungCu == id);
        }
        public Kho FindIDKho(string id)
        {
            DentalContextDB context = new DentalContextDB();
            return context.Khoes.FirstOrDefault(p => p.IDDungCu == id);
        }
        public void InsertUpdate(DungCuNhaKhoa d)
        {
            DentalContextDB context = new DentalContextDB();
            context.DungCuNhaKhoas.Add(d);
            context.SaveChanges();
        }
        public void InsertUpdate(Kho d)
        {
            DentalContextDB context = new DentalContextDB();
            context.Khoes.Add(d);
            context.SaveChanges();
        }
    }
}
