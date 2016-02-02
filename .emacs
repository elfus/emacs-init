; cedet specific code
;(load-file "~/.emacs.d/cedet-1.1/common/cedet.el")
;(global-ede-mode 1)                      ; Enable the Project management system
;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;(global-srecode-minor-mode 1)            ; Enable template insertion menu


;(add-hook 'texinfo-mode-hook (lambda () (require 'sb-texinfo)))
;(add-hook 'html-mode-hook (lambda () (require 'sb-html)))
;(autoload 'Info-speedbar-buttons "sb-info" "Info specific speedbar button generator.")
;(autoload 'rmail-speedbar-buttons "sb-rmail" "Rmail specific speedbar button generator.")
;(autoload 'gud-speedbar-buttons "sb-gud" "GUD specific speedbar button generator.")

;(global-set-key [(f5)] 'speedbar-get-focus)
; (global-set-key (kbd "C-c s g") 'speedbar-get-focus)

; end of cedet specific code

(column-number-mode t)
(line-number-mode t)

;; Right justify the line numbers
(unless window-system
  (add-hook 'linum-before-numbering-hook
	    (lambda ()
	      (setq linum-format-fmt
		    (let ((w (length (number-to-string
				      (count-lines (point-min) (point-max))))))
		      (concat "%" (number-to-string w) "d"))))))

(defun linum-format-func (line)
  (concat
   (propertize (format linum-format-fmt line) 'face 'linum)
   (propertize " " 'face 'mode-line)))

(unless window-system
  (setq linum-format 'linum-format-func))
;; end of right justify line numbers

(global-set-key (kbd "C-c g l") 'global-linum-mode)
(global-set-key (kbd "C-c b l") 'linum-mode)
(global-set-key (kbd "<f7>") 'toggle-truncate-lines)

(setq dired-listing-switches "-alh")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:inherit (default default))))))
(put 'erase-buffer 'disabled nil)

(setq gdb-many-windows t)
(setq truncate-lines t)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<up>") 'shrink-window)
(global-set-key (kbd "S-C-<down>") 'enlarge-window)

;; vlf setup
(add-to-list 'load-path "~/vlfi")
(require 'vlf-setup)

