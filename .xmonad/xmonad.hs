import qualified Data.Map as M
import XMonad
import qualified XMonad.Layout.Fullscreen as FS
import XMonad.Config.Desktop
import XMonad.Layout.NoBorders
import XMonad.Actions.CycleWS
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops (ewmh, fullscreenEventHook)
import XMonad.Util.SpawnOnce
import Graphics.X11.ExtraTypes.XF86

myModMask = mod4Mask
myTerminal = "alacritty"
myBrowser = "firefox-developer-edition"
myLauncher = "rofi -show drun"
myFocusFollowsMouse = False
myClickJustFocuses = False

myWorkspaces = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII"]

myKeys conf = M.fromList $
	[((myModMask, xK_n), (spawn myTerminal)),
	 ((myModMask, xK_m), (spawn myBrowser)),
	 ((myModMask, xK_r), (spawn myLauncher)),
	 ((0, xF86XK_AudioLowerVolume), (spawn "amixer -q sset Master 3%-")),
	 ((0, xF86XK_AudioRaiseVolume), (spawn "amixer -q sset Master 3%+")),
	 ((0, xF86XK_AudioMute), (spawn "amixer -q sset Master toggle")),
	 ((myModMask .|. shiftMask, xK_j), prevWS),
	 ((myModMask .|. shiftMask, xK_k), nextWS)
	]


myLayout = tiled ||| (Mirror tiled) ||| Full
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = toRational (2 / (1 + sqrt 5 :: Double))

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

myManageHook = composeAll
 [ (stringProperty "WM_WINDOW_ROLE" =? "GtkFileChooserDialog") --> doFullFloat
 , isFullscreen    --> doFullFloat
 , FS.fullscreenManageHook
 ]

myStartupHook = do
  spawnOnce "setxkbmap -option ctrl:swapcaps"
  spawnOnce "$HOME/.config/polybar/launch.sh"
  spawnOnce "feh --bg-scale $HOME/Downloads/wallpaper.jpg"

main = do
 xmonad $ ewmh desktopConfig { 
   terminal             = myTerminal,
   focusFollowsMouse    = myFocusFollowsMouse,
   clickJustFocuses     = myClickJustFocuses,
   borderWidth          = 1,
   normalBorderColor    = "#000000",
   focusedBorderColor   = "#2a2a2e",
   keys					= \c -> myKeys c `M.union` keys XMonad.def c,
   layoutHook           = avoidStruts $ myLayout,
   manageHook           = myManageHook <+> manageHook desktopConfig,
   handleEventHook      = fullscreenEventHook <+> handleEventHook desktopConfig,
   startupHook          = myStartupHook,
   workspaces           = myWorkspaces
 }
