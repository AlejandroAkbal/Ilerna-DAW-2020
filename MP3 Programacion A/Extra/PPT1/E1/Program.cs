using System;

namespace E1
{
    internal class Program
    {
        private static void Main(string[] args)
        {
            int total = 0;

            // Iniciar el loop
            for (int i = 0; i < 11; i++)
            {
                total += i;
                Console.WriteLine("Paso numero " + i + ", valor: " + total);
            }

            Console.WriteLine("\nTotal: " + total);
        }
    }
}