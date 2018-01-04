BaristaCore-ChakraCore
-----

Contains pre-built ChakraCore libraries for macOS, Ubuntu and Windows and nuspecs to publish them to NuGet for consumption in BaristaCore projects

Available on nuget here:
https://www.nuget.org/packages?q=baristalabs.baristacore.chakracore


Current
-----
chakracore.dll - Windows 10, x64, Release - 1.7.5
libChakraCore.dylib - macOS Sierra, amd64, Release - 1.7.5
libChakraCore.so - Ubuntu 16.04.1, amd64, Release - 1.7.5


These pre-build binaries are only included for convenience as ChakraCore is a relatively big build and these cover the majority of platforms.

For other platforms, build [ChakraCore](https://github.com/microsoft/chakracore/) yourself and overwrite the dynamic libary for the target platform in the output folder.


Windows Build:

```
msbuild /m /p:Platform=x64 /p:Configuration=Release /p:RuntimeLib=static_library Build\Chakra.Core.sln
```
