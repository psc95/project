--board 테이블 생성
create table board(
 board_no number(38) primary key --게시물 번호
 ,board_name varchar2(100) not null --작성자
 ,board_title varchar2(200) not null --제목
 ,board_pwd varchar2(20) not null --비번
 ,board_cont varchar2(4000) not null --내용
 ,board_hit number(38) default 0--조회수
 ,board_ref number(38) --원본글과 답변글을 묶어주는 그룹번호역할
 ,board_step number(38) --원본글이면 0,첫번째 답변글 1. 원본글과
 --답변글을 구분하는 번호값,몇번째 답변글인가를 구분하는 번호값
 ,board_level number(38) --답변글 정렬 순서
 ,board_date date --등록날짜
);

  ALTER TABLE board MODIFY (board_cont VARCHAR2(4000));

select * from board order by board_no desc;

delete from board where board_ref=0;

commit;

--board_no_seq 시퀀스 생성
create sequence board_no_seq
start with 1 --1부터 시작
increment by 1 --1씩 증가옵션
nocache
nocycle;

drop sequence board_no_seq;

alter sequence board_no_seq
nocache; --nocache로 수정

select board_no_seq.nextval from dual;

select * from tbl_board;

select * from tbl_members2 order by uid2 asc;
select * from tbl_member_roles;
delete from tbl_member_roles where fno>=201 and fno<=300;

drop table tbl_member_roles;
drop table tbl_members2;
drop sequence member_no_Seq;
commit;



select * from admin;




















