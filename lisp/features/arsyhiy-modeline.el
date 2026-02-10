;;; arsyhiy-modeline.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 
;;; NOTE: rewrie doom-modeline config in more right way

;; packages


(use-package doom-modeline
  :straight t
  :init (doom-modeline-mode)
  :custom

  ;; Whether display icons in the mode-line.
  ;; While using the server mode in GUI, should set the value explicitly.
  (doom-modeline-major-mode-icon t)
 
  ;; Whether display the colorful icon for `major-mode'.
  ;; It respects `nerd-icons-color-icons'.
  (doom-modeline-major-mode-color-icon t)

  ;; Whether display the lsp icon. It respects option `doom-modeline-icon'.
  (doom-modeline-lsp-icon t)

  ;; Whether display the modern icons for modals.
  (doom-modeline-modal-modern-icon nil)

  ;; How tall the mode-line should be. It's only respected in GUI.
  ;; If the actual char height is larger, it respects the actual height.
  (doom-modeline-height 40)

  ;; Whether display the time icon. It respects option `doom-modeline-icon'.
  (doom-modeline-time-icon t)

  ;; Whether display the live icons of time.
  ;; It respects option `doom-modeline-icon' and option `doom-modeline-time-icon'.
  (doom-modeline-time-live-icon t)
  
  ;; Whether display the buffer encoding.
  (doom-modeline-buffer-encoding t)

  ;; Whether display the indentation information.
  (doom-modeline-indent-info t)

  ;; The maximum displayed length of the branch name of version control.
  (doom-modeline-vcs-max-length 50)

  ;; The function to display the branch name.
  (doom-modeline-vcs-display-function #'doom-modeline-vcs-name)


)

(provide 'arsyhiy-modeline)

;;; arsyhiy-modeline.el ends here
