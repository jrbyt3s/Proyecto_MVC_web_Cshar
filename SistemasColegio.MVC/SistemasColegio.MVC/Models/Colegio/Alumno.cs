using System;
using System.Collections.Generic;

namespace SistemasColegio.MVC.Models.Colegio;

public partial class Alumno
{
    public short AlumnoId { get; set; }

    public string Nombres { get; set; } = null!;

    public string Apellidos { get; set; } = null!;

    public string Direccion { get; set; } = null!;

    public string Sexo { get; set; } = null!;

    public DateOnly FechaNacimiento { get; set; }

    public virtual ICollection<Matricula> Matriculas { get; set; } = new List<Matricula>();

    public virtual ICollection<Nota> Nota { get; set; } = new List<Nota>();

    public override string ToString()
    {
        if (this == null) return string.Empty;
        
        return this.AlumnoId.ToString() + " - " + this.Nombres + " - " + this.Apellidos;
    }
}
