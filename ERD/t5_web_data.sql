-- 기존테이블 삭제
DELETE FROM t5_attachment;
ALTER TABLE t5_attachment AUTO_INCREMENT = 1;
DELETE FROM t5_comment;
ALTER TABLE t5_comment AUTO_INCREMENT = 1;
DELETE FROM t5_post;
ALTER TABLE t5_post AUTO_INCREMENT = 1;
DELETE FROM t5_user_authorities;
ALTER TABLE t5_user_authorities AUTO_INCREMENT = 1;
DELETE FROM t5_authority;
ALTER TABLE t5_authority AUTO_INCREMENT = 1;
DELETE FROM t5_user ;
ALTER TABLE t5_user AUTO_INCREMENT = 1;

-- 샘플 authority
INSERT INTO t5_authority (name) VALUES
    ('ROLE_MEMBER'), ('ROLE_ADMIN')
;

-- 샘플 user
INSERT INTO t5_user (username, password, name, email) VALUES
    ('USER1', '$2a$10$UNlU4YWyWTOnBS/06dXtjep6efgFqcyLlWX53S6.NAthPuEdH2MmC', '회원1', 'user1@mail.com'),
    ('USER2', '$2a$10$vuusEBWIFk88tEf3k5h/oOxACUFMFesV4r1WneR2JXRsJM6X5y04i', '회원2', 'user2@mail.com'),
    ('ADMIN1', '$2a$10$wZxkirBHkjbxsaC3UaA4duZwYlC8uxSmsrkMPEGRoJ3yTbIFxiIZm', '관리자1', 'admin1@mail.com')
;

-- 샘플 사용자-권한
INSERT INTO t5_user_authorities VALUES
    (1, 1),
    (3, 1),
    (3, 2)
;

-- 샘플 글
INSERT INTO t5_post (user_id, subject, content) VALUES
    (1, '제목입니다1', '내용입니다1'),
    (1, '제목입니다2', '내용입니다2'),
    (3, '제목입니다3', '내용입니다3'),
    (3, '제목입니다4', '내용입니다4')
;

-- 샘플 댓글
INSERT INTO t5_comment(user_id, post_id, content) VALUES
    (1, 1, '1. user1이 1번글에 댓글 작성.'),
    (1, 1, '2. user1이 1번글에 댓글 작성.'),
    (1, 2, '3. user1이 2번글에 댓글 작성.'),
    (1, 2, '4. user1이 2번글에 댓글 작성.'),
    (1, 3, '5. user1이 3번글에 댓글 작성.'),
    (1, 3, '6. user1이 3번글에 댓글 작성.'),
    (1, 4, '7. user1이 4번글에 댓글 작성.'),
    (1, 4, '8. user1이 4번글에 댓글 작성.'),
    (3, 1, '9. admin1이 1번글에 댓글 작성.'),
    (3, 1, '10. admin1이 1번글에 댓글 작성.'),
    (3, 2, '11. admin1이 2번글에 댓글 작성.'),
    (3, 2, '12. admin1이 2번글에 댓글 작성.'),
    (3, 3, '13. admin1이 3번글에 댓글 작성.'),
    (3, 3, '14. admin1이 3번글에 댓글 작성.'),
    (3, 4, '15. admin1이 4번글에 댓글 작성.'),
    (3, 4, '16. admin1이 4번글에 댓글 작성.')
;

-- 샘플 첨부파일
INSERT INTO t5_attachment(post_id, sourcename, filename) VALUES
    (1, 'face01.png', 'face01.png'),
    (1, 'face02.png', 'face02.png'),
    (2, 'face03.png', 'face03.png'),
    (2, 'face04.png', 'face04.png'),
    (3, 'face05.png', 'face05.png'),
    (3, 'face06.png', 'face06.png'),
    (4, 'face07.png', 'face07.png'),
    (4, 'face08.png', 'face08.png')
;


