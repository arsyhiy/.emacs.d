;; C/C++ Tree-sitter режимы
(use-package cc-mode
  :ensure nil
  :mode (("\\.c\\'"  . c-ts-mode)
         ("\\.h\\'"  . c-ts-mode)
         ("\\.cpp\\'" . c++-ts-mode)
         ("\\.hpp\\'" . c++-ts-mode))
  :hook ((c-ts-mode . (lambda ()
                        (setq indent-tabs-mode nil
                              c-basic-offset 4)))
         (c++-ts-mode . (lambda ()
                          (setq indent-tabs-mode nil
                                c-basic-offset 4)))))
(provide 'cc-arsyhiy)
