;;; arsyhiy-diff-hl.el  ---  -*- coding: utf-8; lexical-binding: t -*-

;; Copyright (C) 2025
;; Version: 1.0
;; packages-Requires: ((emacs "30"))
;; Keywords: no keywords

;; Commentary:

;; no comment

;; Code 
;;; NOTE: rewrie diff-hl config in more right way

;; packages

(use-package diff-hl
    :straight t
	:ensure t
	:defer t
  :hook ((dired-mode         . diff-hl-dired-mode-unless-remote)
  (magit-pre-refresh  . diff-hl-magit-pre-refresh)
  (magit-post-refresh . diff-hl-magit-post-refresh))
  :init (global-diff-hl-mode))

(provide 'arsyhiy-diff-hl)
;;; arsyhiy-diff-hl.el ends here
