using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Models;

namespace BUS
{
    public class DichVuServices
    {
        public List<DichVu> GetAll()
        {
            DentalContextDB context = new DentalContextDB();
            return context.DichVu.ToList();
        }
    }
}
