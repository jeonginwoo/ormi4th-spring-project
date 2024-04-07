# ormi4th-spring-project
## 데이터베이스 모델링(ER Diagram)
![ERD](https://github.com/jeonginwoo/ormi4th-spring-project/assets/128672362/2d230dff-0378-40fd-bce7-42fa8d298312)
## API 명세서

### BoardController
| URL                 | HTTP Method | 설명             |로그인 권한 필요|작성자 권한 필요|Admin 권한|
|:--------------------|:------------|:---------------|:-:|:-:|:-:|
| '/boards'           | POST        | 게시글 추가         |✅|✅||
| '/boards'           | GET         | 게시글 목록 조회      |✅|✅||
| '/boards/{boardId}' | GET         | 특정 게시글 조회      |✅|✅||
| '/boards/new-board' | GET         | 특정 게시글 생성 및 수정 |✅|✅||
| '/boards/search'    | GET         | 게시글 조건 별 검색    |✅|✅||
| '/boards/{id}'      | DELETE      | 특정 게시글 삭제      |✅|✅||
| '/boards/{id}'      | PUT         | 특정 게시글 수정      |✅|✅||
<br>

### CommentController

| URL                 | HTTP Method | 설명          |로그인 권한 필요|작성자 권한 필요|Admin 권한|
|:--------------------|:------------|:------------|:-:|:-:|:-:|
| '/boards/{boardId}/comments'           | POST        | 댓글 생성       |✅|✅||
| '/boards/{boardId}/comments'           | GET         | 댓글 조회       |✅|✅||
| '/boards/{boardId}/comments/{commentId}' | PUT         | 댓글 수정       |✅|✅||
| '/boards/{boardId}/comments/{commentId}' | DELETE      | 댓글 삭제       |✅|✅||
<br>

### FileApiController

| URL                 | HTTP Method | 설명          |로그인 권한 필요| 작성자 권한 필요 |Admin 권한|
|:--------------------|:------------|:------------|:-:|:---------:|:-:|
| '/image-upload'           | POST        | 이미지파일 저장    |✅|           ||
| '/image-upload'           | GET         | 이미지 Byte 변환 |✅|           ||

<br>

### GameResultController

| URL                 | HTTP Method | 설명    |로그인 권한 필요| 작성자 권한 필요 |Admin 권한|
|:--------------------|:------------|:------|:-:|:---------:|:-:|
| '/gameresult'           | GET         | 경기 결과 |✅|           ||
<br>

### IndexController

| URL                 | HTTP Method | 설명          |로그인 권한 필요| 작성자 권한 필요 |Admin 권한|
|:--------------------|:------------|:------------|:-:|:---------:|:-:|
| '/'           | GET         | 인덱스 페이지 렌더링 |✅|           ||
<br>

### LikeController

| URL                 | HTTP Method | 설명     |로그인 권한 필요|작성자 권한 필요|Admin 권한|
|:--------------------|:------------|:-------|:-:|:-:|:-:|
| '/boards/{id}/like'           | POST        | 좋아요 추가 |✅|✅||
| '/boards/{id}/like'           | DELETE      | 좋아요 삭제 |✅|✅||
<br>

### LineUpController

| URL                 | HTTP Method | 설명        |로그인 권한 필요| 작성자 권한 필요 |Admin 권한|
|:--------------------|:------------|:----------|:-:|:---------:|:-:|
| '/lineup/batter'           | GET         | 타자 라인업 조회 |✅|           ||
| '/lineup/pitcher'           | GET         | 투수 라인업 조회 |✅|           ||
<br>

### PlayerController

| URL                 | HTTP Method | 설명                 |로그인 권한 필요| 작성자 권한 필요 |Admin 권한|
|:--------------------|:------------|:-------------------|:-:|:---------:|:-:|
| '/player/{id}'           | GET         | 특정 선수 조회           |✅|           ||
| '/player'           | GET         | 팀 선수 목록 조회         |✅|           ||
| '/player/info'           | GET         | 특정 선수 시즌기록 및 정보 조회 |✅|           ||
<br>

### RecordController

| URL                 | HTTP Method | 설명             |로그인 권한 필요| 작성자 권한 필요 |Admin 권한|
|:--------------------|:------------|:---------------|:-:|:---------:|:-:|
| '/record/batter/{playerId}'           | GET         | 특정 타가 기록 조회    |✅|           ||
| '/record/pitcher/{playerId}'           | GET         | 특정 투수 기록 조회    |✅|           ||
| '/record'           | GET         | 특정 시즌 선수 기록 조회 |✅|           ||
| '/record/ranking'           | GET         | 시즌 별 랭킹 조회     |✅|           ||
<br>

### UserViewController

| URL                          | HTTP Method | 설명           |로그인 권한 필요| 작성자 권한 필요 |Admin 권한|
|:-----------------------------|:------------|:-------------|:-:|:---------:|:-:|
| '/login'                     | GET         | 로그인          |✅|           ||
| '/login'                     | POST        | 로그인 성공       |✅|           ||
| '/signup'                    | GET         | 회원가입         |✅|           ||
| '/addUser'                   | POST        | 회원가입 성공      |✅|           ||
| '/checkNicknameAvailability' | GET         | 닉네임 중복 검사 확인 |✅|           ||
<br>

### UserController

| URL                          | HTTP Method | 설명                  |로그인 권한 필요| 작성자 권한 필요 |Admin 권한|
|:-----------------------------|:------------|:--------------------|:-:|:--------:|:-:|
| '/mypage'                     | GET         | 사용자 마이페이지 조회        |✅|          ||
| '/mypage/update/{userId}'                     | GET         | 사용자 마이페이지 수정 페이지 조회 |✅|          ||
| '/mypage/update/{userId}'                    | PUT         | 사용자 마이페이지 정보 수정     |✅|          ||
| '/mypage/{userId}'                   | DELETE      | 사용자 계정삭제            |✅|          ||
| '/mypage/admin' | GET         | 관리자 페이지 조회          |✅|          |✅|
| '/mypage/{userId}/admin' | POST        | 관리자 권한 설정           |✅|          |✅|
| '/logout' | GET         | 로그아웃                |✅|          ||
| '/checkCurrentPassword' | POST        | 비밀번호 일치 여부 확인       |✅|          ||
<br>

### ScheduleController

| URL                 | HTTP Method | 설명          |로그인 권한 필요| 작성자 권한 필요 |Admin 권한|
|:--------------------|:------------|:------------|:-:|:---------:|:-:|
| '/schedule'           | GET         | 월별 경기 일정 조회 |✅|           ||
| '/schedule/daily'           | GET         | 일별 경기 일정 조회 |✅|           ||

<br>

### ScoreBoardController

| URL                 | HTTP Method | 설명          |로그인 권한 필요| 작성자 권한 필요 |Admin 권한|
|:--------------------|:------------|:------------|:-:|:---------:|:-:|
| '/scoreboard'           | GET         | 경기결과 점수판 조회 |✅|           ||


<br>

### TeamController

| URL     | HTTP Method | 설명      |로그인 권한 필요| 작성자 권한 필요 |Admin 권한|
|:--------|:------------|:--------|:-:|:---------:|:-:|
| '/team' | GET         | 팀 정보 조회 |✅|           ||


<br>

## 요구사항 및 기능명세
![요구사항 및 기능명세](https://github.com/jeonginwoo/ormi4th-spring-project/assets/128672362/edf4602c-e2ed-4dfe-a734-b787b396d47d)