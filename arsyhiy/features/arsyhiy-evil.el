;; arsyhiy-evil.el  --evil mode configuration -*- coding: utf-8; lexical-binding: t -*-


(use-package evil
	:ensure t
	:defer t
  :init ;; Execute code Before a package is loaded
  (evil-mode)
  :config ;; Execute code After a package is loaded
  :custom ;; Customization of package custom variables
  (evil-want-keybinding nil)    ;; Disable evil bindings in other modes (It's not consistent and not good)
  (evil-want-C-u-scroll t)      ;; Set C-u to scroll up
  (evil-want-C-i-jump nil)      ;; Disables C-i jump
  (evil-undo-system 'undo-redo) ;; C-r to redo
  (org-return-follows-link t)   ;; Sets RETURN key in org-mode to follow links
  ;; Unmap keys in 'evil-maps. If not done, org-return-follows-link will not work
  :bind (:map evil-motion-state-map
              ("SPC" . nil)
              ("RET" . nil)
              ("TAB" . nil)))

(use-package evil-collection
	:ensure t
	:defer t
  :after evil
  :config
 ;; Setting where to use evil-collection
  (setq evil-collection-mode-list '(dired ibuffer magit corfu vertico consult))
  (evil-collection-init))

(mapc (lambda (mode)
  (evil-set-initial-state mode 'emacs)) '(elfeed-show-mode
                                          elfeed-search-mode
                                          forge-pullreq-list-mode
                                          forge-topic-list-mode
                                          dired-mode
                                          dashboard-mode
                                          tide-references-mode
                                          image-dired-mode
                                          image-dired-thumbnail-mode
                                          eww-mode))


(provide 'arsyhiy-evil)

;;; arsyhiy-evil.el ends here
