project "libsndfile"
    kind "StaticLib"
    language "C"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "src/**.h",
        "src/**.c",
    }

    removefiles { "src/test_*.c" }

    includedirs
    {
        "src",
        "include",
        "include",
        "CMakeBuild/src",
    }

    disablewarnings {4244, 4267, 4996, 4146}

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
        symbols "off"