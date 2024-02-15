# MaCh3
MaCh3 is ...

# How to Compile

```
mkdir build; cd build;
cmake ../
```

Don't forget to
```
source bin/setup.MaCh3.sh
```
## Building against MaCh3
If you compiled MaCh3 and sourced it you can simply call
```
find_package(MaCh3)
```
and cmake will find it. Alternatively, you can use CPM, for example:
```
CPMFindPackage(
  NAME MaCh3
  GIT_TAG "blarb"
  GITHUB_REPOSITORY mach3-software/MaCh3
)
```
## Multithreading
MaCh3 quite heavily relies on Multithreading, it is turned on by default. If for debugging purposes you would like to turn it off please use

```
cmake ../ [-DMaCh3_MULTITHREAD_ENABLED=<OFF>]
```

## CUDA
If the system has access to GPU, MaCh3 will enable GPU functionality automatically. If you would like to CPU only despite having access to CUDA
```
mkdir build; cd build;
cmake ../ [-USE_CPU=ON]
```
MaCh3 supports quite a high range of CUDA architectures if something doesn't work on your GPU let us know.


## Oscialtor
MaCh3 uses several neutrino calcualtors. By default, CUDAProb3 is used. If you would like to use Prob3++

```
cmake ../ [-DUSE_PROB3=<ON,OFF>]
```

## Debug
Several debugging options are available which are heavy for RAM and performance and, therefore not used by default. To enable it:
```
cmake ../ [-DMaCh3_DEBUG_ENABLED=<ON,OFF>]
```
There are several debug modes, to enable more detailed but very heavy specific debug levels. Level 1 is the default debug activated by the above.

```
cmake ../ [-DMaCh3_DEBUG_ENABLED=<ON,OFF>] [-DDEBUG_LEVEL=<1,2,3>]
```


## System Requirements
```
  GCC: ...
  CMake: ...
  ROOT: ...
```

