using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using SistemasColegio.MVC.Models.Colegio;

var builder = WebApplication.CreateBuilder(
    new WebApplicationOptions() { EnvironmentName = Environments.Development }
    //new WebApplicationOptions() { EnvironmentName = Environments.Production }
    );

// Add services to the container.
builder.Services.AddControllersWithViews().AddNewtonsoftJson(
    options =>
    {
        options.SerializerSettings.NullValueHandling = NullValueHandling.Ignore;
        options.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
        options.SerializerSettings.DateFormatString = "MM-dd-yyyy HH:mm";
    }
    );
builder.Services.AddDbContext<ColegioContext>(
    //x => x.UseSqlServer() // usando conexion default
    x => x.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")) // usando conexion cn entornos de de desarrollo con appsettings.Development.json
    );

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
