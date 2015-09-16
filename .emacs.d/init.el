(set-language-environment "Japanese")

(prefer-coding-system 'utf-8)
(setq default-file-name-coding-system 'shift_jis) ;dired�p

;;(prefer-coding-system 'cp932)

;; enable-BackSpace
(load "term/bobcat")
(global-set-key "\C-h" 'delete-backward-char) 


(setq visible-bell 1)
;;; �c�[���o�[��\�����Ȃ�
(tool-bar-mode 0)

;;;�����C���f���g
(electric-indent-mode 1)

;; �����t���[���̐ݒ�
(setq default-frame-alist
      (append (list '(foreground-color . "white")
		    '(background-color . "#000033")
		    '(border-color . "white")
		    '(mouse-color . "pink")
		    '(cursor-color . "#ffffcc")
		    '(width . 170)
		    '(height . 62)
		    '(top . 10)
		    '(alpha . 80)
		    '(left . 10)
                    '(font . "-outline-Courier New-normal-normal-normal-mono-12-*-*-*-c-*-iso8859-1"))
	      default-frame-alist))


(setq inhibit-startup-screen t)





;; ;;; setting shell  

;; ;;; Cygwin �� bash ���g���ꍇ
(setq explicit-shell-file-name "bash.exe")
(setq shell-file-name "sh.exe")
(setq shell-command-switch "-c") 

;; shell �̃R�}���h�̌�� ^M ���t������Ă��܂����̉��� 
(modify-coding-system-alist 'process ".*sh\\.exe" '(undecided-dos . undecided-unix))


;;RUBY �̐ݒ�
;;

(setq auto-mode-alist
      (cons (cons "\\.rb$" 'ruby-mode) auto-mode-alist))
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby sources" t)

;; CGI �� ruby-mode �ŕҏW����
(setq auto-mode-alist
      (cons (cons "\\.cgi$" 'ruby-mode) auto-mode-alist))
(autoload 'ruby-mode "ruby-mode" "Mode for editing CGI sources" t)


;;; YaTeX 

(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

(setq load-path (cons (expand-file-name "/usr/local/Meadow/site-lisp/yatex") load-path))



;; �摜�t�@�C����\��
;; find-file �ŉ摜������܂�
(auto-image-file-mode)

;; isearch �ł����Ƀn�C���C�g����
(setq isearch-lazy-highlight-initial-delay 0)

;;�s�Ԃ𒲐�
(setq-default line-spacing 1)

;;�ȉ��͒ǉ����ꂽ���ڂȂǂ̃���
;;�s���̃X�y�[�X�������\���D�������C�o�b�t�@���[�J��
(setq-default show-trailing-whitespace t)

;; cua-mode�̐ݒ�
(cua-mode t)  ; cua-mode���I��
(setq cua-enable-cua-keys nil)  ; CUA�L�[�o�C���h�𖳌���



;;LINE-NUM
(require 'linum)
(global-linum-mode t)
(setq linum-format "%4d ")
;;COLUMN-NUM
(column-number-mode t)

;;�L�[�R�}���h�Z�b�g
(global-set-key "\M-g" 'goto-line)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "M-$") 'untabify)
(global-set-key (kbd "C-x C-f") 'helm-for-files)
(global-set-key (kbd "M-m") 'uniq-region)
(global-set-key (kbd "M-n") 'sort-lines)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-d") 'dired-x-find-file)

;;�^�u�̓��͂��֎~�I�I
(setq-default tab-width 4 indent-tabs-mode nil)

;;; *.~ �Ƃ��̃o�b�N�A�b�v�t�@�C�������Ȃ�
(setq make-backup-files nil)
;;; .#* �Ƃ��̃o�b�N�A�b�v�t�@�C�������Ȃ�
(setq auto-save-default nil)

;;;�E�B���h�E�����ݒ�
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))

(global-set-key (kbd "C-t") 'other-window-or-split)

;;; �t�@�C���̃t���p�X���^�C�g���o�[�ɕ\��
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))


;;;************************
;;;         ELISP
;;;************************

;;;���[�h�p�X
(setq load-path
      (append (list nil "~/.emacs.d/elisp"
                    "~/.emacs.d/elisp/auto-install"
                    "~/.emacs.d/elisp/pgm"
                    "~/.emacs.d/elisp/tool"
                    "~/.emacs.d/elisp/sql"
                    "~/.emacs.d/elisp/magit"
                    "~/.emacs.d/elisp/helm")
              load-path))

;;;; COBOL-MODE
(setq auto-mode-alist (append auto-mode-alist
'(("\\.cob$" . cobol-mode))))
(autoload 'cobol-mode "cobol-mode"
"Major mode for editing COBOL source files." t nil)

;;;; WEB-MODE
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.asp?\\'" . web-mode))
(setq web-mode-engines-alist
'(("php"    . "\\.phtml\\'")
  ("blade"  . "\\.blade\\.")))
  
;;;; scc-mode
(require 'scss-mode)
(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

;; ------------------------------------------------------------------------
;; @ auto-install.el

;;; �p�b�P�[�W�̃C���X�g�[����������
;;; http://www.emacswiki.org/emacs/auto-install.el
(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup))
(custom-set-faces
 ;;; custom-set-faces was added by Custom.
 ;;; If you edit it by hand, you could mess it up, so be careful.
 ;;; Your init file should contain only one such instance.
 ;;; If there is more than one, they won't work right.
 )

;;; helm
(when (require 'helm-config nil t)
  (helm-mode 1)
  (define-key helm-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
)

;;;
;;; end of file
;;;
(put 'dired-find-alternate-file 'disabled nil)

;;; magit
(require 'magit)
