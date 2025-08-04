




(defun arsyhiy-configure-gui()
  (setq show-help-function nil)    ; No help text
  (setq use-file-dialog nil)       ; No file dialog
  (setq use-dialog-box nil)        ; No dialog box
  (setq pop-up-windows nil)       ; No popup windows
  (setq menu-bar-mode nil)         ;; Disable the menu bar
  (setq tool-bar-mode nil)         ;; Disable the tool bar
  ;;(setq inhibit-startup-screen t)  ;; Disable welcome screen
  (setq scroll-bar-mode nil)                    ; No scroll bars
  (blink-cursor-mode t)     ;; Don't blink cursor
  ;;(global-visual-line-mode t)           ;; Enable truncated lines
  ;;(display-line-numbers-type 'relative) ;; Relative line numbers
  (global-display-line-numbers-mode t)  ;; Display line numbers
  (setq mouse-wheel-progressive-speed t) ;; Disable progressive speed when scrolling
  (setq scroll-conservatively 10) ;; Smooth scrolling
  ;;(setq scroll-margin 8)
	(setq package-enable-at-startup nil
    inhibit-startup-message   t
  frame-resize-pixelwise    t        ;; fine resize
  package-native-compile    t)       ;; native compile packages
  (scroll-bar-mode -1)               ;; disable scrollbar
  (tool-bar-mode -1)                 ;; disable toolbar
  (tooltip-mode -1)                  ;; disable tooltips
  (set-fringe-mode 10)               ;; give some breathing room
  (blink-cursor-mode 0)              ;; disable blinking cursor

)

(toggle-frame-fullscreen)  
(arsyhiy-configure-gui)

(provide 'arsyhiy-gui)
