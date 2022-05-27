(defun s::startup (/ )
  (setvar "osmode" 679) ;END, MID, CEN, INT, PER, NEA
  (setvar "pickfirst" 1)
  (command "._zoom" "_e") ;;zoom to extents
  (command "._imageframe" 1)
  (command "._imageframe" 0)
  (command "._qsave")
)

(autoload "Commands" '("CERASEALL" "CLEANER" "CXPLODE" "ZE"))
(autoload "CScriptRun" '("CSCRRUN"))
(autoload "BackgroundChanger" '("BGGREY" "BGBLACK" "BGWHITE"))
(autoload "PlotSettings" '("CPLOTANSIB" "CPLOTANSID" "CPLOTCUTEPDFISOA1" "CPLOTPDFCREATORA1" "CPLOTISOA1"))
(autoload "BFindV2-0" '("BFIND"))
