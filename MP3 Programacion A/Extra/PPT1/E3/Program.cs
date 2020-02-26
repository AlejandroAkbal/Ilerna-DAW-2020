using System;

namespace E3
{
    internal class Program
    {
        private static void Main(string[] args)
        {
            // Iniciar el loop
            for (int i = 0; i < 100; i++)
            {
                if (i % 2 == 0)
                {
                    // Nothing
                }
                else
                {
                    Console.WriteLine("Numero impar: " + i);
                };
            }
        }
    }
}