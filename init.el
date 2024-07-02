;; Arquivo config wilson


;; Ajusta Tema do emacs

(load-theme 'darcula' t)
(set-background-color "gray5")

(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;; Config gerais

(electric-pair-mode t)


;; Org Mode

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; PDF-TOOLS

     (pdf-tools-install)


     (define-key pdf-view-mode-map (kbd "M-n") 'pdf-view-next-line-or-next-page)
     (define-key pdf-view-mode-map (kbd "M-p") 'pdf-view-previous-line-or-previous-page)
     (define-key pdf-view-mode-map (kbd "C-n") 'pdf-view-next-page-command)
     (define-key pdf-view-mode-map (kbd "C-p") 'pdf-view-previous-page-command)


;; Vs Code

(defun duplicate-line-or-region ()
  "Duplica a linha atual ou a região selecionada, movendo o cursor para a posição correspondente na nova linha ou região duplicada."
  (interactive)
  (if (use-region-p)
      (let* ((beg (region-beginning))
             (end (region-end))
             (pos (point)) ; Salva a posição atual do cursor
             (offset (- pos beg))) ; Calcula o deslocamento do cursor em relação ao início da região
        (copy-region-as-kill beg end)
        (goto-char end)
        (newline) ; Insere uma nova linha antes de colar
        (yank)
        (goto-char (+ end offset 1))) ; Ajusta a posição do cursor considerando a nova linha
    (let* ((pos (point)) ; Salva a posição atual do cursor
           (beg (line-beginning-position))
           (end (line-end-position))
           (offset (- pos beg))) ; Calcula o deslocamento do cursor em relação ao início da linha
      (copy-region-as-kill beg (1+ end)) ; Inclui a quebra de linha na cópia
      (goto-char (1+ end))
      (yank)
      (forward-line -1) ; Volta para a linha duplicada
      (forward-char offset)))) ; Ajusta a posição do cursor

(global-set-key (kbd "M-<down>") 'duplicate-line-or-region)

(defun duplicate-line-or-region-upwards ()
  "Duplica a linha atual ou a região selecionada para cima, movendo o cursor para a posição correspondente na nova linha ou região duplicada."
  (interactive)
  (if (use-region-p)
      (let* ((beg (region-beginning))
             (end (region-end))
             (pos (point)) ; Salva a posição atual do cursor
             (region-contents (buffer-substring beg end))
             (offset (- pos beg))) ; Calcula o deslocamento do cursor em relação ao início da região
        (goto-char beg)
        (insert region-contents)
        (insert "\n") ; Insere uma nova linha após a região duplicada
        (goto-char (+ beg offset))) ; Ajusta a posição do cursor na região duplicada
    (let* ((pos (point)) ; Salva a posição atual do cursor
           (line-contents (buffer-substring (line-beginning-position) (line-end-position)))
           (offset (- pos (line-beginning-position)))) ; Calcula o deslocamento do cursor em relação ao início da linha
      (beginning-of-line)
      (insert line-contents)
      (insert "\n") ; Insere uma nova linha após a linha duplicada
      (forward-line -1) ; Move para a linha duplicada
      (forward-char offset)))) ; Ajusta a posição do cursor

(global-set-key (kbd "M-<up>") 'duplicate-line-or-region-upwards)

;; 

;; Melpa

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(pdf-tools darcula-theme ##)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


