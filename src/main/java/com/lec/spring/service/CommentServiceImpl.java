package com.lec.spring.service;

import com.lec.spring.domain.Comment;
import com.lec.spring.domain.QryCommentList;
import com.lec.spring.domain.QryResult;
import com.lec.spring.domain.User;
import com.lec.spring.repository.CommentRepository;
import com.lec.spring.repository.UserRepository;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    private CommentRepository commentRepository;
    private UserRepository userRepository;

    @Autowired
    public CommentServiceImpl(SqlSession sqlSession){
        commentRepository = sqlSession.getMapper(CommentRepository.class);
        userRepository = sqlSession.getMapper(UserRepository.class);
    }

    @Override
    public QryCommentList list(Long postId) {
        QryCommentList list = new QryCommentList();

        List<Comment> comments = commentRepository.findByPost(postId);   //특정 id 로 가녀온 post 정보를 comments에 넣음

        list.setCount(comments.size()); // 댓글들의 목록 받음
        list.setList(comments);
        list.setStatus("OK");   // 정상적으로 받아오면 OK

        return list;
    }

    @Override
    public QryResult write(Long postId, Long userId, String content) {
        // User 정보 끌고 오기
        User user = userRepository.findById(userId);
        // user 정보나 매개 변수가 null 인지도 확인 해야함 그치만 여기선 안 햇어요

        // insert 객체
        Comment comment = Comment.builder()
                .user(user)
                .content(content)
                .post_id(postId)
                .build();

        int cnt = commentRepository.save(comment);

        QryResult result = QryResult.builder()
                .count(cnt)
                .status("OK")
                .build();

        return result;
    }

    @Override
    public QryResult delete(Long id) {  // 특정 댓글 삭제
        int cnt = commentRepository.deleteById(id);
        // 정상적으로 삭제 했으면 1 리턴
        String status = "FAIL";
        if(cnt > 0) status = "OK";

        QryResult result = QryResult.builder()
                .count(cnt)
                .status(status)
                .build();

        return result;
    }
}
