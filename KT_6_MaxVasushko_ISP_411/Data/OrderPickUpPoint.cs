//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace KT_6_MaxVasushko_ISP_411.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class OrderPickUpPoint
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public OrderPickUpPoint()
        {
            this.Order = new HashSet<Order>();
        }
    
        public int OrderPickUpPointId { get; set; }
        public string OrderPickUpPointCity { get; set; }
        public string OrderPickUpPointStreet { get; set; }
        public string OrderPickUpPointBuilding { get; set; }
        public string OrderPickUpPointIndex { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Order> Order { get; set; }
    }
}
