;;----------------------------------------------------------------------;;
;ADD UP TOTAL LENGHTS OF SELECTED OBJECTS.
(defun c:TLEN (/ e ss len i)
  (setq len 0.0 ss (ssget '((0 . "LINE,SPLINE,LWPOLYLINE,POLYLINE,ARC,CIRCLE,ELLIPSE"))))
  (foreach e (vl-remove-if 'listp (mapcar 'cadr (ssnamex ss)))
    (setq len (+ len (vlax-curve-getDistAtParam e (vlax-curve-getEndParam e))))
  )
  (princ (strcat "\nTotal length = " (rtos len 2 3)))
  (vlax-invoke (vlax-get (vlax-get (vlax-create-object "htmlfile") 'ParentWindow) 'ClipBoardData) 'setData "TEXT" (rtos len 2 3))
  ;above copys to clipboard
  (princ)
)