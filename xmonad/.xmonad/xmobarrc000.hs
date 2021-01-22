Config { 

   -- appearance
    font =         "xft:Mononoki Nerd Font:pixelsize=12,Iosevka:size=10"
   , bgColor =      "#282c34"
   , fgColor =      "#ff6c6b"
   , position =     Static { xpos = 0 , ypos = 0, width = 1366, height = 24 }
   , border =       BottomB
   , borderColor =  "#646464"

   -- general behavior
   , lowerOnStart =     True    -- send to bottom of window stack on start
   , hideOnStart =      False   -- start with window unmapped (hidden)
   , allDesktops =      True    -- show on all desktops
   , overrideRedirect = True    -- set the Override Redirect flag (Xlib)
   , pickBroadest =     False   -- choose widest display (multi-monitor)
   , persistent =       True    -- enable/disable hiding (True = disabled)
   , iconRoot = "/home/afrian/.xmonad/xpm/"  -- default: "."
   -- plugins
   --   Numbers can be automatically colored according to their value. xmobar
   --   decides color based on a three-tier/two-cutoff system, controlled by
   --   command options:
   --     --Low sets the low cutoff
   --     --High sets the high cutoff
   --
   --     --low sets the color below --Low cutoff
   --     --normal sets the color between --Low and --High cutoffs
   --     --High sets the color above --High cutoff
   --
   --   The --template option controls how the plugin is displayed. Text
   --   color can be set by enclosing in <fc></fc> tags. For more details
   --   see http://projects.haskell.org/xmobar/#system-monitor-plugins.
  , commands = [ 
                      -- Time and date
                      Run Date "<fn=1>\xf133</fn> %b %d %Y - (%H:%M)" "date" 50
                      -- Network up and down
                    , Run Network "enp6s0" ["-t", "<fn=1>\xf0aa</fn> <rx>kb  <fn=1>\xf0ab</fn> <tx>kb"] 20
                      -- Cpu usage in percent
                    , Run Cpu ["-t", "<fn=1>\xf108</fn> cpu: (<total>%)","-H","50","--high","red"] 20
                      -- Ram used number and percent
                    , Run Memory ["-t", "<fn=1>\xf233</fn> mem: <used>M (<usedratio>%)"] 20
                      -- Disk space free
                    , Run DiskU [("/", "<fn=1>\xf0c7</fn> hdd: <free> free")] [] 60
                      -- Runs custom script to check for pacman updates.
                      -- This script is in my dotfiles repo in .local/bin.
                    ---, Run Com "$HOME/.local/bin/pacupdate" [] "pacupdate" 36000
                      -- Runs a standard shell command 'uname -r' to get kernel version
                    , Run Com "uname" ["-r"] "" 3600
                      -- Prints out the left side items such as workspaces, layout, etc.
                      -- The workspaces are 'clickable' in my configs.
                    ---, Run UnsafeStdinReader
		    , Run StdinReader
                ]
    
    -- layout
   , sepChar =  "%"   -- delineator between plugin names and straight text
   , alignSep = "}{"  -- separator between left-right alignment
   , template = " %uname% | %cpu% | %memory% | %disku% | %enp6s0% | %pacupdate% | %date% "
   --, template = "<action=`xdotool key control+alt+g`><icon=haskell_20.xpm/></action><fc=#666666>  |</fc> %UnsafeStdinReader% }{ 		<fc=#666666><fn=2>|</fn> </fc><fc=#b3afc2><fn=1></fn>  %uname% </fc><fc=#666666> <fn=2>|</fn></fc><fc=#ecbe7b> %cpu% </fc><fc=#666666> <fn=2>|</fn></fc><fc=#ff6c6b> %memory% </fc><fc=#666666> <fn=2>|</fn></fc><fc=#51afef> %disku% </fc><fc=#666666> <fn=2>|</fn></fc>	<fc=#98be65> %enp6s0% </fc><fc=#666666> <fn=2>|</fn></fc><fc=#c678dd><fn=1></fn>  %pacupdate% </fc><fc=#666666> <fn=2>|</fn></fc>	<fc=#46d9ff> %date%  </fc>"
    }

