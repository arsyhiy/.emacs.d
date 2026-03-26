;; gui.el  ---  -*- coding: utf-8; lexical-binding: t -*-

(defun my/configure-gui ()
  (when (display-graphic-p)

    (menu-bar-mode -1)
    (tool-bar-mode -1)
    (scroll-bar-mode -1)
    (tooltip-mode -1)
    (set-fringe-mode 10)
    (blink-cursor-mode 0)

    (setq use-file-dialog nil
          use-dialog-box nil
          show-help-function nil
          mouse-wheel-progressive-speed t
          scroll-conservatively 10
          frame-resize-pixelwise t
          inhibit-startup-message t)

    (global-display-line-numbers-mode t)

    (setq-default
     inhibit-compacting-font-caches t
     cursor-in-non-selected-windows nil)

    (setq scroll-step 1
      scroll-margin 3
      scroll-preserve-screen-position t)
    
    (setq ring-bell-function 'ignore)
    (setq-default truncate-lines t)
    (setq redisplay-dont-pause t)

    (when (fboundp 'pixel-scroll-precision-mode)
      (pixel-scroll-precision-mode 1))

    (add-to-list 'default-frame-alist '(fullscreen . maximized))))

(my/configure-gui)

(provide 'gui)
;; lisp-gui.el ends here
