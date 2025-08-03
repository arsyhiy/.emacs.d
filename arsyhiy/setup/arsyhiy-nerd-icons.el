(use-package nerd-icons
	:ensure t
	:defer t
  :if (display-graphic-p))


(use-package nerd-icons-dired
	:ensure t
	:defer t
  :hook (dired-mode . (lambda () (nerd-icons-dired-mode t))))

(use-package nerd-icons-ibuffer
	:ensure t 
	:defer t
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

(provide 'arsyhiy-nerd-icons)
