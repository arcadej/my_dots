;; 個人設定. いろいろ

;; ctl+h に backspace にかえる. 
(global-set-key "\C-h" 'delete-backward-char)

;; カーソル位置の文字列を検索
;; C-s, C-w でできる
(defun isearch-forward-with-heading ()
  "Search the word your cursor looking at."
  (interactive)
  (command-execute 'backward-word)
  (command-execute 'isearch-forward))

(global-set-key "\C-s" 'isearch-forward-with-heading)

;;ウィンドウの移動
(define-prefix-command 'windmove-map)
(global-set-key (kbd "C-q") 'windmove-map)
(define-key windmove-map "h" 'windmove-left)
(define-key windmove-map "j" 'windmove-down)
(define-key windmove-map "k" 'windmove-up)
(define-key windmove-map "l" 'windmove-right)

;; ウィンドウの分割
(defun split-window-conditional ()
  (interactive)
  (if (> (* (window-height) 2) (window-width))
      (split-window-vertically)
    (split-window-horizontally)))
(define-key windmove-map "s" 'split-window-conditional)

;; C-c c で compile を呼び出す
(define-key mode-specific-map "c" 'compile)