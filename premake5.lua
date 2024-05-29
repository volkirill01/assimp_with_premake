project "assimp"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "off"

	warnings "Off"
	linkoptions { "/ignore:4006" }

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	defines {
	 	"_CRT_SECURE_NO_WARNINGS",

		"ASSIMP_BUILD_NO_C4D_IMPORTER",
		"ASSIMP_BUILD_NO_COMPRESSED_IFC",
		"ASSIMP_BUILD_NO_IFC_IMPORTER",
		"ASSIMP_BUILD_NO_OPENGEX_IMPORTER",
		"ASSIMP_BUILD_NO_OPENGEX_EXPORTER",
		"ASSIMP_BUILD_NO_GLTF_EXPORTER",
		"ASSIMP_BUILD_NO_ASSBIN_IMPORTER",
		"ASSIMP_BUILD_NO_EXPORT",

		"N_FSEEKO"
	}

	files {
		"include/**.h",
		"include/**.cpp",
		"include/**.cpp",
		"code/**.h",
		"code/**.cpp",
		"contrib/poly2tri/poly2tri/**.h",
		"contrib/poly2tri/poly2tri/**.cc",
		"contrib/pugixml/src/**.cpp",
		"contrib/pugixml/src/**.hpp",
		"contrib/rapidjson/include/rapidjson/**.h",
		"contrib/stb/**.h",
		"contrib/unzip/**.h",
		"contrib/unzip/**.c",
		"contrib/utf8cpp/source/**/h",
		"contrib/zip/src/**.h",
		"contrib/zip/src/**.c",
		"contrib/zlib/**.h",
		"contrib/zlib/**.c"
	}

	includedirs {
		"$(ProjectDir)",
		"include",
		"code",
		"code/Common",
		"contrib",
		"contrib/zlib",
	 	"contrib/zip/src",
	 	"contrib/unzip",
		"contrib/pugixml/src",
		"contrib/utf8cpp/source",
		"contrib/rapidjson/include"
	}

	filter "system:windows"
		systemversion "latest"
		defines {
			"_WINDOWS"
		}
	filter "system:not windows"
		defines {
			'HAVE_UNISTD_H'
		}

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
