;;; utils.el  ---  -*- coding: utf-8; lexical-binding: t -*-

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

(setq-default use-short-answers t
  confirm-nonexistent-file-or-buffer nil)

(setq-default mouse-yank-at-point t)
(mouse-avoidance-mode 'exile)

(setq save-place-file (expand-file-name "saveplace" user-emacs-directory)
      save-place-forget-unreadable-files t)

(save-place-mode 1)

(setq-default scroll-conservatively 101
              scroll-margin 2
              recenter-positions '(5 bottom))


  (setq custom-file (locate-user-emacs-file "custom-vars.el"))
  (load custom-file 'noerror 'nomessage)
;  :bind (
;           ([escape] . keyboard-escape-quit) ;; Makes Escape quit prompts (Minibuffer Escape)
;           )

(provide 'utils)
;;; utils.el ends here

