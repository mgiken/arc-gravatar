(load "test.arc")
(load "gravatar.arc")

; gravatar-base --------------------------------------------------------------

(test (gravatar-base)     "http://www.gravatar.com/avatar/")
(test (gravatar-base nil) "http://www.gravatar.com/avatar/")
(test (gravatar-base t)   "https://secure.gravatar.com/avatar/")

; gravatar-opts --------------------------------------------------------------

(test (gravatar-opts nil)          nil)
(test (gravatar-opts '(s 50))      "?s=50")
(test (gravatar-opts '(s 50 d mm)) "?s=50&d=mm")

; gravatar-id ----------------------------------------------------------------

(test (gravatar-id "test@example.com")   "55502f40dc8b7c769880b10874abc9d0")
(test (gravatar-id "test@example.com ")  "55502f40dc8b7c769880b10874abc9d0")
(test (gravatar-id " test@example.com")  "55502f40dc8b7c769880b10874abc9d0")
(test (gravatar-id " test@example.com ") "55502f40dc8b7c769880b10874abc9d0")
(test (gravatar-id "TEST@example.com")   "55502f40dc8b7c769880b10874abc9d0")
(test (gravatar-id "test@EXAMPLE.COM")   "55502f40dc8b7c769880b10874abc9d0")
(test (gravatar-id "TEST@EXAMPLE.COM")   "55502f40dc8b7c769880b10874abc9d0")
(test (gravatar-id " TEST@EXAMPLE.COM ") "55502f40dc8b7c769880b10874abc9d0")

; gravatar -------------------------------------------------------------------

(test (gravatar "test@example.com")                "http://www.gravatar.com/avatar/55502f40dc8b7c769880b10874abc9d0")
(test (gravatar "test@example.com" '(s 50))        "http://www.gravatar.com/avatar/55502f40dc8b7c769880b10874abc9d0?s=50")
(test (gravatar "test@example.com" '(s 50 d mm))   "http://www.gravatar.com/avatar/55502f40dc8b7c769880b10874abc9d0?s=50&d=mm")
(test (gravatar "test@example.com" '(s 50 d mm) t) "https://secure.gravatar.com/avatar/55502f40dc8b7c769880b10874abc9d0?s=50&d=mm")

(run-test)

; vim:ft=arc
