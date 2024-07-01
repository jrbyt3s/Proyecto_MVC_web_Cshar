using System;
using System.Collections.Generic;

namespace SistemasColegio.MVC.Models.Colegio;

public partial class Curso
{
    public short CursoId { get; set; }

    public short? GradoId { get; set; }

    public string Nombre { get; set; } = null!;

    public virtual Grado? Grado { get; set; }

    public virtual ICollection<Nota> Nota { get; set; } = new List<Nota>();
}
