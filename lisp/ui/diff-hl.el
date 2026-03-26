;;; diff-hl.el  ---  -*- coding: utf-8; lexical-binding: t -*-

(use-package diff-hl
  :straight t
  :ensure t
  :defer t
  :hook ((dired-mode         . diff-hl-dired-mode-unless-remote)
  (magit-pre-refresh  . diff-hl-magit-pre-refresh)
  (magit-post-refresh . diff-hl-magit-post-refresh))
  :init (global-diff-hl-mode))

(provide 'diff-hl)
;;; diff-hl.el ends here
