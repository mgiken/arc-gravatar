(load "gravatar.arc")
(load "test.arc")

; gravatar-base --------------------------------------------------------------

(test is (gravatar-base)     "http://www.gravatar.com/avatar/")
(test is (gravatar-base nil) "http://www.gravatar.com/avatar/")
(test is (gravatar-base t)   "https://secure.gravatar.com/avatar/")

; gravatar-opts --------------------------------------------------------------

(test is (gravatar-opts nil)          nil)
(test is (gravatar-opts '(s 50))      "?s=50")
(test is (gravatar-opts '(s 50 d mm)) "?s=50&d=mm")

; gravatar-id ----------------------------------------------------------------

(test is (gravatar-id "test@example.com")   "55502f40dc8b7c769880b10874abc9d0")
(test is (gravatar-id "test@example.com ")  "55502f40dc8b7c769880b10874abc9d0")
(test is (gravatar-id " test@example.com")  "55502f40dc8b7c769880b10874abc9d0")
(test is (gravatar-id " test@example.com ") "55502f40dc8b7c769880b10874abc9d0")
(test is (gravatar-id "TEST@example.com")   "55502f40dc8b7c769880b10874abc9d0")
(test is (gravatar-id "test@EXAMPLE.COM")   "55502f40dc8b7c769880b10874abc9d0")
(test is (gravatar-id "TEST@EXAMPLE.COM")   "55502f40dc8b7c769880b10874abc9d0")
(test is (gravatar-id " TEST@EXAMPLE.COM ") "55502f40dc8b7c769880b10874abc9d0")

; gravatar -------------------------------------------------------------------

(test is (gravatar "test@example.com")                "http://www.gravatar.com/avatar/55502f40dc8b7c769880b10874abc9d0")
(test is (gravatar "test@example.com" '(s 50))        "http://www.gravatar.com/avatar/55502f40dc8b7c769880b10874abc9d0?s=50")
(test is (gravatar "test@example.com" '(s 50 d mm))   "http://www.gravatar.com/avatar/55502f40dc8b7c769880b10874abc9d0?s=50&d=mm")
(test is (gravatar "test@example.com" '(s 50 d mm) t) "https://secure.gravatar.com/avatar/55502f40dc8b7c769880b10874abc9d0?s=50&d=mm")

(done-testing)

; vim:ft=arc
