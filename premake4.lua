function newplatform(plf)
    local name = plf.name
    local description = plf.description
 
    -- Register new platform
    premake.platforms[name] = {
        cfgsuffix = "_"..name,
        iscrosscompiler = true
    }
 
    -- Allow use of new platform in --platfroms
    table.insert(premake.option.list["platform"].allowed, { name, description })
    table.insert(premake.fields.platforms.allowed, name)
 
    -- Add compiler support
    -- gcc
    premake.gcc.platforms[name] = plf.gcc
    --other compilers (?)
end
 
function newgcctoolchain(toolchain)
    newplatform {
        name = toolchain.name,
        description = toolchain.description,
        gcc = {
            cc = toolchain.prefix .. "gcc",
            cxx = toolchain.prefix .. "g++",
            ar = toolchain.prefix .. "ar",
            cppflags = "-MMD " .. toolchain.cppflags
        }
    }
end

newplatform{
  name = "arm",
  description = "ARM for Raspberry Pi",
  gcc = {
    cc = "/usr/bin/arm-linux-gnueabihf-gcc",
    cxx = "/usr/bin/arm-linux-gnueabihf-g++",
    ar = "/usr/bin/arm-linux-gnueabihf-ar"
  }
}

solution "Adafruit_TCS34725_Rpi"
  configurations {"debug","release","mocks"}
  platforms {"arm", "native"}
  project "Adafruit_TCS34725_Rpi"
    targetname "Adafruit_TCS34725_Rpi"
  	language "C++"
  	kind "ConsoleApp"
		files {
			"*.h",
			"*.cc",
			"*.cpp"
		}

		buildoptions{"-std=c++11", "-Wformat=2", "-Wall", "-pipe", "-fPIC"}
		links { "pthread","rt","wiringPi" }
    includedirs{"/usr/arm-linux-gnueabihf/include"}
    libdirs {"/usr/arm-linux-gnueabihf/lib"}
  	configuration "debug"
  		flags { "Symbols" }
  		defines { "DEBUG" }
  		targetdir "./"
  		objdir "obj"
    
        -- postbuildcommands {
        --   "scp test pi@testpi.local:test",
        --   "ssh pi@testpi.local 'gdbserver --once :9999 ./test'"
        -- }

    configuration "release"
  		flags { "Optimize" }
  		defines { "NDEBUG" }
  		targetdir "./"
  		objdir "obj"


    -- project "test"
    --   targetname "androidcmd-test"
    -- 	language "C++"
    -- 	kind "ConsoleApp"
    --   local gtest = "googletest/googletest"
    --   local gmock = "googletest/googlemock"

  	-- 	files {
  	-- 		"src/*.h",
  	-- 		"src/*.cc",
  	-- 		"devicedrivers/*.c",
  	-- 		"devicedrivers/*.h",
    --     "tests/*.cc",
    --     "tests/*.h"
  	-- 	}
    --   excludes {
    --     "src/main.cc"
    --   }
    --   libdirs { gtest, gmock }
    --   includedirs {
    --     gtest .. "/include",
    --     gmock .. "/include"
    --   }

  	-- 	buildoptions{"-std=c++11", "-Wformat=2", "-Wall", "-pipe", "-fPIC"}
  	-- 	links { "gtest", "gmock_main", "pthread","rt","wiringPi", "wiringPiDev" }

    -- 	configuration "debug"
    -- 		flags { "Symbols" }
    --     defines { "DEBUG", "_TEST" }
    -- 		targetdir "./"
    -- 		objdir "obj"


    --   configuration "release"
    -- 		flags { "Optimize" }
    -- 		defines { "NDEBUG","_TEST" }
    -- 		targetdir "./"
    -- 		objdir "obj"
