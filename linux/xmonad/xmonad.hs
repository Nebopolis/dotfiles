import XMonad
import XMonad.Config.Desktop
import XMonad.Layout.Tabbed
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Hooks.DynamicLog  
import XMonad.Hooks.ManageDocks  
import XMonad.Util.Run  
import System.IO  

baseConfig = desktopConfig

main = do

xmproc <- spawnPipe "/usr/bin/xmobar"   
xmonad $ baseConfig
    { terminal    = "urxvt"
    , layoutHook  = avoidStruts $ layoutHook defaultConfig
    , manageHook  = manageHook defaultConfig <+> manageDocks
    , logHook 	  = dynamicLogWithPP xmobarPP
	{ ppOutput = hPutStrLn xmproc
	, ppTitle  = xmobarColor "white" "" . shorten 50
	, ppLayout = const "" 
	}
    }
