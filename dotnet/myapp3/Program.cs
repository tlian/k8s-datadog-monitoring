using System;
using System.Threading;
using Serilog;
using Serilog.Formatting.Json;

namespace myapp3
{
    class Program
    {
        static void myLog(string lati, string longti)
        {
            // Instantiate the logger
            var log = new LoggerConfiguration()  // using Serilog;

            // using Serilog.Formatting.Json;
            .WriteTo.File(new JsonFormatter(renderMessage: true), "/var/log/mydotnet/alpha-log.json")
            
            // using Serilog.Formatting.Compact;
            // .WriteTo.File(new RenderedCompactJsonFormatter(), "alpha-log.json")
            
            .CreateLogger();

            // An example
            var position = new { Latitude = lati, Longitude = longti };
            var elapsedMs = 34;

            log.Information("Processed {@Position} in {Elapsed:000} ms.", position, elapsedMs);
        }
        static void Main(string[] args)
        {
            while (true)
            {
                Console.WriteLine("Hello Aplha!");
                myLog(DateTime.Today.Year.ToString(), DateTime.Now.ToString());
                Thread.Sleep(1 * 1000);
            }   
        }
    }
}
