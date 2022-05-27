(defun c:CERASEALL ()
  (command "._erase" "all" "")
  (princ)
)

(defun c:CLEANER ()
(command "audit" "Y")
(command "-purge" "a" "" "n") (command "-purge" "r" "" "n")
;;;(command "-overkill" "all" "" "")
(princ)
)

(defun c:ZE (/ )
  (command "._zoom" "_e") ;;zoom to extents
)

(defun c:ZA (/ )
  (command "._zoom" "_a") ;;zoom all
)

;Create a custom Explode function
(defun c:CXPLODE (/ ss)
  ;See if Pick First is enabled and if so, get the current objects
  (if (> (getvar "pickfirst") 0)
    (setq ss (ssget "_I" '((-4 . "<OR")(0 . "INSERT")(0 . "POLYLINE")(0 . "LWPOLYLINE")(-4 . "OR>"))))
  )
  ;If objects were not selected, prompt now
  (if (= ss nil)
    (setq ss (ssget '((-4 . "<OR")(0 . "INSERT")(0 . "POLYLINE")(0 . "LWPOLYLINE")(-4 . "OR>"))))
  )
  ;Use current implementation of the Explode command
    (initcommandversion 2)
  ;If objects were selected, explode them
  (if (/= ss nil)
    (command "._explode" ss "")
  )
  (princ)
)
