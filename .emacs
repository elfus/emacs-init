(column-number-mode t)                                                                                                                                                   
(line-number-mode t)             
(toggle-truncate-lines t)                                                                                                                                        
 
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
(global-set-key (kbd "<f5>") 'compile)
(global-set-key (kbd "<f6>") 'recompile)
 
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

(setq gdb-many-windows t)
(setq c-set-style 'stroustrup)

(put 'erase-buffer 'disabled nil)

(setq c-default-style '((java-mode . "java")
			(awk-mode . "awk")
			(other . "stroustrup")))
