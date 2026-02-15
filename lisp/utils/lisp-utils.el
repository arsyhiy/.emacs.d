;;; lisp-utils.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;;; Commentary:

;; no comment

;;; Code:

(defun open-config-file ()
  (interactive)
  (find-file (expand-file-name "init.el" user-emacs-directory)))



														 
(global-set-key (kbd "C-x t")											 
                (lambda ()											 
                  (interactive)											 
                  (start-process "gnome-terminal" nil "gnome-terminal" "--working-directory" default-directory)))


(use-package emacs
  :straight t
  :bind
  ("C-+" . text-scale-increase)
  ("C--" . text-scale-decrease)
  ("<C-wheel-up>" . text-scale-increase)
  ("<C-wheel-down>" . text-scale-decrease))

(setq-default use-short-answers t                     ; Replace yes/no prompts with y/n
  confirm-nonexistent-file-or-buffer nil) ; Ok to visit non existent files


(setq-default mouse-yank-at-point t) ; Yank at point rather than pointer
(mouse-avoidance-mode 'exile)        ; Avoid collision of mouse with point

(setq save-place-file (expand-file-name "saveplace" user-emacs-directory)
      save-place-forget-unreadable-files t)

(save-place-mode 1)

(setq-default scroll-conservatively 101       ; Avoid recentering when scrolling far
              scroll-margin 2                 ; Add a margin when scrolling vertically
              recenter-positions '(5 bottom)) ; Set re-centering positions


  ;; Move customization variables to a separate file and load it, avoid filling up init.el with unnecessary variables
  (setq custom-file (locate-user-emacs-file "custom-vars.el"))
  (load custom-file 'noerror 'nomessage)
;  :bind (
;           ([escape] . keyboard-escape-quit) ;; Makes Escape quit prompts (Minibuffer Escape)
;           )


(provide 'lisp-utils)
;;; lisp-utils.el ends here
