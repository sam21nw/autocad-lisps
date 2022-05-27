(setq ssLines (ssget '((0 . "line"))))
(command "._change" ssLines "" "_p" "_c" 10 "")
