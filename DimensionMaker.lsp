;-------------------------------------------------------------------------------------------------------;
;  dim_maker						;
;-------------------------------------------------------------------------------------------------------;
; This routine creates the dimension styles 								;
;	- based on user input for text height								;
;	- displays approximate scale value based on length provided					;
;-------------------------------------------------------------------------------------------------------;

(defun c:dm (/) (c:dim_maker))
(defun c:dim_maker (/ usercmd userosm *error* mode dist dm_scl dm_name dm_redef txt)

(defun *error* (msg)
    (if (not
          (member msg '("console break" "Function cancelled" "quit / exit abort" "" nil))
        )
      (princ (strcat "\nError: " msg))
    )     
    (and usercmd (setvar "cmdecho" usercmd)
	 userosm (setvar "osmode"  userosm)
	 userxpm (setvar "expert"  userxpm)
        )
    (princ)
  )	; end error function
 
	; routine starts here
  (setq usercmd	(getvar "cmdecho")
	userosm (getvar "osmode")
	userxpm (getvar "expert")
	)
  (setvar "cmdecho"  0)
  (setvar "osmode"   0)
  (setvar "expert"   5)

  (initget 0 "Calc Mnl")
    (setq mode  (getkword "\nEnter Mode for dimension text scale [Calculate text scale/Manual] <Manual>: "))
      (or mode (setq mode "Mnl"))
 
  (if (= mode "Calc")
    (progn
      (setvar "osmode" 1)   
      (setq  dist (getdist "\nDistance or click points: ")
	     dm_scl  (* dist 0.006))
	     (prompt "\nDimension Text will be set to: ")
	      (prin1 dm_scl)
      (setq dm_scl
	(getint "\nEnter Desired Dimension Text Height: "))
	(or dm_scl (setq dm_scl (fix (* dist 0.006))))
      (setvar "osmode" 0)
     )
   )
   
  (if (= mode "Mnl")
    (progn 
      (initget 1)
      (setq dm_scl
	  (getint "\nEnter Desired Dimension Text Height: ")
	)
    )
  )
 
    (setq dm_name (strcat "DIM "(itoa dm_scl)"")   
	  txt 	  (tblsearch "style" "TEXT")
    )
	  (if (null txt)
	      (progn
		(command "_-style"
			 "TEXT"
			 "arial.ttf"
			 "0.0"
			 "1.0"
			 "0"
			 ""
			 ""
		)
	      )
	  )
       
    (if (tblsearch "dimstyle" dm_name)
      (progn
        (prompt
          (strcat "\nDimension Style " dm_name " already exists!"))
        (initget "Yes No")
        (setq dm_redef
	  (getkword "\nRedefine? [Yes/No] <No>: "))
	  (or dm_redef (setq dm_redef "No"))
      )
    )
    (if (member dm_redef '("Yes" nil))
	  (progn
	     (command 	"_dimtxt" dm_scl
			;"_dimlfac "1"
			"_dimgap" (/ dm_scl 2)
			"_dimtad" "1"
                                           "_dimalt" "1"
                                           "_dimaltu" "4"
                                           "_dimaltd" "5"
			"_dimassoc" "1"
			"_dimasz" dm_scl
			"_dimblk" "Oblique"
			"_dimclrd" "4"
			"_dimclre" "4"
			"_dimclrt" "7"
			"_dimexe" (* dm_scl 0.50)
			"_dimexo" (* dm_scl 0.75)
			"_dimatfit" "3"
			"_dimjust" "0"
			"_dimtih" "0"
			"_dimtoh" "0"
			"_dimtix" "1"
			"_dimdec" "0"
			"_dimlwd" "-1"
			"_dimtxsty" "TEXT"
			"_dimstyle" "_save" dm_name
		) 
	(princ)
	(prompt (strcat "\nDimension Style " dm_name " successfully created!"))
	)
    )
	
	(*error* "")
	(princ)
  )
	
(prompt "\n dim_maker is now loaded type <DM> to start! ")