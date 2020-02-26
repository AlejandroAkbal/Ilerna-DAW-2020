using System;

namespace VideoTutoExtra
{
    internal class Program
    {
        private static void Main(string[] args)
        {
            int respuesta;

            Console.WriteLine("Introduce datos!");

            // respuesta = int.Parse(Console.ReadLine());

            // Conversion explicita
            respuesta = Convert.ToInt32(Console.ReadLine());

            // Conversion implicita seria usar un double con un int asi
            // double a = (int)respuesta

            Console.WriteLine(respuesta);
        }
    }
}