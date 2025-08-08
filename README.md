# MyCoolApp

A .NET 8 console application demonstrating Windows Installer (MSI) deployment using WiX Toolset.

## Overview

MyCoolApp is a simple console application that displays system information and demonstrates best practices for creating Windows installers. The project includes:

- A main console application (MyCoolApp)
- An installer project (MyCoolApp.Installer) using WiX Toolset

## Features

- Displays welcome message and system information
- Shows current date/time, OS version, machine name, and user details
- Packaged as an MSI installer for easy deployment
- Built with .NET 8.0 runtime

## Prerequisites

- Visual Studio 2022
- .NET 8.0 SDK
- WiX Toolset for Visual Studio 2022

## Installing WiX Toolset for Visual Studio 2022

To work with the MyCoolApp.Installer project, you need to install the latest stable version of WiX Toolset:

### Method 1: Visual Studio Extensions Manager

1. Open Visual Studio 2022
2. Go to **Extensions** > **Manage Extensions**
3. Click on **Online** tab
4. Search for "WiX Toolset Visual Studio Extension"
5. Click **Download** on the official WiX Toolset extension
6. Close Visual Studio to complete the installation
7. The Visual Studio Installer will launch automatically to install the extension

### Method 2: Visual Studio Marketplace

1. Visit the [Visual Studio Marketplace](https://marketplace.visualstudio.com/)
2. Search for "WiX Toolset Visual Studio 2022 Extension"
3. Click **Download** on the official extension page
4. Run the downloaded VSIX file
5. Follow the installation prompts

### Method 3: Command Line (using WiX v4+)

For WiX v4 and later, you can also install via .NET CLI:
```powershell
dotnet tool install --global wix
```


### Verification

After installation, verify WiX is properly installed:

1. Restart Visual Studio 2022
2. Create a new project
3. Look for **WiX** project templates:
   - MSI Package
   - Bundle
   - Merge Module
   - WiX Library

## Project Structure
MyCoolApp/ ├── MyCoolApp/                # Main console application 
		   │   ├── Program.cs            # Application entry point 
		   │   └── MyCoolApp.csproj      # Project file 
		   ├── MyCoolApp.Installer/      # WiX installer project 
		   │   ├── Product.wxs           # Main installer definition 
		   │   └── MyCoolApp.Installer.wixproj  # WiX project file 
		   ├── README.md                # This file 
		   └── LICENSE.txt              # MIT License


## Building the Project

### Building the Application

1. Open the solution in Visual Studio 2022
2. Set **MyCoolApp** as the startup project
3. Build the solution (`Ctrl+Shift+B`)
4. Run the application (`F5` or `Ctrl+F5`)

### Building the Installer

1. Ensure the main application builds successfully
2. Right-click on **MyCoolApp.Installer** project
3. Select **Build** or **Rebuild**
4. The MSI installer will be generated in the `bin\Release` or `bin\Debug` folder

## Installer Features

The MyCoolApp.Installer project creates an MSI package that:

- Installs the application to Program Files
- Creates Start Menu shortcuts
- Registers the application for Add/Remove Programs
- Supports silent installation via command line
- Includes proper versioning and metadata

## Usage

### Running the Application

After installation, you can run MyCoolApp from:
- Start Menu shortcut
- Command line: Navigate to installation directory and run `MyCoolApp.exe`

### Command Line Installation

#### Silent installation
```powershell
msiexec /i MyCoolApp.Installer.msi /quiet
```

#### Installation with logging
```powershell
msiexec /i MyCoolApp.Installer.msi /l*v install.log
```

#### Uninstall
```powershell
msiexec /x MyCoolApp.Installer.msi /quiet
```


## Development

### Prerequisites for Development

- Visual Studio 2022 with the following workloads:
  - .NET desktop development
  - WiX Toolset Visual Studio Extension

### Building from Source
```bash
git clone <repository-url> cd MyCoolApp dotnet restore dotnet build
```


## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test the installer creation process
5. Submit a pull request

## License

This project is licensed under the MIT License - see the [LICENSE.txt](LICENSE.txt) file for details.

## Troubleshooting

### Common WiX Installation Issues

- **Project templates not visible**: Restart Visual Studio after installing WiX
- **Build errors**: Ensure both .NET 8 SDK and WiX Toolset are properly installed
- **MSI creation fails**: Check that all referenced files exist and paths are correct

### Support

For issues related to:
- WiX Toolset: Visit [WiX Toolset Documentation](https://wixtoolset.org/documentation/)
- .NET 8: Check [Microsoft .NET Documentation](https://docs.microsoft.com/en-us/dotnet/)