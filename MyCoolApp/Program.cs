// See https://aka.ms/new-console-template for more information
using System;

Console.WriteLine("=================================");
Console.WriteLine("    Welcome to My Cool App!     ");
Console.WriteLine("=================================");
Console.WriteLine();
Console.WriteLine("This app demonstrates:");
Console.WriteLine("• Console application basics");
Console.WriteLine("• Windows Installer (MSI) deployment");
Console.WriteLine("• .NET 8.0 runtime");
Console.WriteLine();
Console.WriteLine($"Current Date/Time: {DateTime.Now:yyyy-MM-dd HH:mm:ss}");
Console.WriteLine($"Running on: {Environment.OSVersion}");
Console.WriteLine($"Machine Name: {Environment.MachineName}");
Console.WriteLine($"User Name: {Environment.UserName}");
Console.WriteLine($"Application Path: {Environment.ProcessPath}");
Console.WriteLine();
Console.WriteLine("=================================");
Console.WriteLine("Press any key to exit...");
Console.WriteLine("=================================");

// Keep the window open until user presses a key
Console.ReadKey();