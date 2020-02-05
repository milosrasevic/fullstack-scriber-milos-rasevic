using System;
using System.Reflection;
using System.Threading;
using Sid.WebServices;

[assembly: log4net.Config.XmlConfigurator(ConfigFile = "Log4net.config", Watch = true)]

namespace CSharpAutoSuggest
{
    internal class Program
    {
        public static void Main(string[] args)
        {
            AutoSuggestService.Initialize();
            
            var sid = new WebService(
                sidModuleAssemblies: new Assembly[]
                {
                    Assembly.GetExecutingAssembly()
                },
                IsValidOriginHandler: (req, origin) => { return true; },
                prefixes: "http://*:8080/");
            
            sid.Run();
            
            Console.WriteLine("Press ESC to stop");
            do {
                while (!Console.KeyAvailable) {
                    // Do something
                    Thread.Sleep(1000);
                }
            } while (Console.ReadKey(true).Key != ConsoleKey.Escape);            
        }
    }
}