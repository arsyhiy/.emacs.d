;;; themes-arsyhiy.el --- theme configuration -*- lexical-binding: t; -*-
;; Author: arsyhiy
;; Package-Requires: ((emacs "30.1"))

;;; Commentary:
;;; Code:

(use-package modus-themes
  :ensure t
  :straight t
  :config
  (load-theme 'modus-vivendi :no-confirm))

(provide 'themes-arsyhiy)
;;; themes-arsyhiy.el ends here
