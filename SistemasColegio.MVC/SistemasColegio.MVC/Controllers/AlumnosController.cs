using Microsoft.AspNetCore.Mvc;
using SistemasColegio.MVC.Models.Colegio;
using Microsoft.EntityFrameworkCore;


namespace SistemasColegio.MVC.Controllers
{
    public class AlumnosController : Controller
    {
        private readonly ColegioContext _colegioContext;
        public AlumnosController(ColegioContext colegioContext)
        {
            _colegioContext = colegioContext;
        }

        public async Task<IActionResult> Index()
        {
            List<Alumno> alumnos = await _colegioContext.Alumnos
                .Where(parametro => parametro.Nombres.Contains(""))
                .ToListAsync();

            //ViewBag.Alumnos = alumnos;
            return View(alumnos);

        }
        [HttpGet]
        public async Task<IActionResult> Index(string nombreBusqueda, string apellidoBusqueda)
        {
            IQueryable<Alumno> query = _colegioContext.Alumnos;

            if (!string.IsNullOrEmpty(nombreBusqueda))
            {
                query = query.Where(alumno => alumno.Nombres.Contains(nombreBusqueda));
            }

            if (!string.IsNullOrEmpty(apellidoBusqueda))
            {
                query = query.Where(alumno => alumno.Apellidos.Contains(apellidoBusqueda));
            }

            List<Alumno> alumnos = await query.ToListAsync();

            return View(alumnos);
        }
        public async Task<IActionResult> Editar(int id)
        {
            var alumno = await _colegioContext.Alumnos
                .Where(p => p.AlumnoId == id)
                .FirstOrDefaultAsync();

            return View(alumno);

        }
        [HttpPost]
        public async Task<IActionResult> Editar(Alumno modelAlumno)
        {
            if (modelAlumno.AlumnoId > 0)
            {
                _colegioContext.Update(modelAlumno);
            }
            else //creacion
            {
                _colegioContext.Add(modelAlumno);
            }
            await _colegioContext.SaveChangesAsync();
            return RedirectToAction("Index");
        }
        public async Task<IActionResult> Nuevo()
        {
            var model = new Alumno();
            return View("Editar", model);
        }

    }
}

