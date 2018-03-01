BaristaCore-ChakraCore
-----

Contains pre-built ChakraCore libraries for macOS, Linux and Windows and nuspecs to publish them to NuGet for consumption in BaristaCore projects

Available on nuget here:
https://www.nuget.org/packages?q=baristalabs.baristacore.chakracore


Current
-----
Releases are from the official ChakraCore releases, but renamed align with what a .Net Core app can pick up in a x-plat manner via a DllImport attribute with a minimum of hassle.

https://github.com/Microsoft/ChakraCore/releases


For other platforms or custom builds, build [ChakraCore](https://github.com/microsoft/chakracore/) yourself and overwrite the dynamic libary for the target platform in the output folder.

Windows Build:

```
msbuild /m /p:Platform=x64 /p:Configuration=Release /p:RuntimeLib=static_library Build\Chakra.Core.sln
```
