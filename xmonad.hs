import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
 
myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat
    , className =? "Vncviewer" --> doFloat
    , className =? "firefox" --> doShift "3-web"
    , className =? "firefox-bin" --> doShift "3-web" 
    , className =? "ibm-notes85" --> doShift "4-Mail" 
    ]
 
main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook -- make sure to include myManageHook definition from above
                        <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        , terminal           = "/usr/local/bin/urxvtc.sh"
        , borderWidth = 1
        , normalBorderColor  = "#333333"
	, focusedBorderColor = "#AFAF87"
        , workspaces = ["1-shell-pro", "2-shell-pre", "3-web", "4-Mail", "5-Same" , "6-Vt320" , "7", "8" , "9-rubish" ]
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        ]
