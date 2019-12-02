(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(package-selected-packages
   (quote
    (mmm-mako python-mode mmm-jinja2 magit emmet-mode which-key))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'which-key)
;; (which-key-mode)
;; (require 'smex)
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-x") 'smex-major-mode-commands)
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(require 'god-mode)
(global-set-key (kbd "<escape>") 'god-mode-all)
(global-set-key (kbd "C-i") 'god-mode-all)
(define-key god-local-mode-map (kbd "i") 'god-local-mode)
(defun my-update-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only)
			'box
		      'bar)))
(add-hook 'god-mode-enabled-hook 'my-update-cursor)
(add-hook 'god-mode-disabled-hook 'my-update-cursor)
(defun c/god-mode-update-cursor ()
  (let ((limited-colors-p (> 257 (length (defined-colors)))))
    (cond (god-local-mode (progn
                            (set-face-background 'mode-line (if limited-colors-p "white" "#e9e2cb"))
                            (set-face-background 'mode-line-inactive (if limited-colors-p "white" "#e9e2cb"))))
          (t (progn
               (set-face-background 'mode-line (if limited-colors-p "black" "#0a2832"))
               (set-face-background 'mode-line-inactive (if limited-colors-p "black" "#0a2832")))))))
(add-hook 'god-mode-disabled-hook 'c/god-mode-update-cursor)
(add-hook 'god-mode-enabled-hook 'c/god-mode-update-cursor)
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(require 'mmm-auto)
(require 'mmm-jinja2)
(add-to-list 'auto-mode-alist '("\\.html\\.j2\\'" . html-mode))
(mmm-add-mode-ext-class nil "\\.j2\\'" 'jinja2)
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
;; (defun smex-update-after-load (unused)
;;       (when (boundp 'smex-cache)
;;         (smex-update)))
;; (add-hook 'after-load-functions 'smex-update-after-load)
