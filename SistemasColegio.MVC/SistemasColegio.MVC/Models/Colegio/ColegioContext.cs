using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace SistemasColegio.MVC.Models.Colegio;

public partial class ColegioContext : DbContext
{
    public ColegioContext()
    {
    }

    public ColegioContext(DbContextOptions<ColegioContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Alumno> Alumnos { get; set; }

    public virtual DbSet<Curso> Cursos { get; set; }

    public virtual DbSet<Grado> Grados { get; set; }

    public virtual DbSet<Matricula> Matriculas { get; set; }

    public virtual DbSet<Nota> Notas { get; set; }

    public virtual DbSet<Seccion> Seccions { get; set; }

//    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
//        => optionsBuilder.UseSqlServer("data source=LAPTOP-P136TM9O;Initial Catalog=Colegio;Trusted_Connection=True;Integrated Security=true;TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Alumno>(entity =>
        {
            entity.ToTable("Alumno");

            entity.Property(e => e.AlumnoId).HasColumnName("AlumnoID");
            entity.Property(e => e.Apellidos).HasMaxLength(60);
            entity.Property(e => e.Direccion).HasMaxLength(150);
            entity.Property(e => e.Nombres).HasMaxLength(50);
            entity.Property(e => e.Sexo).HasMaxLength(10);
        });

        modelBuilder.Entity<Curso>(entity =>
        {
            entity.ToTable("Curso");

            entity.Property(e => e.CursoId).HasColumnName("CursoID");
            entity.Property(e => e.GradoId).HasColumnName("GradoID");
            entity.Property(e => e.Nombre).HasMaxLength(50);

            entity.HasOne(d => d.Grado).WithMany(p => p.Cursos)
                .HasForeignKey(d => d.GradoId)
                .HasConstraintName("FK_Curso_Grado");
        });

        modelBuilder.Entity<Grado>(entity =>
        {
            entity.ToTable("Grado");

            entity.Property(e => e.GradoId).HasColumnName("GradoID");
            entity.Property(e => e.Nivel).HasMaxLength(50);
        });

        modelBuilder.Entity<Matricula>(entity =>
        {
            entity.ToTable("Matricula");

            entity.Property(e => e.MatriculaId).HasColumnName("MatriculaID");
            entity.Property(e => e.AlumnoId).HasColumnName("AlumnoID");
            entity.Property(e => e.Fecha)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.GradoId).HasColumnName("GradoID");
            entity.Property(e => e.SeccionId).HasColumnName("SeccionID");

            entity.HasOne(d => d.Alumno).WithMany(p => p.Matriculas)
                .HasForeignKey(d => d.AlumnoId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Matricula_Alumno");

            entity.HasOne(d => d.Grado).WithMany(p => p.Matriculas)
                .HasForeignKey(d => d.GradoId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Matricula_Grado");

            entity.HasOne(d => d.Seccion).WithMany(p => p.Matriculas)
                .HasForeignKey(d => d.SeccionId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Matricula_Seccion");
        });

        modelBuilder.Entity<Nota>(entity =>
        {
            entity.HasKey(e => e.NotasId);

            entity.Property(e => e.NotasId).HasColumnName("NotasID");
            entity.Property(e => e.AlumnoId).HasColumnName("AlumnoID");
            entity.Property(e => e.CursoId).HasColumnName("CursoID");
            entity.Property(e => e.Notas)
                .HasDefaultValue(0m)
                .HasColumnType("decimal(4, 1)");

            entity.HasOne(d => d.Alumno).WithMany(p => p.Nota)
                .HasForeignKey(d => d.AlumnoId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Notas_Alumno");

            entity.HasOne(d => d.Curso).WithMany(p => p.Nota)
                .HasForeignKey(d => d.CursoId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Notas_Curso");
        });

        modelBuilder.Entity<Seccion>(entity =>
        {
            entity.ToTable("Seccion");

            entity.Property(e => e.SeccionId).HasColumnName("SeccionID");
            entity.Property(e => e.GradoId).HasColumnName("GradoID");
            entity.Property(e => e.Nombre).HasMaxLength(50);

            entity.HasOne(d => d.Grado).WithMany(p => p.Seccions)
                .HasForeignKey(d => d.GradoId)
                .HasConstraintName("FK_Seccion_Grado");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
