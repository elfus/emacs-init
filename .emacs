;(global-set-key [home] 'beginning-of-line)
;(global-set-key [end] 'end-of-line)
;(define-key global-map "\C-x?" 'help-command)
;(define-key global-map "\C-h" 'delete-backward-char)

;;(set-default-font "Bitstream Vera Sans Mono-10")
(set-frame-font "7x13")

;(global-set-key [?\C-=] 'undo)
;;(define-key ctl-x-map "k" 'kill-this-buffer)

(menu-bar-mode 0)
(tool-bar-mode 0)

(setq inhibit-startup-message t
      font-lock-maximum-decoration t
      indent-tabs-mode nil)


;; ISWITCH BUFFER + ARROW KEY NAVIGATION :)
(iswitchb-mode t)

(when (display-graphic-p)
    (require 'edmacro)
    )


(defun iswitchb-local-keys ()
      (mapc (lambda (K)
	      (let* ((key (car K)) (fun (cdr K)))
    	        (define-key iswitchb-mode-map (edmacro-parse-keys key) fun)))
	    '(("<right>" . iswitchb-next-match)
	      ("<left>"  . iswitchb-prev-match)
	      ("<up>"    . ignore             )
	      ("<down>"  . ignore             ))))

(add-hook 'iswitchb-define-mode-map-hook 'iswitchb-local-keys)

; The above junk somehow creates the following key which messes up GDB
(global-unset-key "\C-x\C-a")
(global-unset-key "\C-x\C-n")

(setq shell-command-history-max 1000)

(add-hook 'shell-mode-hook '(lambda ()
  (setq turn-on-hscroll t)
  (load "/home/adortega/tools/shell-mode-abbrevs.el")
  (setq local-abbrev-table shell-mode-abbrev-table)
  (setq abbrev-mode t)
 ; (setq comint-input-ring-size 1024)
  (setq comint-buffer-maximum-size 2000) ;;maybe this is core dumping
  (setq comint-scroll-show-maximum-output nil)
))

;; Check if a shell exists, if it doesn't create it - Adrian
(setq shell-list '("4 (dst)" "3 (dst)" "2 (src)" "1 (src)"))
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

(global-set-key [f1] 'save-buffer)
(global-set-key [f2] 'switch-to-buffer)
(global-set-key [f3] 'nde-find-all)
(global-set-key [f4] 'save-buffers-kill-emacs)
(global-set-key [f5] 'kill-buffer)
(global-set-key [f6] 'yank)
(global-set-key [f8] 'copy-region-as-kill)
(global-set-key [f7] 'kill-line)
(global-set-key [f9] 'kill-region)
(global-set-key [f10] 'compile)
(global-set-key [f11] 'nde-checkout)
(global-set-key [f12] 'undo)
(setq delete-key-deletes-forward 1)

;;;;;;(global-set-key [f10] 'shell-command (buffer-file-name))
(define-key esc-map "g" 'goto-line)
(define-key esc-map "o" 'new-oerinm)
;;(define-key esc-map "f" 'make-frame-command)
(define-key esc-map "n" 'call-last-kbd-macro)
(define-key esc-map "r" 'repeat-complex-command)
(define-key esc-map "d" 'dabbrev-expand)
(define-key esc-map "a" 'nde-noadvice)
(define-key esc-map "e" 'nde-advice)
(define-key esc-map "t" 'new-ksdwrf)
(define-key esc-map "k" 'new-assert)
(define-key esc-map "l" 'new-mytrace)
(define-key esc-map "s" 'new-ksedsts)

(define-key esc-map [up] 'jump-to-function-begin)
(define-key esc-map [down] 'jump-to-function-end)

;(define-key esc-map [home] 'indent-region)
;(define-key esc-map [next] 'kill-buffer)
;(define-key esc-map [prior] 'upcase-word)
;(define-key esc-map [end] 'auto-fill-mode)
;(define-key esc-map [f6] 'nde-cscope-whodefs)
;(define-key esc-map [f2] 'nde-cscope-whorefs)
(define-key esc-map [f3] 'revert-buffer)
;(define-key esc-map [f4] 'c-env-right-justify-c-comment)
;(define-key esc-map [f5] 'query-replace)
;(define-key esc-map [f1] 'nde-find-defs)
;(define-key esc-map [f7] 'gdb-oracle)
;(define-key esc-map [f8] 'find-file)
;(define-key esc-map [f9] 'next-error)
;(define-key esc-map [f10] 'dirs)
(define-key esc-map [f11] 'shell)
(define-key esc-map [f12] 'rename-buffer)
(define-key esc-map [insert] 'call-last-kbd-macro)
;;(global-set-key [?\C-c?\C-q] 'query-replace)
;(global-set-key [?\C-c?\C-f] 'make-frame-command)
;;(global-set-key [?\C-c?\C-s] 'dirs)
;;(global-set-key [?\C-c?\C-n] 'dirs)
;; more ease-of-navigation shortcuts
;;(global-unset-key [C-prior])
;;(global-unset-key [C-next])
;;(global-unset-key [C-home])
;;(global-unset-key [C-end])
;;(global-set-key [C-home] 'delete-other-windows)
;;(global-set-key [C-end] 'split-window-vertically)
;;(global-set-key [C-prior] 'beginning-of-buffer)
;;(global-set-key [C-next] 'end-of-buffer)
;;(global-set-key [C-right]  'forward-word)
;;(global-set-key [C-left]   'backward-word)
;;(global-set-key [home] 'beginning-of-line)
;;(global-set-key [end] 'end-of-line)
;;(global-set-key [delete] 'delete-char)
;;(global-unset-key [C-delete])
;;(global-set-key [C-delete] 'kill-word)
;;(global-set-key [C-backspace] 'backward-kill-word)

(global-set-key "%" 'match-paren)

(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
    ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
    (t (self-insert-command (or arg 1)))))

;;
;; Right justify a C style comment
;;
;;(defun c-env-go-begin-comment ()
;;  "*Go the the beginning of a comment which begins on the current line,
;;    Or the beginning of the current line"
;;  (interactive)
;;  (let ((cur-pt (point))
;;        (beg-line))
;;    (beginning-of-line)
;;    (setq beg-line (point))
;;    (end-of-line)
;;    (if (not (search-backward "/*" beg-line t))
;;        (goto-char cur-pt))))
;;(setq c-brace-offset -2)
;;(defun c-env-right-justify-c-comment ()
;;  "*Right justify a C comment.  If there is no comment starter on the line,
;;    it will justify the entire line"
;;  (interactive)
;;  (save-excursion
;;    (save-restriction
;;      (save-match-data
;; (c-env-go-begin-comment)
;; (if (looking-at "/\\*")
;;     (progn
;;       (end-of-line)
;;       (delete-horizontal-space)
;;       (forward-char -2)
;;       (if (looking-at "\*/")
;;    (progn
;;      (delete-horizontal-space)
;;      (insert ? )))
;;       (c-env-go-begin-comment)
;;       (delete-horizontal-space)
;;       (if (looking-at "/\\*")
;;    (progn
;;      (forward-char 2)
;;      (delete-horizontal-space)
;;      (insert ? )))
;;       (end-of-line)
;;       (if (< (current-column) 79)
;;    (let ((addn (- 79 (current-column))))
;;      (c-env-go-begin-comment)
;;      (indent-to (+ (current-column) addn) 1)))
;;       (end-of-line)))))))
;;
;;
;;
;;;; automatically indenting yanked text if in programming-modes
;;(defadvice yank (after indent-region activate)
;;  (if (member major-mode '(emacs-lisp-mode
;;                          c-mode c++-mode
;;;                          tcl-mode sql-mode
;;                          perl-mode cperl-mode
;;                          java-mode jde-mode
;;                          LaTeX-mode TeX-mode))
;;      (let ((transient-mark-mode nil))
;;       (indent-region (region-beginning) (region-end) nil))))


;;;;;;;;;;;;;;;;;;;;;;
;; Shell customizations
;;;;;;;;;;;;;;;;;;;;;;;
;; The following command is required for shells to work correctly
(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m)

;; The following command prevents the password from being echoed
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Email customization
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq mail-self-blind t)
(setq user-full-name "Adrian Ortega")
(setq user-mail-address "adrian.oracle@oracle.com")
;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Enable time-stamp feature to automatically time-stamp files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'time-stamp "time-stamp"
 "Update the time stamp in a buffer." t)
(if (not (memq 'time-stamp write-file-hooks))
 (setq write-file-hooks
  (cons 'time-stamp write-file-hooks)
 )
)

(setq time-stamp-format "%3a %3b %02d %02H:%02M:%02S %Z %:y")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;
;; GDB customizations
;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;
;; C customizations
;;;;;;;;;;;;;;;;;;;;;

  ;; Change tabs to spaces
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq c-tab-always-indent t)
(setq c-auto-newline t)
(setq c++-electric-colon t)
(setq line-number-mode t)
(setq column-number-mode t)
(setq-default auto-fill-hook 'do-auto-fill)
;;(setq blink-matching-paren t)
(setq c-set-style "stroustrup")

(add-hook 'c-mode-hook 'turn-on-auto-fill)
(add-hook 'c-mode-hook '(lambda ()
                          (c-set-style "stroustrup")
                          (setq comment-column 45)))
;      (setq-default c-hungry-delete-key t) ; delete through all white spaces

  ;; compiling commands
;;(define-key c-mode-map "\C-m" 'newline-and-indent)

;;change this sequence to fail if recomp fails...don't link oracle
;;(add-hook 'c-mode-hook
;;          (function
;;           (lambda ()
;;             (lazy-lock-mode)
;;             (make-local-variable 'compile-command)
;;             (setq compile-command
;;                   (concat "/home/adortega/tools/my_compile "
;;                           (buffer-file-name) )))))

;;(add-hook 'sql-mode-hook
;;          (function
;;           (lambda ()
;;             (lazy-lock-mode)
;;             (make-local-variable 'compile-command)
;;             (setq compile-command
;;                   (concat "/home/adortega/tools/my_compile "
;;                           (buffer-file-name) )))))

;(add-hook 'c-mode-hook
;   '(lambda ()
;      ;; (load "applbox" nil t)
;      (local-unset-key "^[^H")
;      (setq turn-on-hscroll t)
;      (setq c-indent-level 2)
;      ;; extra indentation for braces,
;      ;; compared to regular text in same context
;      (setq c-brace-offset -2)
;      ;; extra indentation for lines not starting new statements
;      (setq c-continued-statement-offset 2)
;      ;; extr indentation for substatements that start
;      ;; with open-braces.
;      (setq c-continued-brace-offset -2)
;      ;; hell if I know: and the doc doesn't help either
;      (setq c-brace-imaginary-offset -2)
;      ;; additional indentation of label lines and case
;      ;; statements
;      (setq c-label-offset -2)
;      ;; if this is t then indent can use tabs.
;      ;; Oracle coding standard says not to use tabs.
;      ;; (setq indent-tabs-mode nil)  waiting...
;      ;;(setq indent-tabs-mode nil) now global
;      ;;(setq comment-column 44)
;      ;;(setq fill-column 76)
;      ;;(auto-fill-mode 1)
;      ;; keeps matching all parens - irritating
;      ;;(setq show-paren-mode t)
;
;      ;; When pressing enter, do auto-indent
;      (local-set-key "\C-m" 'newline-and-indent)
;      (local-set-key "\C-c\C-x" 'c-env-right-justify-c-comment)
;      (local-set-key "\C-c\C-r" 'nde-cscope-whorefs)
;      (local-set-key "\C-c\C-w" 'nde-cscope-whodefs)
;      (set-fill-column 79)
;      ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Begin setup for font locks in Emacs

;(custom-set-faces
; '(font-lock-comment-face ((((class color) (background dark)) (:foreground "light blue"))))
; '(font-lock-string-face ((((class color) (background light)) (:foreground "blue"))))
; '(font-lock-keyword-face ((t (:underline t))))
; '(font-lock-type-face ((t (:bold t))))
; '(font-lock-variable-name-face ((((class color) (background light)) (:foreground "limegreen")))))

(show-paren-mode)

;;(highlight-changes-mode)
;; no scrollbar
(scroll-bar-mode -1)


;; parens matching

;; End setup for font locks in Emacs
(setq transient-mark-mode t)
(cond ((fboundp 'global-font-lock-mode)
       ;; Turn on font-lock in all modes that support it
       (global-font-lock-mode t)
       ;; Maximum colors
       (setq font-lock-maximum-decoration t)))


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
 '(save-place t nil (saveplace))
 '(show-paren-mode t nil (paren))
 '(transient-mark-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:inherit (default default))))))


                                        ; auto completion
;;;;;;;;;;;;;;;;;
(require 'dabbrev)
(setq dabbrev-always-check-other-buffers t)
(setq dabbrev-abbrev-char-regexp "\\sw\\|\\s_")

;(global-set-key "\C-i" 'my-tab)

;;(defun my-tab (&optional pre-arg)
;;  "If preceeding character is part of a word and current-char is a space
;;then dabbrev-expand, else if last command was a tab or return then dedent
;;one step, else indent 'correctly'"
;;  (interactive "*P")
;;  (cond ((and (= (char-syntax (preceding-char)) ?w)
;;              (not (= (char-syntax (following-char)) ?w)))
;;             ;(= 1 0))
;;             (let ((case-fold-search t)) (dabbrev-expand pre-arg)))
;;         (t (indent-according-to-mode)))
;;        (setq this-command 'my-tab))

;(add-hook 'html-mode-hook
;          '(lambda ()
;             (local-set-key "\C-i"     'my-tab)))
;(add-hook 'sgml-mode-hook
;          '(lambda ()
;             (local-set-key "\C-i"     'my-tab)))
;(add-hook 'perl-mode-hook
;          '(lambda ()
;             (local-set-key "\C-i"     'my-tab)))
;(add-hook 'text-mode-hook
;          '(lambda ()
;             (local-set-key "\C-i"     'my-tab)))
;(add-hook 'c-mode-hook
;          '(lambda ()
;;            (local-set-key "\C-i"     'my-tab)))


;; Function to insert NF_start and NF_END at beginning and end of blocks
;; (fset 'nfblock
;;      [?\C-r ?{ down return tab up tab kp-divide kp-multiply ?N ?F ?_ ?S ?T ?A ?R ?T kp-multiply kp-divide ?\C-s ?} up ?\C-e return tab kp-divide kp-multiply ?N ?F ?_ ?E ?N ?D kp-multiply kp-divide])
;;(global-set-key "\C-cn" 'nfblock)

;;(fset 'nfblocke
;;   [?\C-r ?k ?s ?e ?e ?x down ?\C-a return up tab kp-divide kp-multiply ?N ?F ?_ ?S ?T ?A ?R ?T kp-multiply kp-divide ?\C-s ?k ?s ?e ?e ?n ?d ?\C-a return up tab kp-divide kp-multiply ?N ?F ?_ ?E ?N ?D kp-multiply kp-divide])
;;(global-set-key "\C-ce" 'nfblocke)

;;(fset 'conflictAll
;;   [?\C-s ?< ?< ?< ?< ?\C-a f7 f7 ?\C-s ?= ?= ?= ?= ?= ?= ?\C-a f7 f7 ?\C-s ?> ?> ?> ?> ?> ?> ?\C-a f7 f7])
;;(global-set-key "\C-c0" 'conflictAll)

;;(fset 'conflictFirst
;;   [?\C-s ?< ?< ?< ?< ?< ?\C-a f7 f7 ?\C-s ?= ?= ?= ?= ?\C-a f7 f7 ?\C-  ?\C-s ?> ?> ?> ?> ?\C-e ?\C-w f7])
;;(global-set-key "\C-c1" 'conflictFirst)

;;(fset 'conflictSecond
;;   [?\C-s ?< ?< ?< ?< ?\C-a ?\C-  ?\C-s ?= ?= ?= ?\C-e down ?\C-a ?\C-w ?\C-s ?> ?> ?> ?> ?> ?\C-a f7 f7])
;;(global-set-key "\C-c2" 'conflictSecond)

;;(fset 'cutMaskToEnd
;;   [?\C-s ?p ?r ?o ?m ?p ?t ?  ?m ?a ?s ?k ?_ ?b ?e ?g ?i ?n ?\C-a down ?\C-  ?\C-s ?m ?a ?s ?k ?_ ?e ?n ?d down f9 up down f7])
;;(global-set-key "\C-cm" 'cutMaskToEnd)

;;(fset 'MaskOldNew
;;   [?\C-s ?o ?l ?d ?  ?  ?\C-a ?\C-k ?\C-k ?\C-k ?. ?* return ?. ?*])
;;(global-set-key "\C-co" 'MaskOldNew)

;;(fset 'secs
;;   [?\C-s ?( ?s ?e ?c left left left left f7 ?. ?*])
;;   (global-set-key "\C-cs" 'secs)
;(define-key ctl-x-map "n" 'nfblock)
;(define-key [?\C-c n] 'nfblock)

;;(fset 'javanf
;;   [?\C-r ?{ right return tab ?/ ?/ ?B ?E ?G ?I ?N ?\S-  ?I ?N ?F ?E ?A ?S ?I ?B ?L ?E ?\C-s ?} up ?\C-e return tab ?/ ?/ ?E ?N ?D ?\S-  ?I ?N ?F ?E ?A ?S ?I ?B ?L ?E])
;;(global-set-key "\C-cj" 'javanf)
;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ediff customization
;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(fset 'qdif
;;      "\C-[xediff-buffers\C-m\C-m\C-m")
;;(define-key ctl-x-map "," 'qdif)

;; EDIFF CUSTOMIZATION
;; I don't like a separate window for ediff control
(when (display-graphic-p)
  (ediff-toggle-multiframe)
  )

; turn off beeps
(setq visible-bell t)
;(set-message-beep 'silent)

;; CDET

;(load-file "~/.emacs.d/cedet-1.0.1/common/cedet.el")

;; ECB
;(add-to-list 'load-path "~/.emacs.d/ecb-2.40/")
;(require 'ecb)
;(ecb-layout-name "left5")

;;s(load-file /net/xotha/scratch/xotha/lib/elisp/setup_xotha.el)


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

(setq python-shell "python3")

;; vlf setup
(add-to-list 'load-path "~/vlfi")
(require 'vlf-setup)

(add-to-list 'load-path "~/.emacs.d/ascope")
(require 'ascope)

(global-set-key (kbd "C-x c i") 'ascope-init)
(global-set-key (kbd "C-x c g") 'ascope-find-global-definition)
(global-set-key (kbd "C-x c s") 'ascope-find-this-symbol)
(global-set-key (kbd "C-x c t") 'ascope-find-this-text-string)
(global-set-key (kbd "C-x c f") 'ascope-find-functions-calling-this-function)
(global-set-key (kbd "C-x c c") 'ascope-find-called-functions)
(global-set-key (kbd "C-x c n") 'ascope-find-files-including-file)
(global-set-key (kbd "C-x c a") 'ascope-all-symbol-assignments)
(global-set-key (kbd "C-x c o") 'ascope-clear-overlay-arrow)
(global-set-key (kbd "C-x c p") 'ascope-pop-mark)

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


