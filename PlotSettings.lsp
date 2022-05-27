(setq fileName(strcat (getvar 'DWGPREFIX) (substr (setq dwg (getvar 'DWGNAME)) 1 (- (strlen dwg) 4)) ".pdf"))
(defun c:CPLOTANSID ()
(command "._zoom" "_e")
(if (setq filename (getfiled "Enter filename" ""  "pdf" 1))
  (progn
    (command "-plot" "Y" "Model" "DWG To PDF.pc3" "ANSI expand D (34.00 x 22.00 Inches)" "Inches"
    "Landscape" "N" "Extents" "Fit" "Center" "Y" "WB.ctb" "Y" "As displayed" fileName "Y" "Y"))
(princ) )
    (command "._qsave")
)
(defun c:CPLOTANSIB ()
(command "._zoom" "_e")
(if (setq filename (getfiled "enter CAD filename" ""  "pdf" 1))
  (progn
    (command "-plot" "Y" "Model" "DWG To PDF.pc3" "ANSI expand B (17.00 x 11.00 Inches)" "Inches"
    "Landscape" "N" "Extents" "Fit" "Center" "Y" "WB.ctb" "Y" "As displayed" fileName "Y" "Y"))
(princ) )
    (command "._qsave")
)
(defun c:CPLOTCUTEPDFISOA1 ()
  (progn
    (command "-plot" "Y" "Model" "CutePDF Writer" "ISO A1" "Millimeters"
    "Landscape" "N" "Extents" "Fit" "Center" "Y" "WB.ctb" "Y" "As displayed" "N" "Y" "Y"))
(princ) 
    (command "._qsave")
)
(defun c:CPLOTPDFCREATORA1 ()
  (progn
    (command "-plot" "Y" "Model" "PDFCreator" "A1" "Millimeters"
    "Landscape" "N" "Extents" "Fit" "Center" "Y" "WB.ctb" "Y" "As displayed" "N" "Y" "Y")
(princ) )
    (command "._qsave")
)
(defun c:CPLOTISOA1 ()
(setvar "EPDFSHX" 0)
(if (setq filename (getfiled "enter CAD filename" ""  "pdf" 1))
  (progn
    (command "-plot" "Y" "Model" "DWG To PDF.pc3" "ISO A1 (841.00 x 594.00 MM)" "Millimeters"
    "Landscape" "N" "Extents" "Fit" "Center" "Y" "WB.ctb" "Y" "As displayed" fileName "Y" "Y"))
(princ) )
    (command "._qsave")
)
