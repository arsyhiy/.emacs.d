;;-*- coding: utf-8; lexical-binding: t -*-


;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)



(provide 'arsyhiy-evil)

;;; arsyhiy-evil.el ends here
