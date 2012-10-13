import("Macaroni", "ProjectTemplates", "1")

require "os"
require "SimpleProject"

-- bjamFlags = {
--     flags={ Demo=[[<define>UNICODE<define>_UNICODE
--                     <toolset>msvc:<linkflags>/SUBSYSTEM:WINDOWS
--                     <toolset>msvc:<define>COMPILE_TARGET_WINDOWS
--                     ]],
--              },
--              requirements = [[
--                   <toolset>msvc:<define>COMPILE_TARGET_WINDOWS
--              ]]
-- }
properties.bjam_options = " release ";

SimpleProject{
  group="Lp3",
  project="Lp3.Engine",
  version="1.0.0.0",
  src="src",
  target="target",
  libShortName="Lp3Ray",
  dependencies = {
    load("Macaroni", "Boost-headers", "1.51"):Target("lib"),
    load("Macaroni", "CppStd", "2003"):Target("lib"),
    --load("Lp3", "Lp3.Engine.Core", "0.1.0"):Target("lib"),
  },
  -- bjamFlags = bjamFlags,
};

oldBuild = build
function build()
    oldBuild()
    os.execute([[target\bin\msvc-11.0\release\threading-multi\Demo.exe]])
end
