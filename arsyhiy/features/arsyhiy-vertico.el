;; -*- coding: utf-8; lexical-binding: t -*-

(use-package vertico
	:ensure t
	:defer t 
  :init
  (vertico-mode))

  (savehist-mode) ;; Enables save history mode

  (use-package marginalia
		:ensure t 
		:defer t
    :after vertico
    :init
    (marginalia-mode))

  (use-package nerd-icons-completion
		:defer t
		:ensure t
    :after marginalia
    :config
    (nerd-icons-completion-mode)
    :hook
    ('marginalia-mode-hook . 'nerd-icons-completion-marginalia-setup))


(provide 'arsyhiy-vertico)
;;; arsyhiy-vertico.el ends here
