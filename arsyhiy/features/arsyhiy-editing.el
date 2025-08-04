
(defun arsyhiy-edit ()
	(setq tab-width 2)
)

(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(defun arsyhiy-utf8 ()
	(set-default-coding-systems 'utf-8)
	(set-language-environment "UTF-8")
	(prefer-coding-system 'utf-8)
	(set-terminal-coding-system 'utf-8)
)

(arsyhiy-utf8)
(arsyhiy-edit)

(provide 'arsyhiy-editing)
