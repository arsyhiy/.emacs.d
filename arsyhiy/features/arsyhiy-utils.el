;; -*- coding: utf-8; lexical-binding: t -*-

(defun open-config-file ()
  (interactive)
  (find-file (expand-file-name "config.org" user-emacs-directory)))



(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(set-default-coding-systems 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)



(use-package emacs
  :bind
  ("C-+" . text-scale-increase)
  ("C--" . text-scale-decrease)
  ("<C-wheel-up>" . text-scale-increase)
  ("<C-wheel-down>" . text-scale-decrease))

(setq-default use-short-answers t                     ; Replace yes/no prompts with y/n
  confirm-nonexistent-file-or-buffer nil) ; Ok to visit non existent files

(setq-default visible-bell nil             ; No visual bell
              ring-bell-function 'ignore)  ; No bell

(setq-default mouse-yank-at-point t) ; Yank at point rather than pointer
(mouse-avoidance-mode 'exile)        ; Avoid collision of mouse with point

(setq save-place-file (expand-file-name "saveplace" user-emacs-directory)
      save-place-forget-unreadable-files t)

(save-place-mode 1)

(setq-default scroll-conservatively 101       ; Avoid recentering when scrolling far
              scroll-margin 2                 ; Add a margin when scrolling vertically
              recenter-positions '(5 bottom)) ; Set re-centering positions

(provide 'arsyhiy-utils)

;;; arsyhiy-utils.el ends here
