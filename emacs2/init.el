;; -*- lexical-binding: t; -*-

(setq emacs-path-custom (if (string= "windows-nt" system-type)
			    "~/.emacs.d"
			  "~/.config/emacs"))

(setq custom-file (file-name-concat emacs-path-custom "config.el"))
(load-file custom-file)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(mapc 'load (file-expand-wildcards "~/.emacs.d/package-configs/*.el"))

(if (string= "windows-nt" system-type)
  (let ((sys "windows"))
    (setenv "PATH" (with-temp-buffer
                     (insert-file-contents "~/.emacs.d/.env")
                     (goto-char (point-min))
                     (buffer-string)))
    (setq exec-path (split-string (getenv "PATH") ";"))))

(add-to-list 'backup-directory-alist `(("." . ,(file-name-concat emacs-path-custom "backups"))))
(setq initial-buffer-choice (file-name-concat emacs-path-custom "init.el"))
(load-theme 'molokai)
