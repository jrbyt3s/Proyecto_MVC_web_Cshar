using System;
using System.Collections.Generic;

namespace SistemasColegio.MVC.Models.Colegio;

public partial class Seccion
{
    public short SeccionId { get; set; }

    public string Nombre { get; set; } = null!;

    public short? GradoId { get; set; }

    public virtual Grado? Grado { get; set; }

    public override string ToString()
    {
        if(this == null) return string.Empty;
        if (this.Grado == null) { 
        return this.SeccionId.ToString()+" - " + this.Nombre.ToString();
        };
        return this.SeccionId.ToString() + " - " + this.Nombre.ToString() + " - " + this.Grado.Nivel;
    }

    public virtual ICollection<Matricula> Matriculas { get; set; } = new List<Matricula>();
}
