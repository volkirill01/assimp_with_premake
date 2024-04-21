project "assimp"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
    staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"include/**.h",
		"include/**.hpp",
		"include/**.inl",
		"code/**.h",
		"code/**.cpp",
		"code/**.hpp",
		"code/**.c",
		"code/**.inl",

		"contrib/**.h",
		"contrib/**.cpp",
		"contrib/**.hpp",
		"contrib/**.c",
		"contrib/**.inl",
	}

	includedirs
	{
		"include",
		"code",
		"contrib/**"
	}

	filter "system:windows"
		systemversion "latest"

	filter "system:linux"
		pic "on"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"
