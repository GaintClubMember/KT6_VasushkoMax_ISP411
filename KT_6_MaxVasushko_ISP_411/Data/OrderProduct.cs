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
    
    public partial class OrderProduct
    {
        public int OrderProductId { get; set; }
        public int OrderId { get; set; }
        public int OrderProductItem { get; set; }
        public int OrderProductCount { get; set; }
    
        public virtual Order Order { get; set; }
    }
}