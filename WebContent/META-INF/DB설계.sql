/* 유기동물 */
CREATE TABLE MY_SCHEMA.D15_organic (
 org_no NUMBER NOT NULL, /* 유기견 번호 */
 st_no NUMBER, /* 보호소 번호 */
 org_animal VARCHAR2(50) NOT NULL, /* 동물번호 */
 org_img VARCHAR2(20), /* 이미지 */
 k_code NUMBER, /* 견종코드 */
 org_gender VARCHAR2(20), /* 성별 */
 org_situation  VARCHAR2(20) NOT NULL, /* 상태 */
 org_count NUMBER NOT NULL, /* 조회수 */
 org_date NUMBER NOT NULL, /* 남은날짜 */
 org_desc VARCHAR2(1000) /* 설명 */
);

COMMENT ON TABLE MY_SCHEMA.D15_organic IS '유기동물';

COMMENT ON COLUMN MY_SCHEMA.D15_organic.org_no IS '유기견 번호';

COMMENT ON COLUMN MY_SCHEMA.D15_organic.st_no IS '보호소 번호';

COMMENT ON COLUMN MY_SCHEMA.D15_organic.org_animal IS '동물번호';

COMMENT ON COLUMN MY_SCHEMA.D15_organic.org_img IS '이미지';

COMMENT ON COLUMN MY_SCHEMA.D15_organic.k_code IS '견종코드';

COMMENT ON COLUMN MY_SCHEMA.D15_organic.org_gender IS '성별';

COMMENT ON COLUMN MY_SCHEMA.D15_organic.org_situation  IS '상태';

COMMENT ON COLUMN MY_SCHEMA.D15_organic.org_count IS '조회수';

COMMENT ON COLUMN MY_SCHEMA.D15_organic.org_date IS '남은날짜';

COMMENT ON COLUMN MY_SCHEMA.D15_organic.org_desc IS '설명';

CREATE UNIQUE INDEX MY_SCHEMA.PK_D15_organic
 ON MY_SCHEMA.D15_organic (
  org_no ASC
 );

CREATE UNIQUE INDEX MY_SCHEMA.UIX_D15_organic
 ON MY_SCHEMA.D15_organic (
  org_animal ASC
 );

ALTER TABLE MY_SCHEMA.D15_organic
 ADD
  CONSTRAINT PK_D15_organic
  PRIMARY KEY (
   org_no
  );

ALTER TABLE MY_SCHEMA.D15_organic
 ADD
  CONSTRAINT UK_D15_organic
  UNIQUE (
   org_animal
  );

/* 임시보호 */
CREATE TABLE MY_SCHEMA.D15_Protect (
 pr_no NUMBER NOT NULL, /* 임시보호번호 */
 m_no NUMBER, /* 회원번호 */
 org_no NUMBER, /* 유기견 번호 */
 pr_history NUMBER, /* 맡았던동물수 */
 pr_reqdate DATE NOT NULL, /* 승인신청일 */
 pr_argdate DATE, /* 승인일 */
 pr_begdate DATE, /* 보호시작일 */
 pr_enddate DATE /* 보호종료일 */
);

COMMENT ON TABLE MY_SCHEMA.D15_Protect IS '임시보호';

COMMENT ON COLUMN MY_SCHEMA.D15_Protect.pr_no IS '임시보호번호';

COMMENT ON COLUMN MY_SCHEMA.D15_Protect.m_no IS '회원번호';

COMMENT ON COLUMN MY_SCHEMA.D15_Protect.org_no IS '유기견 번호';

COMMENT ON COLUMN MY_SCHEMA.D15_Protect.pr_history IS '맡았던동물수';

COMMENT ON COLUMN MY_SCHEMA.D15_Protect.pr_reqdate IS '승인신청일';

COMMENT ON COLUMN MY_SCHEMA.D15_Protect.pr_argdate IS '승인일';

COMMENT ON COLUMN MY_SCHEMA.D15_Protect.pr_begdate IS '보호시작일';

COMMENT ON COLUMN MY_SCHEMA.D15_Protect.pr_enddate IS '보호종료일';

CREATE UNIQUE INDEX MY_SCHEMA.PK_D15_Protect
 ON MY_SCHEMA.D15_Protect (
  pr_no ASC
 );

ALTER TABLE MY_SCHEMA.D15_Protect
 ADD
  CONSTRAINT PK_D15_Protect
  PRIMARY KEY (
   pr_no
  );

/* 회원 */
CREATE TABLE MY_SCHEMA.D15_Member (
 m_no NUMBER NOT NULL, /* 회원번호 */
 m_id VARCHAR2(20) NOT NULL, /* 아이디 */
 m_pwd VARCHAR2(20) NOT NULL, /* 비밀번호 */
 m_lastdate DATE, /* 최종방문일 */
 c_code VARCHAR2(20) NOT NULL /* 권한코드 */
);

COMMENT ON TABLE MY_SCHEMA.D15_Member IS '회원';

COMMENT ON COLUMN MY_SCHEMA.D15_Member.m_no IS '회원번호';

COMMENT ON COLUMN MY_SCHEMA.D15_Member.m_id IS '아이디';

COMMENT ON COLUMN MY_SCHEMA.D15_Member.m_pwd IS '비밀번호';

COMMENT ON COLUMN MY_SCHEMA.D15_Member.m_lastdate IS '최종방문일';

COMMENT ON COLUMN MY_SCHEMA.D15_Member.c_code IS '권한코드';

CREATE UNIQUE INDEX MY_SCHEMA.PK_D15_Member
 ON MY_SCHEMA.D15_Member (
  m_no ASC
 );

CREATE UNIQUE INDEX MY_SCHEMA.UIX_D15_Member
 ON MY_SCHEMA.D15_Member (
  m_id ASC
 );

ALTER TABLE MY_SCHEMA.D15_Member
 ADD
  CONSTRAINT PK_D15_Member
  PRIMARY KEY (
   m_no
  );

ALTER TABLE MY_SCHEMA.D15_Member
 ADD
  CONSTRAINT UK_D15_Member
  UNIQUE (
   m_id
  );

/* 쪽지 */
CREATE TABLE MY_SCHEMA.D15_message (
 mes_no NUMBER NOT NULL, /* 쪽지번호 */
 m_no NUMBER NOT NULL, /* 회원번호 */
 mes_content VARCHAR2(100) NOT NULL, /* 쪽지글 */
 mes_date DATE, /* 쪽지날짜 */
 mes_send NUMBER NOT NULL, /* 보낸사람 */
 mes_check CHAR(2) NOT NULL /* 읽은여부 */
);

COMMENT ON TABLE MY_SCHEMA.D15_message IS '쪽지';

COMMENT ON COLUMN MY_SCHEMA.D15_message.mes_no IS '쪽지번호';

COMMENT ON COLUMN MY_SCHEMA.D15_message.m_no IS '회원번호';

COMMENT ON COLUMN MY_SCHEMA.D15_message.mes_content IS '쪽지글';

COMMENT ON COLUMN MY_SCHEMA.D15_message.mes_date IS '쪽지날짜';

COMMENT ON COLUMN MY_SCHEMA.D15_message.mes_send IS '보낸사람';

COMMENT ON COLUMN MY_SCHEMA.D15_message.mes_check IS '읽은여부';

CREATE UNIQUE INDEX MY_SCHEMA.PK_D15_message
 ON MY_SCHEMA.D15_message (
  mes_no ASC
 );

ALTER TABLE MY_SCHEMA.D15_message
 ADD
  CONSTRAINT PK_D15_message
  PRIMARY KEY (
   mes_no
  );

/* 실종신고게시판 */
CREATE TABLE MY_SCHEMA.D15_missing (
 mis_no NUMBER NOT NULL, /* 게시물번호 */
 m_no NUMBER NOT NULL, /* 회원번호 */
 p_no NUMBER NOT NULL, /* 펫번호 */
 mis_date DATE, /* 실종날짜 */
 mis_loc VARCHAR2(50) NOT NULL, /* 실종위치 */
 mis_count NUMBER, /* 조회수 */
 mis_content VARCHAR2(100) NOT NULL, /* 내용 */
 mis_pro VARCHAR2(10) /* 처리상태 */
);

COMMENT ON TABLE MY_SCHEMA.D15_missing IS '실종신고게시판';

COMMENT ON COLUMN MY_SCHEMA.D15_missing.mis_no IS '게시물번호';

COMMENT ON COLUMN MY_SCHEMA.D15_missing.m_no IS '회원번호';

COMMENT ON COLUMN MY_SCHEMA.D15_missing.p_no IS '펫번호';

COMMENT ON COLUMN MY_SCHEMA.D15_missing.mis_date IS '실종날짜';

COMMENT ON COLUMN MY_SCHEMA.D15_missing.mis_loc IS '실종위치';

COMMENT ON COLUMN MY_SCHEMA.D15_missing.mis_count IS '조회수';

COMMENT ON COLUMN MY_SCHEMA.D15_missing.mis_content IS '내용';

COMMENT ON COLUMN MY_SCHEMA.D15_missing.mis_pro IS '처리상태';

CREATE UNIQUE INDEX MY_SCHEMA.PK_D15_missing
 ON MY_SCHEMA.D15_missing (
  mis_no ASC
 );

ALTER TABLE MY_SCHEMA.D15_missing
 ADD
  CONSTRAINT PK_D15_missing
  PRIMARY KEY (
   mis_no
  );

/* 보호소 */
CREATE TABLE MY_SCHEMA.D15_Shelter (
 st_no NUMBER NOT NULL, /* 보호소 번호 */
 st_phone VARCHAR2(20) NOT NULL, /* 보호소 전화번호 */
 st_loc VARCHAR2(50) NOT NULL, /* 보호소 위치 */
 st_name VARCHAR2(20) NOT NULL, /* 보호소 이름 */
 st_mgr VARCHAR2(20) NOT NULL, /* 담당자명 */
 st_mgrphone VARCHAR2(20) /* 담당자 연락처 */
);

COMMENT ON TABLE MY_SCHEMA.D15_Shelter IS '보호소';

COMMENT ON COLUMN MY_SCHEMA.D15_Shelter.st_no IS '보호소 번호';

COMMENT ON COLUMN MY_SCHEMA.D15_Shelter.st_phone IS '보호소 전화번호';

COMMENT ON COLUMN MY_SCHEMA.D15_Shelter.st_loc IS '보호소 위치';

COMMENT ON COLUMN MY_SCHEMA.D15_Shelter.st_name IS '보호소 이름';

COMMENT ON COLUMN MY_SCHEMA.D15_Shelter.st_mgr IS '담당자명';

COMMENT ON COLUMN MY_SCHEMA.D15_Shelter.st_mgrphone IS '담당자 연락처';

CREATE UNIQUE INDEX MY_SCHEMA.PK_D15_Shelter
 ON MY_SCHEMA.D15_Shelter (
  st_no ASC
 );

CREATE UNIQUE INDEX MY_SCHEMA.UIX_D15_Shelter
 ON MY_SCHEMA.D15_Shelter (
  st_phone ASC,
  st_mgrphone ASC
 );

ALTER TABLE MY_SCHEMA.D15_Shelter
 ADD
  CONSTRAINT PK_D15_Shelter
  PRIMARY KEY (
   st_no
  );

ALTER TABLE MY_SCHEMA.D15_Shelter
 ADD
  CONSTRAINT UK_D15_Shelter
  UNIQUE (
   st_phone,
   st_mgrphone
  );

/* 펫 */
CREATE TABLE MY_SCHEMA.D15_pet (
 p_no NUMBER NOT NULL, /* 펫번호 */
 p_image VARCHAR2(100) NOT NULL, /* 사진 */
 k_code NUMBER, /* 견종코드 */
 p_gender VARCHAR2(2), /* 성별 */
 p_color VARCHAR2(100) NOT NULL, /* 색상 */
 p_feature VARCHAR2(100), /* 특징 */
 p_age NUMBER, /* 나이 */
 p_weight NUMBER /* 체중 */
);

COMMENT ON TABLE MY_SCHEMA.D15_pet IS '펫';

COMMENT ON COLUMN MY_SCHEMA.D15_pet.p_no IS '펫번호';

COMMENT ON COLUMN MY_SCHEMA.D15_pet.p_image IS '사진';

COMMENT ON COLUMN MY_SCHEMA.D15_pet.k_code IS '견종코드';

COMMENT ON COLUMN MY_SCHEMA.D15_pet.p_gender IS '성별';

COMMENT ON COLUMN MY_SCHEMA.D15_pet.p_color IS '색상';

COMMENT ON COLUMN MY_SCHEMA.D15_pet.p_feature IS '특징';

COMMENT ON COLUMN MY_SCHEMA.D15_pet.p_age IS '나이';

COMMENT ON COLUMN MY_SCHEMA.D15_pet.p_weight IS '체중';

CREATE UNIQUE INDEX MY_SCHEMA.PK_D15_pet
 ON MY_SCHEMA.D15_pet (
  p_no ASC
 );

ALTER TABLE MY_SCHEMA.D15_pet
 ADD
  CONSTRAINT PK_D15_pet
  PRIMARY KEY (
   p_no
  );

/* 분양 */
CREATE TABLE MY_SCHEMA.D15_parcel (
 pc_no NUMBER NOT NULL, /* 분양번호 */
 m_no NUMBER, /* 회원번호 */
 org_no NUMBER, /* 유기견 번호 */
 pc_reqdate DATE NOT NULL, /* 승인신청일 */
 pc_begdate DATE, /* 분양시작일 */
 pc_petc NUMBER, /* 맡았던동물수 */
 pc_argdate DATE /* 승인일 */
);

COMMENT ON TABLE MY_SCHEMA.D15_parcel IS '분양';

COMMENT ON COLUMN MY_SCHEMA.D15_parcel.pc_no IS '분양번호';

COMMENT ON COLUMN MY_SCHEMA.D15_parcel.m_no IS '회원번호';

COMMENT ON COLUMN MY_SCHEMA.D15_parcel.org_no IS '유기견 번호';

COMMENT ON COLUMN MY_SCHEMA.D15_parcel.pc_reqdate IS '승인신청일';

COMMENT ON COLUMN MY_SCHEMA.D15_parcel.pc_begdate IS '분양시작일';

COMMENT ON COLUMN MY_SCHEMA.D15_parcel.pc_petc IS '맡았던동물수';

COMMENT ON COLUMN MY_SCHEMA.D15_parcel.pc_argdate IS '승인일';

CREATE UNIQUE INDEX MY_SCHEMA.PK_D15_parcel
 ON MY_SCHEMA.D15_parcel (
  pc_no ASC
 );

ALTER TABLE MY_SCHEMA.D15_parcel
 ADD
  CONSTRAINT PK_D15_parcel
  PRIMARY KEY (
   pc_no
  );

/* 공지사항 */
CREATE TABLE MY_SCHEMA.D15_notice (
 notice_no NUMBER NOT NULL, /* 게시물번호 */
 m_no NUMBER NOT NULL, /* 회원번호 */
 notice_name VARCHAR2(50) NOT NULL, /* 글제목 */
 notice_date DATE NOT NULL, /* 작성일 */
 notice_content VARCHAR2(2000) NOT NULL, /* 글내용 */
 notice_count NUMBER /* 조회수 */
);

COMMENT ON TABLE MY_SCHEMA.D15_notice IS '공지사항';

COMMENT ON COLUMN MY_SCHEMA.D15_notice.notice_no IS '게시물번호';

COMMENT ON COLUMN MY_SCHEMA.D15_notice.m_no IS '회원번호';

COMMENT ON COLUMN MY_SCHEMA.D15_notice.notice_name IS '글제목';

COMMENT ON COLUMN MY_SCHEMA.D15_notice.notice_date IS '작성일';

COMMENT ON COLUMN MY_SCHEMA.D15_notice.notice_content IS '글내용';

COMMENT ON COLUMN MY_SCHEMA.D15_notice.notice_count IS '조회수';

CREATE UNIQUE INDEX MY_SCHEMA.PK_D15_notice
 ON MY_SCHEMA.D15_notice (
  notice_no ASC
 );

ALTER TABLE MY_SCHEMA.D15_notice
 ADD
  CONSTRAINT PK_D15_notice
  PRIMARY KEY (
   notice_no
  );

/* 게시판 */
CREATE TABLE MY_SCHEMA.D15_board (
 b_no NUMBER NOT NULL, /* 게시물번호 */
 m_no NUMBER NOT NULL, /* 회원번호 */
 b_name VARCHAR2(50) NOT NULL, /* 글제목 */
 b_content VARCHAR2(2000) NOT NULL, /* 글내용 */
 b_count NUMBER, /* 조회수 */
 b_file VARCHAR2(100), /* 업로드파일 */
 b_date DATE NOT NULL, /* 작성일 */
 b_ref NUMBER, /* 참조 */
 b_depth NUMBER, /* 들여쓰기 */
 b_step NUMBER /* 글순서 */
);

COMMENT ON TABLE MY_SCHEMA.D15_board IS '게시판';

COMMENT ON COLUMN MY_SCHEMA.D15_board.b_no IS '게시물번호';

COMMENT ON COLUMN MY_SCHEMA.D15_board.m_no IS '회원번호';

COMMENT ON COLUMN MY_SCHEMA.D15_board.b_name IS '글제목';

COMMENT ON COLUMN MY_SCHEMA.D15_board.b_content IS '글내용';

COMMENT ON COLUMN MY_SCHEMA.D15_board.b_count IS '조회수';

COMMENT ON COLUMN MY_SCHEMA.D15_board.b_file IS '업로드파일';

COMMENT ON COLUMN MY_SCHEMA.D15_board.b_date IS '작성일';

COMMENT ON COLUMN MY_SCHEMA.D15_board.b_ref IS '참조';

COMMENT ON COLUMN MY_SCHEMA.D15_board.b_depth IS '들여쓰기';

COMMENT ON COLUMN MY_SCHEMA.D15_board.b_step IS '글순서';

CREATE UNIQUE INDEX MY_SCHEMA.PK_D15_board
 ON MY_SCHEMA.D15_board (
  b_no ASC
 );

ALTER TABLE MY_SCHEMA.D15_board
 ADD
  CONSTRAINT PK_D15_board
  PRIMARY KEY (
   b_no
  );

/*  board댓글 */
CREATE TABLE MY_SCHEMA.d15_reply (
 re_no NUMBER NOT NULL, /* 댓글번호 */
 m_no NUMBER, /* 회원번호 */
 re_content varchar2(500) NOT NULL, /* 글내용 */
 re_date DATE NOT NULL, /* 작성일 */
 b_no NUMBER NOT NULL /* 게시물번호 */
);

COMMENT ON TABLE MY_SCHEMA.d15_reply IS ' board댓글';

COMMENT ON COLUMN MY_SCHEMA.d15_reply.re_no IS '댓글번호';

COMMENT ON COLUMN MY_SCHEMA.d15_reply.m_no IS '회원번호';

COMMENT ON COLUMN MY_SCHEMA.d15_reply.re_content IS '글내용';

COMMENT ON COLUMN MY_SCHEMA.d15_reply.re_date IS '작성일';

COMMENT ON COLUMN MY_SCHEMA.d15_reply.b_no IS '게시물번호';

CREATE UNIQUE INDEX MY_SCHEMA.PK_d15_reply
 ON MY_SCHEMA.d15_reply (
  re_no ASC
 );

ALTER TABLE MY_SCHEMA.d15_reply
 ADD
  CONSTRAINT PK_d15_reply
  PRIMARY KEY (
   re_no
  );

/* 권한 */
CREATE TABLE MY_SCHEMA.D15_cons (
 c_code VARCHAR2(20) NOT NULL, /* 권한코드 */
 c_con VARCHAR2(20) NOT NULL /* 권한 */
);

COMMENT ON TABLE MY_SCHEMA.D15_cons IS '권한';

COMMENT ON COLUMN MY_SCHEMA.D15_cons.c_code IS '권한코드';

COMMENT ON COLUMN MY_SCHEMA.D15_cons.c_con IS '권한';

CREATE UNIQUE INDEX MY_SCHEMA.PK_D15_cons
 ON MY_SCHEMA.D15_cons (
  c_code ASC
 );

ALTER TABLE MY_SCHEMA.D15_cons
 ADD
  CONSTRAINT PK_D15_cons
  PRIMARY KEY (
   c_code
  );

/* 회원상세 */
CREATE TABLE MY_SCHEMA.D15_Detail (
 m_no NUMBER NOT NULL, /* 회원번호 */
 m_name VARCHAR2(20) NOT NULL, /* 이름 */
 m_phone VARCHAR2(20) NOT NULL, /* 연락처 */
 m_birth NUMBER, /* 생년월일 */
 m_email VARCHAR2(30) NOT NULL, /* Email */
 m_addr VARCHAR2(50) NOT NULL, /* 거주정보 */
 m_petok CHAR(2), /* 경험여부 */
 m_update DATE, /* 정보수정일  */
 m_regdate DATE, /* 회원가입일 */
 m_file VARCHAR2(100) /* 첨부파일 */
);

COMMENT ON TABLE MY_SCHEMA.D15_Detail IS '회원상세';

COMMENT ON COLUMN MY_SCHEMA.D15_Detail.m_no IS '회원번호';

COMMENT ON COLUMN MY_SCHEMA.D15_Detail.m_name IS '이름';

COMMENT ON COLUMN MY_SCHEMA.D15_Detail.m_phone IS '연락처';

COMMENT ON COLUMN MY_SCHEMA.D15_Detail.m_birth IS '생년월일';

COMMENT ON COLUMN MY_SCHEMA.D15_Detail.m_email IS 'Email';

COMMENT ON COLUMN MY_SCHEMA.D15_Detail.m_addr IS '거주정보';

COMMENT ON COLUMN MY_SCHEMA.D15_Detail.m_petok IS '경험여부';

COMMENT ON COLUMN MY_SCHEMA.D15_Detail.m_update IS '정보수정일 ';

COMMENT ON COLUMN MY_SCHEMA.D15_Detail.m_regdate IS '회원가입일';

COMMENT ON COLUMN MY_SCHEMA.D15_Detail.m_file IS '첨부파일';

CREATE UNIQUE INDEX MY_SCHEMA.UIX_D15_Detail
 ON MY_SCHEMA.D15_Detail (
  m_phone ASC,
  m_email ASC
 );

ALTER TABLE MY_SCHEMA.D15_Detail
 ADD
  CONSTRAINT UK_D15_Detail
  UNIQUE (
   m_phone,
   m_email
  );

/* 품종 */
CREATE TABLE MY_SCHEMA.D15_kind (
 k_code NUMBER NOT NULL, /* 견종코드 */
 k_kind VARCHAR2(20) NOT NULL /* 견종 */
);

COMMENT ON TABLE MY_SCHEMA.D15_kind IS '품종';

COMMENT ON COLUMN MY_SCHEMA.D15_kind.k_code IS '견종코드';

COMMENT ON COLUMN MY_SCHEMA.D15_kind.k_kind IS '견종';

CREATE UNIQUE INDEX MY_SCHEMA.PK_D15_kind
 ON MY_SCHEMA.D15_kind (
  k_code ASC
 );

ALTER TABLE MY_SCHEMA.D15_kind
 ADD
  CONSTRAINT PK_D15_kind
  PRIMARY KEY (
   k_code
  );

ALTER TABLE MY_SCHEMA.D15_organic
 ADD
  CONSTRAINT FK_D15_Shelter_TO_D15_organic
  FOREIGN KEY (
   st_no
  )
  REFERENCES MY_SCHEMA.D15_Shelter (
   st_no
  );

ALTER TABLE MY_SCHEMA.D15_organic
 ADD
  CONSTRAINT FK_D15_kind_TO_D15_organic
  FOREIGN KEY (
   k_code
  )
  REFERENCES MY_SCHEMA.D15_kind (
   k_code
  );

ALTER TABLE MY_SCHEMA.D15_Protect
 ADD
  CONSTRAINT FK_D15_Member_TO_D15_Protect
  FOREIGN KEY (
   m_no
  )
  REFERENCES MY_SCHEMA.D15_Member (
   m_no
  );

ALTER TABLE MY_SCHEMA.D15_Protect
 ADD
  CONSTRAINT FK_D15_organic_TO_D15_Protect
  FOREIGN KEY (
   org_no
  )
  REFERENCES MY_SCHEMA.D15_organic (
   org_no
  );

ALTER TABLE MY_SCHEMA.D15_Member
 ADD
  CONSTRAINT FK_D15_cons_TO_D15_Member
  FOREIGN KEY (
   c_code
  )
  REFERENCES MY_SCHEMA.D15_cons (
   c_code
  );

ALTER TABLE MY_SCHEMA.D15_message
 ADD
  CONSTRAINT FK_D15_Member_TO_D15_message
  FOREIGN KEY (
   m_no
  )
  REFERENCES MY_SCHEMA.D15_Member (
   m_no
  );

ALTER TABLE MY_SCHEMA.D15_message
 ADD
  CONSTRAINT FK_D15_Member_TO_D15_message2
  FOREIGN KEY (
   mes_send
  )
  REFERENCES MY_SCHEMA.D15_Member (
   m_no
  );

ALTER TABLE MY_SCHEMA.D15_missing
 ADD
  CONSTRAINT FK_D15_Member_TO_D15_missing
  FOREIGN KEY (
   m_no
  )
  REFERENCES MY_SCHEMA.D15_Member (
   m_no
  );

ALTER TABLE MY_SCHEMA.D15_missing
 ADD
  CONSTRAINT FK_D15_pet_TO_D15_missing
  FOREIGN KEY (
   p_no
  )
  REFERENCES MY_SCHEMA.D15_pet (
   p_no
  );

ALTER TABLE MY_SCHEMA.D15_pet
 ADD
  CONSTRAINT FK_D15_kind_TO_D15_pet
  FOREIGN KEY (
   k_code
  )
  REFERENCES MY_SCHEMA.D15_kind (
   k_code
  );

ALTER TABLE MY_SCHEMA.D15_parcel
 ADD
  CONSTRAINT FK_D15_Member_TO_D15_parcel
  FOREIGN KEY (
   m_no
  )
  REFERENCES MY_SCHEMA.D15_Member (
   m_no
  );

ALTER TABLE MY_SCHEMA.D15_parcel
 ADD
  CONSTRAINT FK_D15_organic_TO_D15_parcel
  FOREIGN KEY (
   org_no
  )
  REFERENCES MY_SCHEMA.D15_organic (
   org_no
  );

ALTER TABLE MY_SCHEMA.D15_notice
 ADD
  CONSTRAINT FK_D15_Member_TO_D15_notice
  FOREIGN KEY (
   m_no
  )
  REFERENCES MY_SCHEMA.D15_Member (
   m_no
  );

ALTER TABLE MY_SCHEMA.D15_board
 ADD
  CONSTRAINT FK_D15_Member_TO_D15_board
  FOREIGN KEY (
   m_no
  )
  REFERENCES MY_SCHEMA.D15_Member (
   m_no
  );

ALTER TABLE MY_SCHEMA.d15_reply
 ADD
  CONSTRAINT FK_D15_board_TO_d15_reply
  FOREIGN KEY (
   b_no
  )
  REFERENCES MY_SCHEMA.D15_board (
   b_no
  );

ALTER TABLE MY_SCHEMA.d15_reply
 ADD
  CONSTRAINT FK_D15_Member_TO_d15_reply
  FOREIGN KEY (
   m_no
  )
  REFERENCES MY_SCHEMA.D15_Member (
   m_no
  );

ALTER TABLE MY_SCHEMA.D15_Detail
 ADD
  CONSTRAINT FK_D15_Member_TO_D15_Detail
  FOREIGN KEY (
   m_no
  )
  REFERENCES MY_SCHEMA.D15_Member (
   m_no
  );
  
  create sequence m_no_seq -- 회원
start with 1
increment by 1
nocache;

create sequence notice_no_seq -- 공지사항
start with 1
increment by 1
nocache;

create sequence p_no_seq -- 펫
start with 1
increment by 1
nocache;

create sequence mis_no_seq -- 실종신고 게시판
start with 1
increment by 1
nocache;

create sequence mes_no_seq -- 쪽지
start with 1
increment by 1
nocache;

create sequence st_no_seq -- 보호소
start with 1
increment by 1
nocache;

create sequence org_no_seq -- 유기동물
start with 1
increment by 1
nocache;

create sequence pc_no_seq -- 분양
start with 1
increment by 1
nocache;

create sequence pr_no_seq -- 임시보호
start with 1
increment by 1
nocache;


create sequence b_no_seq -- 게시판
start with 1
increment by 1
nocache;

create sequence re_no_seq -- 댓글
start with 1
increment by 1
nocache;
  