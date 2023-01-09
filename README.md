# JSP를 활용한 Model1 프로젝트 - Logitech 웹사이트 구현 프로젝트

## 🖥️ 프로젝트 소개
- 컴퓨터 주변기기 브랜드 Logitech의 홈페이지를 기반으로 상품 구매, 고객 문의 게시판 기능이 있는 웹페이지입니다. 

## 🕰️ 프로젝트 기간
- 2022.09.27 ~ 2022.10.14

## ⚙️ 개발 환경
- 개발 도구
    - Eclipse
    - GitHub, Google docs
- 개발 OS
    - Windows 10
- Back-end
    - 언어: Java
    - 서버: Apache Tomcat 9.0
    - DB: MySQL
- Front-end
    - Web: HTML5, CSS, JavaScript, JSP, jQuery
    - API: BootStrap5

## 📜 ERD
<img src="https://user-images.githubusercontent.com/106582252/210236788-617c185d-fbda-4064-bd52-2fa8674c8dfa.png" alt=""></img>


## 🧑‍🤝‍🧑 프로젝트 역할 분담
팀장 맹주안: 상품 게시판(CRUD), 최종발표


<b>팀원 강혜원: 고객 문의 게시판(CRUD), 댓글(CRUD), PPT제작</b>


팀원 권민찬: 메인 페이지, 로그인, 장바구니

## 📌 담당 기능
### 고객 문의 게시판 [상세보기 - WIKI 이동](https://github.com/InsooHan/mainssangproject/wiki/Main-%ED%8E%98%EC%9D%B4%EC%A7%80-%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C)
- 당일 올라온 문의글의 제목 옆에 'new' 아이콘 표시
- 관리자의 댓글이 달린 문의글은 제목 옆에 '[답변완료]' 표시
- 관리자를 제외하고 모든 회원들은 본인이 작성한 문의글만 조회 가능
- 공지사항 게시물 검색

### 댓글 [상세보기 - WIKI 이동](https://github.com/InsooHan/mainssangproject/wiki/%EB%A1%9C%EA%B7%B8%EC%9D%B8-%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EC%86%8C%EA%B0%9C)
- 로그인된 계정이 관리자인 경우만 댓글 작성창 활성화
- AJAX를 활용하여 비동기 방식으로 댓글 CRUD

### 배포
- AWS Elastick Beanstalk를 활용하여 서버 배포
- 배포 링크: <http://semiproject-env-1.eba-vva2qcss.ap-northeast-2.elasticbeanstalk.com/index.jsp/>
