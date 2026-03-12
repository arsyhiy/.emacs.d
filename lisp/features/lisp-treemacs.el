;; lisp-treemacs.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 

;; packages

(use-package treemacs
  :straight t
  :defer t
  :init

  :config
  (setq treemacs-width 35
        treemacs-position 'left
        treemacs-follow-after-init t
        treemacs-expand-after-init t
        treemacs-show-hidden-files t
        treemacs-is-never-other-window t
        treemacs-no-delete-other-windows t
        treemacs-select-when-already-in-treemacs 'move-back)

  (treemacs-follow-mode 1)

  (treemacs-filewatch-mode 1)

  (treemacs-git-mode 'deferred))

(use-package treemacs-icons-dired
  :straight t
  :hook (dired-mode . treemacs-icons-dired-enable-once))


(use-package treemacs-magit
  :straight t
  :after (treemacs magit))


(provide 'lisp-treemacs)

;; lisp-treemacs.el ends here
