;; -*- lexical-binding: t; -*-

(use-package eglot
  :init
  (defun my/eglot-managed-setup ()
    "Setup managed mode with prefered extensions"
    (setq-local corfu-auto t)
    (flymake-mode -1)
    (abbrev-mode -1)
    (flycheck-mode t))
  
  :config
  (add-to-list 'eglot-server-programs
	       '((c-mode c++-mode)
                 . ("clangd"
                    "-j=8"
                    "--clang-tidy"
                    "--completion-style=detailed"
                    "--header-insertion=never")))

  :hook
  (eglot-managed-mode . my/eglot-managed-setup)
  )
(use-package flycheck
  :ensure t)

(use-package flycheck-eglot
  :after (flycheck eglot)
  :config (global-flycheck-eglot-mode 1))

(defun my/csharp-mode-setup ()
  "Setup csharp mode"
  (auto-save-mode -1))

(add-hook 'csharp-mode-hook 'my/csharp-mode-setup)
