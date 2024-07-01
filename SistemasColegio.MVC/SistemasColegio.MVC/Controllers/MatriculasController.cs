using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using SistemasColegio.MVC.Models.Colegio;
using SistemasColegio.MVC.ViewModels;

namespace SistemasColegio.MVC.Controllers
{
    public class MatriculasController : Controller
    {
        private readonly ColegioContext _context;

        public MatriculasController(ColegioContext context)
        {
            _context = context;
        }

        // GET: Matriculas
        public async Task<IActionResult> Index()
        {
            //var colegioContext = _context.Matriculas.Include(m => m.Alumno).Include(m => m.Grado).Include(m => m.Seccion);
            //return View(await colegioContext.ToListAsync());

            var matriculas = await _context.Matriculas
                .Include(m => m.Grado)
                .Include(m => m.Seccion)
                .Include(m => m.Alumno)
                .Select(m => new MatriculaViewModel
                {
                    MatriculaID = m.MatriculaId,
                    Fecha = m.Fecha,
                    Nivel = m.Grado.Nivel,
                    NombreSeccion = m.Seccion.Nombre,
                    NombresAlumno = m.Alumno.Nombres,
                    ApellidosAlumno = m.Alumno.Apellidos,
                    SexoAlumno = m.Alumno.Sexo,
                    FechaNacimientoAlumno = m.Alumno.FechaNacimiento
                })
                .ToListAsync();

            return View(matriculas);
        }

        // GET: Matriculas/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var matricula = await _context.Matriculas
                .Include(m => m.Alumno)
                .Include(m => m.Grado)
                .Include(m => m.Seccion)
                .FirstOrDefaultAsync(m => m.MatriculaId == id);
            if (matricula == null)
            {
                return NotFound();
            }

            return View(matricula);
        }

        // GET: Matriculas/Create
        public async Task<IActionResult> Create()

        {
            // Cargar listas para los selectores de Grado y Seccion
            ViewData["GradoId"] = new SelectList(_context.Grados, "GradoId", "Nivel");
            //ViewData["SeccionId"] = new SelectList(_context.Seccions, "SeccionId", "Nombre");

            // Obtener la lista de Seccione:
            List<Seccion> secciones = await _context.Seccions.Include(s => s.Grado)
                .Where(p => p.GradoId == p.Grado.GradoId)
                .ToListAsync();
            var seccionesSelectList = secciones.Select(s => new SelectListItem
            {
                Text = $"{s.Grado.Nivel} - {s.Nombre}",
                Value = s.SeccionId.ToString(),
            }).ToList();
            ViewBag.SeccionId = new SelectList(seccionesSelectList, "Value", "Text");

            // Obtener la lista de alumnos y crear una lista de SelectListItem con nombre y apellido
            var alumnos = await _context.Alumnos.ToListAsync();
            var alumnosSelectList = alumnos.Select(a => new SelectListItem
            {
                Text = $"{a.Nombres} {a.Apellidos}",  // Aquí se muestra la combinación de nombre y apellido
                Value = a.AlumnoId.ToString()
            }).ToList();

            // Asignar la lista de alumnos al ViewBag para usar en la vista
            ViewBag.AlumnoId = new SelectList(alumnosSelectList, "Value", "Text");

            return View();

        }

        // POST: Matriculas/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MatriculaId,Fecha,GradoId,SeccionId,AlumnoId")] Matricula matricula)
        {
            if (matricula == null)
            {
                return NotFound();
            }
            {

            }

            if (matricula != null)
            {
                _context.Add(matricula);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["AlumnoId"] = new SelectList(_context.Alumnos, "AlumnoId", "AlumnoId", matricula.AlumnoId);
            ViewData["GradoId"] = new SelectList(_context.Grados, "GradoId", "GradoId", matricula.GradoId);
            ViewData["SeccionId"] = new SelectList(_context.Seccions, "SeccionId", "SeccionId", matricula.SeccionId);
            return View(matricula);
        }

        // GET: Matriculas/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var matricula = await _context.Matriculas
                .Where(p => p.MatriculaId == id)
                .Include(p => p.Alumno)
                .Include(p => p.Seccion)
                .Include(p => p.Grado)
                .FirstOrDefaultAsync();

            
            ViewData["GradoId"] = new SelectList(_context.Grados, "GradoId", "Nivel", matricula.GradoId);

            // Obtener la lista de Seccione:
            List<Seccion> secciones = await _context.Seccions.Include(s => s.Grado)
                .Where(p => p.GradoId == p.Grado.GradoId)
                .ToListAsync();
            var seccionesSelectList = secciones.Select(s => new SelectListItem
            {
                Text = $"{s.Grado.Nivel} - {s.Nombre}",
                Value = s.SeccionId.ToString(),
            }).ToList();
            ViewBag.SeccionId = new SelectList(seccionesSelectList, "Value", "Text", matricula.SeccionId);

            // Obtener la lista de alumnos y crear una lista de SelectListItem con nombre y apellido
            var alumnos = await _context.Alumnos.ToListAsync();
            var alumnosSelectList = alumnos.Select(a => new SelectListItem
            {
                Text = $"{a.Nombres} {a.Apellidos}",  // Aquí se muestra la combinación de nombre y apellido
                Value = a.AlumnoId.ToString()
            }).ToList();

            // Asignar la lista de alumnos al ViewBag para usar en la vista
            ViewBag.AlumnoId = new SelectList(alumnosSelectList, "Value", "Text", matricula.AlumnoId);

            if (matricula == null)
            {
                return NotFound();
            }
            return View(matricula);






            // Cargar listas para los selectores de Grado y Seccion
            ViewBag.GradoId = new SelectList(_context.Grados, "GradoId", "Nivel", matricula.GradoId);
            ViewBag.SeccionId = new SelectList(_context.Seccions, "SeccionId", "Nombre", matricula.SeccionId);



            return View(matricula);
        }

        // POST: Matriculas/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("MatriculaId,Fecha,GradoId,SeccionId,AlumnoId")] Matricula matricula)
        {
            if (id != matricula.MatriculaId)
            {
                return NotFound();
            }
            try
            {
                _context.Update(matricula);
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MatriculaExists(matricula.MatriculaId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
            return RedirectToAction(nameof(Index));
        }

        // GET: Matriculas/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var matricula = await _context.Matriculas
                .Include(m => m.Alumno)
                .Include(m => m.Grado)
                .Include(m => m.Seccion)
                .FirstOrDefaultAsync(m => m.MatriculaId == id);
            if (matricula == null)
            {
                return NotFound();
            }

            return View(matricula);
        }

        // POST: Matriculas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var matricula = await _context.Matriculas.FindAsync(id);
            if (matricula != null)
            {
                _context.Matriculas.Remove(matricula);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool MatriculaExists(int id)
        {
            return _context.Matriculas.Any(e => e.MatriculaId == id);
        }
    }
}
