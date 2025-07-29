;; -*- lexical-binding: t; -*-

(setq emacs-path-custom (if (string= "windows-nt" system-type)
			    "~/.emacs.d"
			  "~/.config/emacs"))

(add-to-list 'backup-directory-alist `(("." . ,(file-name-concat emacs-path-custom "backups"))))
(setq initial-buffer-choice (file-name-concat emacs-path-custom "init.el"))
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
(repeat-mode 1)
(rainbow-delimiters-mode t)
(column-number-mode 1)

(mapc 'load (file-expand-wildcards "~/.emacs.d/package-configs/*.el"))

(load-theme 'kaolin-galaxy t)

(defvar my/frame-size-list
  '((80 40) (120 70) (280 80))
  "Frame sizes to toggle between.")
(defvar my/frame-size-list-index
  0
  "Current window size from list.")

(defun my/toggle-frame-size
    ()
  "Toggle the size of the frame (window)."
  (interactive)
  (setq my/frame-size-list-index
	(if (length= my/frame-size-list (+ my/frame-size-list-index 1))
	    0
	  (+ my/frame-size-list-index 1)))
  (let ((frame-size (nth my/frame-size-list-index my/frame-size-list)))
      (set-frame-width nil (nth 0 frame-size))
      (set-frame-height nil (nth 1 frame-size)))
  (let ((workarea (frame-monitor-workarea))
	(pos-x (car (frame-position)))
	(pos-y (cdr (frame-position))))
    (let ((workarea-width (nth 2 workarea))
	  (workarea-height (nth 3 workarea)))
      (set-frame-position nil
			  (if (> 0 (- workarea-width (frame-pixel-width) pos-x))
			      (- workarea-width (frame-outer-width))
			    pos-x)
			  (if (> 0 (- workarea-height (frame-pixel-height) pos-y))
			      (- workarea-height (frame-outer-height))
			    pos-y)))))

(defvar-keymap frame-edit-keymap
  :repeat t
  :keymap window-prefix-map
  "r" #'my/toggle-frame-size
  "2" #'split-root-window-below
  "3" #'split-root-window-right)

(if (string= "windows-nt" system-type)
  (let ((sys "windows"))
    (setenv "PATH" (with-temp-buffer
                     (insert-file-contents "~/.emacs.d/.env")
                     (goto-char (point-min))
                     (buffer-string)))
    (setq exec-path (split-string (getenv "PATH") ";"))))

