# CUDATests

Yet another learning project, a small CUDA playground

## Requirements

Install the following before building:

| Tool | Version | Notes |
| --- | --- | --- |
| [NVIDIA GPU + driver](https://www.nvidia.com/Download/index.aspx) | Recent | Any CUDA-capable NVIDIA GPU |
| [CUDA Toolkit](https://developer.nvidia.com/cuda-downloads) | 12.x or newer | Provides `nvcc` and the CUDA runtime |
| [Visual Studio](https://visualstudio.microsoft.com/) | 2022 or newer | Install the **Desktop development with C++** workload |
| [CMake](https://cmake.org/download/) | 3.24 or newer | Make sure `cmake` is on your `PATH` |

> Install Visual Studio **before** the CUDA Toolkit so the CUDA installer can add its
> Visual Studio integration (build customizations). If you install them in the other
> order, re-run the CUDA installer.

Verify the installs from a terminal:

```bat
nvidia-smi
nvcc --version
cmake --version
```

## Setup

1. Clone or copy the project to your machine.
2. Generate the Visual Studio solution by running:

   ```bat
   Scripts/WindowsGenProjects.bat
   ```
3. Open `build/CUDATests.slnx` (or `.sln` on older Visual Studio versions) in Visual Studio.
4. Hit F5

You can also build from the command line:

## Project Structure

```
CUDATests/
├── CMakeLists.txt              # Build configuration
├── CUDATests/                  # Source files (.cu, .cuh, .cpp, .hpp)
│   └── kernel.cu
└── Scripts/
    └── WindowsGenProjects.bat  # Generates the Visual Studio solution
```

## Notes

- The GPU architecture defaults to `native` (whatever GPU is in your machine). To target a
  specific architecture, pass it when configuring, e.g.:

  ```bat
  cmake -S . -B build -DCMAKE_CUDA_ARCHITECTURES=75
  ```

- If CMake can't find the CUDA Toolkit, make sure the `CUDA_PATH` environment variable
  points to your CUDA install (e.g. `C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.x`).
