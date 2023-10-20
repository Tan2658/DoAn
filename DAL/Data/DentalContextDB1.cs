using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Data
{
    public partial class DentalContextDB1 : Component
    {
        public DentalContextDB1()
        {
            InitializeComponent();
        }

        public DentalContextDB1(IContainer container)
        {
            container.Add(this);

            InitializeComponent();
        }
    }
}
