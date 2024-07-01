namespace SistemasColegio.MVC.ViewModels
{  
    public class MatriculaViewModel
    {
        public int MatriculaID { get; set; }
        public DateTime? Fecha { get; set; }
        public string Nivel { get; set; }
        public string NombreSeccion { get; set; }
        public string NombresAlumno { get; set; }
        public string ApellidosAlumno { get; set; }
        public string SexoAlumno { get; set; }
        public DateOnly FechaNacimientoAlumno { get; set; }
    }
}