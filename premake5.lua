project "imgui"
	kind "StaticLib"
	language "C++"

	targetdir (bin_dir .. "/Libs/Vendor/%{prj.name}")
	objdir (int_dir .. "/Libs/Vendor/%{prj.name}")

    -- Not using precompiled headers

	files
	{
		"premake5.lua",
		"*.h",
		"*.cpp",
		--"*.hpp",
		--"*.natstepfilter",
		--"*.natvis",
	}

	removefiles
	{
		"premake5.lua",
	}

	includedirs
	{
		"%{IncludeDir.imgui}",
	}

	dependson
	{
		-- nil
	}

	links
	{
		-- nil
	}

	defines
	{
		"_LIB",
	}
	
	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "off"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "off"

	filter "configurations:Debug"
		defines { "_DEBUG" }
		runtime "Debug"
		symbols "on"

	filter "configurations:Profile"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "on"

	filter "configurations:Release"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "on"

	filter {}
