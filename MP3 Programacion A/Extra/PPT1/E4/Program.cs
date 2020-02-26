using System;

namespace E4
{
    internal class Program
    {
        private static void Main(string[] args)
        {
            Console.WriteLine("Escribe dos digitos");

            // Leer valores
            int integer1 = int.Parse(Console.ReadLine());
            int integer2 = int.Parse(Console.ReadLine());

            // Lo se, muy largo y poco legible en monitores pequeños
            Console.WriteLine("Suma: " + (integer1 + integer2) + "\nResta: " + (integer1 - integer2) + "\nMultiplicacion: " + (integer1 * integer2) + "\nDivision: " + ((double)integer1 / (double)integer2));
        }
    }
}