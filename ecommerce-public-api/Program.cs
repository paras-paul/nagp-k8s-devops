using Microsoft.EntityFrameworkCore;
using public_api_interface;
using public_api_interface.Data;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Configuration.AddJsonFile("appsettings.json", optional: false, reloadOnChange: true);
builder.Services.AddCors(options =>
{
    options.AddPolicy(name: "AllowAllOrigins",
        builder =>
        {
            builder.AllowAnyOrigin();
        });
});
builder.Services.Configure<HostSettings>(builder.Configuration.GetSection("HostSettings"));
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddHttpClient();

string connectionString = $"User ID ={Environment.GetEnvironmentVariable("POSTGRES_USER")};Password={Environment.GetEnvironmentVariable("POSTGRES_PASSWORD")};Server={Environment.GetEnvironmentVariable("pgclusterip")};Port={Environment.GetEnvironmentVariable("pgport")};Database={Environment.GetEnvironmentVariable("pgdatabase")}; Integrated Security=true;Pooling=true;";

builder.Services.AddEntityFrameworkNpgsql().AddDbContext<ApiDbContext>(opt =>
        opt.UseNpgsql(connectionString));
var app = builder.Build();

// Configure the HTTP request pipeline.
//if (app.Environment.IsDevelopment())
//{
//    app.UseSwagger();
//    app.UseSwaggerUI();
//}

app.UseSwagger();
app.UseSwaggerUI();

app.UseCors("AllowAllOrigins");

app.UseAuthorization();

app.MapControllers();

app.Run();
