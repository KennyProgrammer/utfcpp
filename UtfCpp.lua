--
-- Main Premake5 file for building UtfCpp project.
-- Copyright (c) 2023-present by Danil (Kenny) Dukhovenko, All rights reserved.
-- 
-- Requirement:
--  - ForceEngine.lua
-- 

-- UtfCpp C++ Project
project "UtfCpp"
	kind          "StaticLib"
	language      "C++"
	cppdialect    "C++17"
	staticruntime "on"
	targetdir     ("%{ForceDir.BinLib}/" .. BuildDir .. "/%{prj.name}/Lib")
	objdir        ("%{ForceDir.BinLib}/" .. BuildDir .. "/%{prj.name}/Obj")

	files {
		-- NOTE: UtfCpp is header only library.
		"include/**.cpp",
        "include/**.h",
		"src/**.cpp"
	}

	includedirs {
		"include",
		"src"
	}

	filter "system:windows" 
		systemversion "latest"

	filter "configurations:Debug" 
		runtime "Debug"
		symbols "on"

	filter "configurations:Release" 
		runtime  "Release"
		optimize "on"