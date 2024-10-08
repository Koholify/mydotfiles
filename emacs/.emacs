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
 '(package-selected-packages '(magit company csv-mode)))

(global-display-line-numbers-mode 1)
(fido-mode 1)
(fido-vertical-mode 1)

(add-to-list 'load-path "~/.emacs.d/custom-packages/emmet-mode")
(require 'emmet-mode)

(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)

(defun my-insert-tab-char () (interactive) (insert "\t"))

(defun my-set-tsv-mode ()
    (when (and (stringp buffer-file-name)
        (string-match "\\.tsv\\'" buffer-file-name))
            (setq-local csv-separators '("\t"))
            (setq-local csv-separator-chars '(?\t))
            (setq-local csv--skip-chars "^\n\t")
            (setq-local csv-separator-regexp "\t")
            (local-set-key (kbd "C-c C-i") 'my-insert-tab-char)))

(add-hook 'tsv-mode-hook 'csv-mode)
(add-hook 'csv-mode-hook 'my-set-tsv-mode)
(font-lock-add-keywords 'csv-mode
   '(("\\<[[:digit:]]+/f?[[:digit:]]+\\>\\|\\<[[:digit:]+\\.?[_[:digit:]]*\\>" 0 'font-lock-property-name-face t)
     ("@[_[:alnum:]]+" 0 'font-lock-builtin-face t)))

(add-hook 'icomplete-minibuffer-setup-hook (lambda() (local-set-key (kbd "TAB") 'icomplete-force-complete)))
(global-set-key (kbd "C-S-y") 'duplicate-line)

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
