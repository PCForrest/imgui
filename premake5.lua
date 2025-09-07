project "imgui"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "Off"

	targetdir (bin_dir .. "/Libs/Vendor/%{prj.name}")
	objdir (int_dir .. "/Libs/Vendor/%{prj.name}")

	pchheader "%{prj.name}/_framework/pch.hpp"
	pchsource "src/%{prj.name}/_framework/pch.cpp"

	files
	{
		"premake5.lua",
		"src/**.h",
		"src/**.hpp",
		"src/**.cpp",
		"src/**.natstepfilter",
		"src/**.natvis",
	}

	removefiles
	{
		"premake5.lua",
	}

	includedirs
	{
		"src",
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

	filter "configurations:Debug"
		defines { "_DEBUG" }
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines { "NDEBUG" }
		runtime "Release"
		optimize "on"

	filter {}