buildDir = "../../../Build/%{cfg.system}-%{cfg.buildcfg}/%{prj.name}/"

project "SDL"
    kind "StaticLib"
    language "C"

    targetdir(buildDir)
    objdir(buildDir .. ".obj")

    files {
        "./src/*.c"
        "./src/atomic/*.c"
        "./src/audio/*.c"
        "./src/cpuinfo/*.c"
        "./src/dynapi/*.c"
        "./src/events/*.c"
        "./src/file/*.c"
        "./src/libm/*.c"
        "./src/render/*.c"
        "./src/render/*/*.c"
        "./src/stdlib/*.c"
        "./src/thread/*.c"
        "./src/timer/*.c"
        "./src/video/*.c"
        "./src/video/yuv2rgb/*.c"
    }

    includedirs {
        "./include/"
    }

    defines { "SDL_THREADS_DISABLED" }

    filter "configurations:Debug"
        symbols "On"

    filter "configurations:Release"
        optimize "On"

    filter "platforms:windows"
        defines { "__WIN32__" }

    filter "platforms:linux"
        defines { "__LINUX__" }
        buildoptions { "-g", "-O3" }