namespace WebApplication1.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Cart")]
    public partial class Cart
    {
        [Key]
        public int idCart { get; set; }

        public int? idCustomer { get; set; }

        public int? idShoeDetail { get; set; }

        public int? quantity { get; set; }

        public virtual Customer Customer { get; set; }

        public virtual ShoesDetail ShoesDetail { get; set; }
    }
}
