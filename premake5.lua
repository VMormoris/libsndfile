project "libsndfile"
    kind "StaticLib"
    language "C"
    staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

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
    }

    disablewarnings {4244, 4267, 4996, 4146}
    filter "system:linux"
        pic "On"
        systemversion "latest"

        includedirs
        {
            "CMakeBuild/src/linux",
        }

    filter "system:windows"
        systemversion "latest"

        includedirs
        {
            "CMakeBuild/src/windows",
        }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
        symbols "off"