(setq inferior-lisp-program "sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes '(wheatgrass))
 '(display-battery-mode t)
 '(display-line-numbers-type nil)
 '(display-time-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(magit fvwm-mode ledger-mode company-tabnine company smartparens racket-mode rainbow-delimiters ##))
 '(tool-bar-mode nil)
 '(tool-bar-position 'right))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Luxi Mono" :foundry "B&H " :slant normal :weight normal :height 81 :width normal)))))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'racket-mode-hook #'rainbow-delimiters-mode)
(require 'smartparens-config)
(add-hook 'rainbow-delimiters-mode-hook #'smartparens-mode)

;;(set-frame-font "-misc-fixed-medium-r-normal--14-*-*-75-*-70-*-*" nil t)

(server-start)
