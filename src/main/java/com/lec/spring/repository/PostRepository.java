package com.lec.spring.repository;

import com.lec.spring.domain.Post;

import java.util.List;

// Repository layer(aka. Data layer)
// DataSource(DB) 등에 대한 직접적인 접근 => DB에 접근하게는 해줘야함!
// 어떤 동작이 필요한지 설계하는 Interface(메소드 선언)
public interface PostRepository {

    // 새 글 작성 (INSERT)  <- Post(작성자, 제목, 내용) 가져와서!
    int save(Post post); // save 매소드가 post 매개변수로 받아서 동작 실행

    // 특정 id 글 내용 읽기 (SELECT)        => POST 리턴!
    // 만약 해당 id 의 글 없으면 null 리턴
    Post findById(Long id);         // Long Id 받아서 Post 리턴

    // 특정 id 글 조회수 +1 증가 (UPDATE)
    int incViewCnt(Long id);

    // 전체 글 목록. 최신순 (SELECT) => List<> 로 받기
    List<Post> findAll();

    // 특정 id 글 수정 (제목, 내용)  (UPDATE)
    int update(Post post);  // Post 안에는 id, 제목, 내용이 들어있음


    // 특정 id 글 삭제하기 (DELETE)    <= Post에 담은 id 전달
    int delete(Post post);

    //페이징
    // from 부터 rows 개 만큼 SELECT
    List<Post> selectFromRow(int from, int rows);

    // 전체 글의 개수 가져오기
    int countAll();
}
