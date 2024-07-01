using System;
using System.Collections.Generic;

namespace SistemasColegio.MVC.Models.Colegio;

public partial class Nota
{
    public int NotasId { get; set; }

    public short AlumnoId { get; set; }

    public short CursoId { get; set; }

    public decimal? Notas { get; set; }

    public virtual Alumno Alumno { get; set; } = null!;

    public virtual Curso Curso { get; set; } = null!;
}
