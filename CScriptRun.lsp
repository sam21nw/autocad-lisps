(setq defFolder (getvar 'DWGPREFIX))
;;(setq defFolder "D:\\sam_working\\Settings\\Autocad\\Support files\\")
(setq defScrFolder "D:\\sam_working\\Settings\\Autocad\\Support files\\")

(defun c:CSCRRUN (/ fileDir err scr dwgList file)
(vl-catch-all-error-message
  (vl-load-com)		
  (setq fileDir (acet-ui-pickdir "Select Folder" defFolder) ;;;User Selects File Directory
    scr (getfiled "Select a Script File" defScrFolder "scr" 0) ;;;User Selects Script File
    dwgList (vl-directory-files fileDir "*.dwg" 1) ;;;Gets all DWG's in fileDir
  )
  
  (foreach dwg dwgList 
    (setq file (strcat fileDir "\\" dwg) ;;;Attach directory path to DWG name
  )
    (command "start" 
        (strcat "accoreconsole.exe /i " "\"" file "\"" " /s " "\"" scr "\"" " /l en-US"
      )
      (command "._delay" 5000)
    ) ;;;Run the script on each dwg through core console
  )
)
(princ)
)
