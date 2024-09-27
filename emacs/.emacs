(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist '(("." . "~/.emacs.d/backups")))
 '(custom-enabled-themes '(wombat))
 '(eglot-ignored-server-capabilities nil)
 '(eldoc-echo-area-prefer-doc-buffer 'maybe)
 '(eldoc-echo-area-use-multiline-p nil)
 '(initial-buffer-choice "~/.emacs.d/org/main.org")
 '(package-selected-packages '(csv-mode company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 98 :width normal :foundry "outline" :family "Hack NFM"))))
 '(eglot-highlight-symbol-face ((t (:inherit bold)))))
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(add-to-list 'load-path "~/.emacs.d/custom-packages/emmet-mode")
(require 'emmet-mode)

(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)

(add-hook 'c-mode-common-hook (lambda() (local-set-key (kbd "C-c C-o") 'ff-find-other-file)))
(add-hook 'c-mode-common-hook (lambda() (company-mode t)))
(add-hook 'c-mode-common-hook 'eglot-ensure)
(global-set-key (kbd "C-c e") 'eglot)

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '((c-mode c++-mode)
                 . ("clangd"
                    "-j=8"
                    "--clang-tidy"
                    "--completion-style=detailed"
                    "--header-insertion=never"))))
