import XMonad
import XMonad.Config.Desktop
import XMonad.Layout.Tabbed
import XMonad.Layout.NoBorders
import XMonad.Layout.Spiral
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Fullscreen
import XMonad.Layout.Grid
import XMonad.Layout.IM
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Reflect
import XMonad.Layout.Combo
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Util.Run 
import XMonad.Util.NamedWindows
import XMonad.Hooks.DynamicLog  
import XMonad.Hooks.ManageDocks  
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.UrgencyHook
import System.IO
import System.Exit
import Data.List
import Data.Ratio ((%))
import qualified XMonad.StackSet    as W
import qualified Data.Map           as M

baseConfig = desktopConfig

term     = "1:term"
web      = "2:web"
media    = "3:media"
code     = "4:code"
chat     = "5:chat"
calendar = "6:calendar"
email    = "7:email"

taskWorkspaces = sort [term, web, media, chat, code, calendar, email]
myWorkspaces = taskWorkspaces ++ map show [length taskWorkspaces + 1 .. 9]

myManageHook = composeAll
    [ className =? "Firefox"        --> doShift web
    , className =? "Pidgin"         --> doShift chat
    , className =? "smplayer"       --> doShift media 
    , title     =? "Livestreamer Twitch GUI" --> doShift media]

myLayout = avoidStruts (
    Tall 1 (3/100) (1/2) |||
    Mirror (Tall 1 (3/100) (1/2)) |||
    tabbed shrinkText tabConfig |||
    Full |||
    spiral (6/7) |||
    Grid)|||
    noBorders (fullscreenFull Full)

mediaLayout = avoidStruts (
    tabbed shrinkText tabConfig) |||
    noBorders (fullscreenFull Full) 

chatLayout = avoidStruts (
    withIM (1%7) (Role "buddy_list") Grid)

webLayout =   avoidStruts (
    Tall 1 (3/100) (1/2) |||
    reflectHoriz (Tall 1 (3/100) (1/7)) |||
    tabbed shrinkText tabConfig |||
    Full) |||
    noBorders (fullscreenFull Full)

codeLayout =  avoidStruts (
    tabbed shrinkText tabConfig |||
    ThreeColMid 1 (3/100) (1/2) |||
    spiral (6/7))

myNormalBorderColor  = "#7c7c7c"
myFocusedBorderColor = "ffb6b0"

tabConfig = defaultTheme {
    activeBorderColor = "#7C7C7C",
    activeTextColor = "#CEFFAC",
    activeColor = "#000000",
    inactiveBorderColor = "#7C7C7C",
    inactiveTextColor = "#EEEEEE",
    inactiveColor = "#000000"
}

myBorderWidth = 1
        
main = do
xmproc <- spawnPipe "/usr/bin/xmobar"   
xmonad $ baseConfig
    { terminal    = "urxvt"
    , layoutHook  = onWorkspace web webLayout $
    onWorkspace media mediaLayout $
    onWorkspace chat chatLayout $
    onWorkspace code codeLayout $
    smartBorders $ myLayout
    , borderWidth = myBorderWidth
    , workspaces  = myWorkspaces
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , manageHook  = manageHook defaultConfig <+> manageDocks <+> myManageHook
    , logHook     = dynamicLogWithPP xmobarPP
        { ppOutput = hPutStrLn xmproc
        , ppLayout = xmobarColor "green" "" . shorten 50
        , ppTitle  = xmobarColor "white" "" . shorten 50
        }
    }

