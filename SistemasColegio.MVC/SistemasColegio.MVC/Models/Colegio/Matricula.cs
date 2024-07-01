using System;
using System.Collections.Generic;

namespace SistemasColegio.MVC.Models.Colegio;

public partial class Matricula
{
    public int MatriculaId { get; set; }

    public DateTime? Fecha { get; set; }

    public short GradoId { get; set; }

    public short SeccionId { get; set; }

    public short AlumnoId { get; set; }

    public virtual Alumno Alumno { get; set; } = null!;

    public virtual Grado Grado { get; set; } = null!;

    public virtual Seccion Seccion { get; set; } = null!;

}
