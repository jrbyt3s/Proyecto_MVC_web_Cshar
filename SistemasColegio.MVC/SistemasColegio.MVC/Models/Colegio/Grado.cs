using System;
using System.Collections.Generic;

namespace SistemasColegio.MVC.Models.Colegio;

public partial class Grado
{
    public short GradoId { get; set; }

    public string Nivel { get; set; } = null!;

    public virtual ICollection<Curso> Cursos { get; set; } = new List<Curso>();

    public virtual ICollection<Matricula> Matriculas { get; set; } = new List<Matricula>();

    public virtual ICollection<Seccion> Seccions { get; set; } = new List<Seccion>();

    public override string ToString()
    {
        if (this == null) return string.Empty;

        return this.GradoId.ToString() + " - " + this.Nivel.ToString();
    }
}
