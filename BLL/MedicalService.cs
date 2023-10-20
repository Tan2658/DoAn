using DAL.DungCu;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class MedicalService
    {
        public DungCuNhaKhoa FindID(string id)
        {
            DentalContextDB context = new DentalContextDB();
            return context.DungCuNhaKhoas.FirstOrDefault(p =>p.IDDungCu==id);
        }
        public void InsertUpdate(DungCuNhaKhoa d)
        {
            DentalContextDB context = new DentalContextDB();
            context.DungCuNhaKhoas.Add(d);
            context.SaveChanges();
        }
        
    }
}
