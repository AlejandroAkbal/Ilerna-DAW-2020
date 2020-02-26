using System;

namespace E2
{
    internal class Program
    {
        private static void Main(string[] args)
        {
            int total = 0;

            Console.WriteLine("Escribe 10 digitos");

            // Iniciar el loop
            for (int i = 0; i < 11; i++)
            {
                total += int.Parse(Console.ReadLine());
            }

            Console.WriteLine("\nSuma total: " + total + "\nMedia total: " + (total / 10));
        }
    }
}