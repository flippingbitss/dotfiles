import qualified Data.Map as M
import XMonad
import qualified XMonad.Layout.Fullscreen as FS
import XMonad.Config.Desktop
import XMonad.Layout.NoBorders
import XMonad.Actions.CycleWS
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops (ewmh, ewmhFullscreen, fullscreenEventHook)
import XMonad.Util.SpawnOnce
import Graphics.X11.ExtraTypes.XF86
import XMonad.Layout.Spacing
import qualified XMonad.StackSet as W

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
     tiled   = spacingRaw True (Border 0 10 10 10) True (Border 10 10 10 10) True $ Tall nmaster delta ratio

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = toRational (2 / (1 + sqrt 5 :: Double))

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

doSizedFloat :: Rational -> Rational -> ManageHook
doSizedFloat w h =
  doRectFloat (W.RationalRect
    ((1 - w) / 2)
    ((1 - h) / 2)
    w
    h)

myManageHook = composeAll
 [ (stringProperty "WM_WINDOW_ROLE" =? "GtkFileChooserDialog") --> doCenterFloat
 -- , className =? "jetbrains-idea-ce" --> doSizedFloat 0.6 0.6
 -- , className =? "jetbrains-studio-ce" --> doSizedFloat 0.6 0.6
 , isDialog        --> doCenterFloat
 , isFullscreen    --> doFullFloat
 , FS.fullscreenManageHook
 ]

myStartupHook = do
  setWMName "LG3D"
  spawnOnce "setxkbmap -option ctrl:swapcaps"
  spawnOnce "$HOME/.config/polybar/launch.sh"
  spawnOnce "feh --bg-scale $HOME/Downloads/wallpaper.jpg"

main = do
 xmonad $ ewmh $ ewmhFullscreen desktopConfig { 
   terminal             = myTerminal,
   focusFollowsMouse    = myFocusFollowsMouse,
   clickJustFocuses     = myClickJustFocuses,
   borderWidth          = 1,
   normalBorderColor    = "#000000",
   focusedBorderColor   = "#2a2a2e",
   keys					= \c -> myKeys c `M.union` keys XMonad.def c,
   layoutHook           = avoidStruts $ myLayout,
   manageHook           = myManageHook <+> manageHook desktopConfig,
   handleEventHook      = handleEventHook desktopConfig,
   startupHook          = myStartupHook,
   workspaces           = myWorkspaces
 }
