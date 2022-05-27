(defun c:ODIMST40 ()
;check for layer and create if missing
 (if (= (tblsearch "layer" "Legend") nil)
 (command "-layer" "Make" "ODIMST40" "Color" "7" "" "Ltype" "Continuous" "" ""))
;check for style and create if missing
 (command "-style" "OTXTSTYLE1" "arial.TTF" "0" "1" "0" "n" "n")
 (if (not (tblsearch "Dimstyle" "ODIMST40"))
   (progn(command "dimstyle" "S" "ODIMST40")
     (command "dim" "style" "style1"
       "DIMDEC"   0
       "DIMALT"      0
       "DIMALTD"     3
       "DIMALTF"     0.0394
       "DIMALTRND"   0.0000
       "DIMALTTD"    3
       "DIMALTTZ"    0
       "DIMALTU"     2
       "DIMALTZ"     0
       "DIMASZ"      1.2000
       "DIMATFIT"    3
       "DIMAUNIT"    0
       "DIMAZIN"     0
       "DIMBLK"      "Oblique"
       "DIMBLK1"     ""	
       "DIMBLK2"     ""
       "DIMCLRD"     4
       "DIMCLRE"     4
       "DIMCLRT"     7
       "DIMDEC"      0
       "DIMDLE"      0.0000
       "DIMDLI"      7.0000
       "DIMEXE"      1.0000
       "DIMEXO"      1.0000
       "DIMFRAC"     0
       "DIMGAP"      0.5000
       "DIMJUST"     0
       "DIMLFAC"     1.0000
       "DIMLIM"      0
       "DIMLUNIT"    2
       "DIMLWD"     9
       "DIMLWE"      9
       "DIMRND"      0.0000
       "DIMSAH"      0
       "DIMSCALE"    20.0000
       "DIMSD1"      0
       "DIMSD2"      0
       "DIMSE1"      0
       "DIMSE2"      0
       "DIMSOXD"     0
       "DIMTAD"      1
       "DIMTIH"      0
       "DIMTIX"      1
       "DIMTM"       0
       "DIMTP"    0
       "DIMTMOVE"     1
       "DIMTOFL"     1
       "DIMTOH"      0
       "DIMTSZ"      0.0000
       "DIMTVP"      0.0000
       "DIMTXSTY"    "OTXTSTYLE1"
       "DIMTXT"      2.5000
       "DIMFIT"         5 \e)
     (command "dimstyle" "s" "ODIMST40")))
  (graphscr)
(princ)
)