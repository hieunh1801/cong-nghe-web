namespace ShoeStore.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ShoseStoreDatabaseModels : DbContext
    {
        public ShoseStoreDatabaseModels()
            : base("name=ShoseStoreDatabaseModels")
        {
        }

        public virtual DbSet<Account> Accounts { get; set; }
        public virtual DbSet<Attribute> Attributes { get; set; }
        public virtual DbSet<Cart> Carts { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Sho> Shoes { get; set; }
        public virtual DbSet<ShoesDetail> ShoesDetails { get; set; }
        public virtual DbSet<Vendor> Vendors { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ShoesDetail>()
                .HasMany(e => e.Carts)
                .WithOptional(e => e.ShoesDetail)
                .HasForeignKey(e => e.idShoeDetail);
        }
    }
}
