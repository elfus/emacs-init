
;;(set-default-font "Bitstream Vera Sans Mono-10")
(set-frame-font "7x13")

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; python3 -m pip  pip install flake8 autopep8 rope flycheck jedi
(defvar myPackages
  '(better-defaults
    elpy ;; python development environment
    flycheck ;; syntax checking for python
    py-autopep8 ;; automatic python formatter 
    magit ;; to use git
    bash-completion
    ))

;; check for missing packages 
(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; require any packages installed
(require 'better-defaults)

;; sudo apt-get install bash-completion 
(require 'bash-completion)
(bash-completion-setup)

(autoload 'bash-completion-dynamic-complete "bash-completion" "BASH completion hook")
(add-hook 'shell-dynamic-complete-functions  'bash-completion-dynamic-complete)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; starts python stuff

;; elpy setup
(require 'elpy)
(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3"
      python-shell-interpreter-args "-i")
(elpy-enable)

;; used to have autocomplete and syntax checking
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; end of python stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq inhibit-startup-message t) ;; hide the startup message
(global-linum-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; old stuff starts here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(case-fold-search t)
 '(current-language-environment "ASCII")
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(enable-recursive-minibuffers t)
 '(global-font-lock-mode t nil (font-lock))
 '(minibuffer-max-depth 5)
 '(package-selected-packages (quote (bash-completion better-defaults)))
 '(python-shell-interpreter "python3")
 '(save-place-mode t nil (saveplace))
 '(show-paren-mode t nil (paren))
 '(transient-mark-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:inherit (default default))))))

;; The following code was added by Adrian
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

(put 'erase-buffer 'disabled nil)

(setq gdb-many-windows t)
(setq truncate-lines t)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<up>") 'shrink-window)
(global-set-key (kbd "S-C-<down>") 'enlarge-window)

(global-set-key (kbd "C-,") '(lambda() (interactive) (other-window -1)) )
(global-set-key (kbd "C-.") '(lambda() (interactive) (other-window 1)) )
(global-set-key (kbd "C-'") 'next-buffer)
(global-set-key (kbd "C-;") 'previous-buffer)

;; vlf setup
;; (add-to-list 'load-path "~/vlfi")
;; (require 'vlf-setup)


(defun toggle-dedicate-window-to-buffer ()
  (interactive)
  (if (window-dedicated-p)
      (progn
        (set-window-dedicated-p (selected-window) nil)
        (message "The selected window is NOT dedicated anymore to its buffer")
        )
    (progn
      (set-window-dedicated-p (selected-window) t)
      (message "The selected window IS dedicated to its buffer")
      )
  )
)

(global-set-key (kbd "C-c d") '(lambda () (interactive) (toggle-dedicate-window-to-buffer)))

(defun four-spaces-to-tab (&optional begin end)
  "Replace four spaces with a tab in a region."
  (interactive "r")
  (save-excursion
	  (if mark-active
		  (replace-regexp "    " "\t" nil (point) (mark))
		(replace-regexp "    " "\t" nil (point-min) (point-max))
		)
	  )
  )

(defun eight-spaces-to-tab (&optional begin end)
  "Replace eight spaces with a tab in a region."
  (interactive "r")
  (save-excursion
	  (if mark-active
		  (replace-regexp "        " "\t" nil (point) (mark))
		(replace-regexp "        " "\t" nil (point-min) (point-max))
		)
	  )
  )

;; Customizing colors used in diff mode
(defun custom-diff-colors ()
  "update the colors for diff faces"
  (set-face-attribute
   'diff-added nil :foreground "green")
  (set-face-attribute
   'diff-removed nil :foreground "red")
  (set-face-attribute
   'diff-changed nil :foreground "purple"))
(eval-after-load "diff-mode" '(custom-diff-colors))


;; Check if a shell exists, if it doesn't create it - Adrian
(setq shell-list '("2 shell" "1 shell"))
(defun createshell (name)
  (interactive)
  (if (eq (get-buffer name) nil)
      (progn
        (shell)
        (rename-buffer name)
        (buffer-disable-undo)
        )
    )
  )
(while shell-list
  (createshell (car shell-list))
  (setq shell-list (cdr shell-list))
  )
;; end of shell creation
(setq delete-key-deletes-forward 1)

(define-key esc-map [f3] 'revert-buffer)
(define-key esc-map [f11] 'shell)
(define-key esc-map [f12] 'rename-buffer)
(define-key esc-map [insert] 'call-last-kbd-macro)


(global-set-key "%" 'match-paren)

(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
    ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
    (t (self-insert-command (or arg 1)))))

;; EDIFF CUSTOMIZATION
;; I don't like a separate window for ediff control
(when (display-graphic-p)
  (ediff-toggle-multiframe)
  )
