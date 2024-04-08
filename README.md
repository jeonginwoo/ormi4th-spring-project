
# 일사만루 - 프로야구 커뮤니티 

### 목차
- [프로젝트 소개](#프로젝트-소개)
- [프로젝트 목표](#프로젝트-목표)
- [프로젝트 진행기간](#프로젝트-진행-기간)
- [개발 인원 및 역할](#개발-인원-및-역할)
- [배포 주소](#배포-주소)
- [사용 기술](#Skills)
- [개발 일정](#개발-일정)
- [플로우차트](#플로우차트flow-chart)
- [데이터베이스 모델링](#데이터베이스-모델링er-diagram)
- [API 명세서](#API-명세서)
- [요구사항 및 기능명세](#요구사항-및-기능명세)
- [프로젝트 구조](#프로젝트-구조)

## 프로젝트 소개
현재 국내에서 최고 인기있는 프로스포츠는 프로야구입니다. 경기가 있는 날이면 각종 커뮤니티에서 
야구 관련 게시물들이 쏟아집니다. 하지만 경기 기록을 보면서 사용자들끼리 소통을 하는 커뮤니티는 찾아 보기 어렵습니다.
그렇기 때문에 경기 기록을 제공하면서, 기록 작성에도 관여를 할 수 있는 커뮤니티 서비스를 기획하게 되었습니다.


## 프로젝트 목표
1. 프로야구 경기 결과와 함께 선수들의 기록을 제공해준다.
2. 경기 기록을 관리자 뿐만 아니라 사용자들도 작성을 할 수 있다.
3. 각 팀별 게시판을 통해 서로 소통을 할 수 있다.

## 프로젝트 진행 기간

- 2024-03-22 ~ 2024-04-08

## 개발 인원 및 역할
## 🙌 안녕하세요.
|김의찬|                                                                                                                     강성훈                                                                                                                     |정인우|
|:----:|:------------------------------------------------------------------------------------------------------------------------------------------------:|:-----:|
|<img src="https://github.com/jeonginwoo/ormi4th-spring-project/assets/128672362/b87c72ea-4e4e-4600-ac82-32a3a3a7803a" style="width: 100px; height: 100px;">|   <img src="https://github.com/jeonginwoo/ormi4th-spring-project/assets/128672362/8579086c-a504-4e9b-ae15-d51586dc872c" style="width: 100px; height: 100px;">                                                                                                          |<img src="https://github.com/jeonginwoo/ormi4th-spring-project/assets/128672362/d084e67e-d4f8-4260-aaa6-5c153ab7aedc" style="width: 100px; height:100px;">|
|<a href="https://github.com/euichan0927">🔗 김의찬</a>|                                                                                            <a href="https://github.com/fernandokkang">🔗 강성훈</a>                                                                                            |<a href="https://github.com/jeonginwoo">🔗 정인우</a>|
|‣ 요구사항 및 기능 명세<br>‣ API 설계 (API 명세서)<br>‣회원가입 및 로그인 기능 개발<br>‣ 사용자 마이페이지 및 관리자페이지 기능 개발<br>‣ 게시글 조건 검색 기능 개발<br>‣마이페이지 페이징처리 적용| ‣ 프로야구 관련 ERD 설계 <br>‣프로야구 기록 관련 데이터 수집, 가공 및 처리 <br>‣ UI/UX 디자인 <br>‣ 메인 페이지 <br>‣ 팀 순위 페이지 <br> ‣경기 일정/결과 페이지 <br> ‣선수 기록 및 순위 페이지 <br>‣선수 상세 정보 페이지 <br>  ‣선수 정보 API <br> ‣선수 기록 API <br> ‣팀 정보 API <br> ‣팀 순위 API <br> ‣일정/결과 API <br> ‣투수/타자 라인업 API <br> ‣경기 라인업 등록 페이지 및 라인업 등록 기능 <br>|‣ 게시판 api 개발<br>‣ 댓글 api 개발<br>‣ 게시글에 댓글 & 답글 적용<br>‣ 게시글, 댓글 좋아요 기능 개발<br>‣ toast ui editor 적용<br>‣ 게시판 페이징처리 적용<br>‣Flow Chart 설계<br>‣개발 일정 기록|


## 배포 주소


## Skills

### Languages

[![My Skills](https://skillicons.dev/icons?i=spring,java,js,html,css)](https://skillicons.dev)

### Tools

[![My Skills](https://skillicons.dev/icons?i=idea,gradle,github,figma,docker)](https://skillicons.dev)

### DataBase

[![My Skills](https://skillicons.dev/icons?i=mysql)](https://skillicons.dev)

### OS

[![My Skills](https://skillicons.dev/icons?i=windows,ubuntu)](https://skillicons.dev)

### Deploy

[![My Skills](https://skillicons.dev/icons?i=aws,githubactions)](https://skillicons.dev)

### API

- toast UI API

## 개발 일정
![Untitled (2)](https://github.com/ormi3-final-project-team/nolreo_wassup_BE/assets/96004205/c352f447-eb01-4f46-b2e1-7a05ad3a4617)

## 플로우차트(Flow Chart)
![플로우차트](https://github.com/jeonginwoo/ormi4th-spring-project/assets/96004205/df56fb67-dc5f-4f9b-8127-0b7fd13d11b8)

## 데이터베이스 모델링(ER Diagram)
![ERD](https://github.com/jeonginwoo/ormi4th-spring-project/assets/128672362/2d230dff-0378-40fd-bce7-42fa8d298312)
## API 명세서

### Board
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

### Comment

| URL                 | HTTP Method | 설명          |로그인 권한 필요|작성자 권한 필요|Admin 권한|
|:--------------------|:------------|:------------|:-:|:-:|:-:|
| '/boards/{boardId}/comments'           | POST        | 댓글 생성       |✅|✅||
| '/boards/{boardId}/comments'           | GET         | 댓글 조회       |✅|✅||
| '/boards/{boardId}/comments/{commentId}' | PUT         | 댓글 수정       |✅|✅||
| '/boards/{boardId}/comments/{commentId}' | DELETE      | 댓글 삭제       |✅|✅||
<br>

### FileApi

| URL                 | HTTP Method | 설명          |로그인 권한 필요| 작성자 권한 필요 |Admin 권한|
|:--------------------|:------------|:------------|:-:|:---------:|:-:|
| '/image-upload'           | POST        | 이미지파일 저장    |✅|           ||
| '/image-upload'           | GET         | 이미지 Byte 변환 |✅|           ||

<br>

### GameResult

| URL                 | HTTP Method | 설명    |로그인 권한 필요| 작성자 권한 필요 |Admin 권한|
|:--------------------|:------------|:------|:-:|:---------:|:-:|
| '/gameresult'           | GET         | 경기 결과 |✅|           ||
<br>

### Index

| URL                 | HTTP Method | 설명          |로그인 권한 필요| 작성자 권한 필요 |Admin 권한|
|:--------------------|:------------|:------------|:-:|:---------:|:-:|
| '/'           | GET         | 인덱스 페이지 렌더링 |✅|           ||
<br>

### Like

| URL                 | HTTP Method | 설명     |로그인 권한 필요|작성자 권한 필요|Admin 권한|
|:--------------------|:------------|:-------|:-:|:-:|:-:|
| '/boards/{id}/like'           | POST        | 좋아요 추가 |✅|✅||
| '/boards/{id}/like'           | DELETE      | 좋아요 삭제 |✅|✅||
<br>

### LineUp

| URL                 | HTTP Method | 설명        |로그인 권한 필요| 작성자 권한 필요 |Admin 권한|
|:--------------------|:------------|:----------|:-:|:---------:|:-:|
| '/lineup/batter'           | GET         | 타자 라인업 조회 |✅|           ||
| '/lineup/pitcher'           | GET         | 투수 라인업 조회 |✅|           ||
<br>

### Player

| URL                 | HTTP Method | 설명                 |로그인 권한 필요| 작성자 권한 필요 |Admin 권한|
|:--------------------|:------------|:-------------------|:-:|:---------:|:-:|
| '/player/{id}'           | GET         | 특정 선수 조회           |✅|           ||
| '/player'           | GET         | 팀 선수 목록 조회         |✅|           ||
| '/player/info'           | GET         | 특정 선수 시즌기록 및 정보 조회 |✅|           ||
<br>

### Record

| URL                 | HTTP Method | 설명             |로그인 권한 필요| 작성자 권한 필요 |Admin 권한|
|:--------------------|:------------|:---------------|:-:|:---------:|:-:|
| '/record/batter/{playerId}'           | GET         | 특정 타가 기록 조회    |✅|           ||
| '/record/pitcher/{playerId}'           | GET         | 특정 투수 기록 조회    |✅|           ||
| '/record'           | GET         | 특정 시즌 선수 기록 조회 |✅|           ||
| '/record/ranking'           | GET         | 시즌 별 랭킹 조회     |✅|           ||
<br>

### UserView

| URL                          | HTTP Method | 설명           |로그인 권한 필요| 작성자 권한 필요 |Admin 권한|
|:-----------------------------|:------------|:-------------|:-:|:---------:|:-:|
| '/login'                     | GET         | 로그인          |✅|           ||
| '/login'                     | POST        | 로그인 성공       |✅|           ||
| '/signup'                    | GET         | 회원가입         |✅|           ||
| '/addUser'                   | POST        | 회원가입 성공      |✅|           ||
| '/checkNicknameAvailability' | GET         | 닉네임 중복 검사 확인 |✅|           ||
<br>

### User

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

### Schedule

| URL                 | HTTP Method | 설명          |로그인 권한 필요| 작성자 권한 필요 |Admin 권한|
|:--------------------|:------------|:------------|:-:|:---------:|:-:|
| '/schedule'           | GET         | 월별 경기 일정 조회 |✅|           ||
| '/schedule/daily'           | GET         | 일별 경기 일정 조회 |✅|           ||

<br>

### ScoreBoard

| URL                 | HTTP Method | 설명          |로그인 권한 필요| 작성자 권한 필요 |Admin 권한|
|:--------------------|:------------|:------------|:-:|:---------:|:-:|
| '/scoreboard'           | GET         | 경기결과 점수판 조회 |✅|           ||


<br>

### Team

| URL     | HTTP Method | 설명      |로그인 권한 필요| 작성자 권한 필요 |Admin 권한|
|:--------|:------------|:--------|:-:|:---------:|:-:|
| '/team' | GET         | 팀 정보 조회 |✅|           ||


<br>

## 요구사항 및 기능명세
![요구사항 및 기능명세](https://github.com/jeonginwoo/ormi4th-spring-project/assets/128672362/edf4602c-e2ed-4dfe-a734-b787b396d47d)

## 프로젝트 구조
```text
└─📁src
    ├─📁main
    │  ├─📁java
    │  │  └─📁com
    │  │      └─📁estsoft
    │  │          └─📁springproject
    │  │              │  📄SpringProjectApplication.java
    │  │              │
    │  │              ├─📁aspect
    │  │              │      📄AuthenticationAspect.java
    │  │              │
    │  │              ├─📁config
    │  │              │      📄WebSecurityConfig.java
    │  │              │
    │  │              ├─📁controller
    │  │              │      📄BoardController.java
    │  │              │      📄CommentController.java
    │  │              │      📄FileApiController.java
    │  │              │      📄GameResultController.java
    │  │              │      📄IndexController.java
    │  │              │      📄LikeController.java
    │  │              │      📄LineupController.java
    │  │              │      📄PlayerController.java
    │  │              │      📄RecordController.java
    │  │              │      📄ScheduleController.java
    │  │              │      📄ScoreBoardController.java
    │  │              │      📄TeamController.java
    │  │              │      📄TeamRankingController.java
    │  │              │      📄UserController.java
    │  │              │      📄UserViewController.java
    │  │              │
    │  │              ├─📁domain
    │  │              │  ├─📁dto
    │  │              │  │      📄Batter.java
    │  │              │  │      📄BatterLineup.java
    │  │              │  │      📄BatterRecord.java
    │  │              │  │      📄BatterRecordDetail.java
    │  │              │  │      📄BoardRequest.java
    │  │              │  │      📄BoardResponse.java
    │  │              │  │      📄CommentRequest.java
    │  │              │  │      📄CommentResponse.java
    │  │              │  │      📄GameInfo.java
    │  │              │  │      📄GameResult.java
    │  │              │  │      📄LikeRequest.java
    │  │              │  │      📄LikeResponse.java
    │  │              │  │      📄Pitcher.java
    │  │              │  │      📄PitcherLineup.java
    │  │              │  │      📄PitcherRecord.java
    │  │              │  │      📄PitcherRecordDetail.java
    │  │              │  │      📄PlayerInfo.java
    │  │              │  │      📄Schedule.java
    │  │              │  │      📄ScoreBoard.java
    │  │              │  │      📄Team.java
    │  │              │  │      📄TeamId.java
    │  │              │  │      📄TeamRanking.java
    │  │              │  │      📄TeamRankingDetail.java
    │  │              │  │      📄UserAdminResponse.java
    │  │              │  │      📄UserRequest.java
    │  │              │  │      📄UserResponse.java
    │  │              │  │
    │  │              │  └─📁entity
    │  │              │         📄Board.java
    │  │              │         📄Comment.java
    │  │              │         📄Like.java
    │  │              │         📄LikeId.java
    │  │              │         📄User.java
    │  │              │
    │  │              ├─📁repository
    │  │              │      📄BatterLineupMapper.java
    │  │              │      📄BatterRecordMapper.java
    │  │              │      📄BoardRepository.java
    │  │              │      📄CommentRepository.java
    │  │              │      📄LikeRepository.java
    │  │              │      📄PitcherLineupMapper.java
    │  │              │      📄PitcherRecordMapper.java
    │  │              │      📄PlayerMapper.java
    │  │              │      📄ScheduleMapper.java
    │  │              │      📄ScoreBoardMapper.java
    │  │              │      📄TeamMapper.java
    │  │              │      📄TeamRankingMapper.java
    │  │              │      📄UserRepository.java
    │  │              │
    │  │              └─📁service
    │  │                     📄BoardService.java
    │  │                     📄CommentService.java
    │  │                     📄CustomUserDetails.java
    │  │                     📄GameResultService.java
    │  │                     📄LikeService.java
    │  │                     📄LineupService.java
    │  │                     📄PlayerService.java
    │  │                     📄RecordService.java
    │  │                     📄ScheduleService.java
    │  │                     📄ScoreBoardService.java
    │  │                     📄TeamRankingService.java
    │  │                     📄TeamService.java
    │  │                     📄UserService.java
    │  │
    │  └─📁resources
    │      │  📄application.properties
    │      │  📄data.sql
    │      │  📄mybatis-config.xml
    │      │
    │      ├─📁mappers
    │      │  ├─📁lineup
    │      │  │      📄BatterLineup.xml
    │      │  │      📄PitcherLineup.xml
    │      │  │
    │      │  ├─📁player
    │      │  │      📄Player.xml
    │      │  │
    │      │  ├─📁record
    │      │  │      📄BatterRecord.xml
    │      │  │      📄PitcherRecord.xml
    │      │  │
    │      │  ├─📁schedule
    │      │  │      📄Schedule.xml
    │      │  │
    │      │  ├─📁scoreBoard
    │      │  │      📄scoreBoard.xml
    │      │  │
    │      │  ├─📁team
    │      │  │      📄Team.xml
    │      │  │
    │      │  └─📁teamRanking
    │      │         📄TeamRanking.xml
    │      │
    │      ├─📁static
    │      │  ├─📁css
    │      │  │  │  📄admin.css
    │      │  │  │  📄board.css
    │      │  │  │  📄boardConditionList.css
    │      │  │  │  📄boardCSS.css
    │      │  │  │  📄boardList.css
    │      │  │  │  📄common.css
    │      │  │  │  📄edit.css
    │      │  │  │  📄gameResult.css
    │      │  │  │  📄header.css
    │      │  │  │  📄index.css
    │      │  │  │  📄mypage.css
    │      │  │  │  📄newBoard.css
    │      │  │  │  📄newBoardCSS.css
    │      │  │  │  └─📁player
    │      │  │  │          📄info.css
    │      │  │  └─📁images
    │      │  │      │  📄fenway_park.jpg
    │      │  │      │  📄logo.png
    │      │  │      │  📄santaclara.jpg
    │      │  │      ├─📁catch-phrase
    │      │  │      │      📄KIA.png
    │      │  │      │      📄KT.png
    │      │  │      │      📄LG.png
    │      │  │      │      📄NC.png
    │      │  │      │      📄SSG.png
    │      │  │      │      📄두산.png
    │      │  │      │      📄롯데.png
    │      │  │      │      📄삼성.png
    │      │  │      │      📄키움.png
    │      │  │      │      📄한화.png
    │      │  │      ├─📁character
    │      │  │      │      📄삼성.jpg
    │      │  │      └─📁emblems
    │      │  │          📄kbo.png
    │      │  │          📄KIA.png
    │      │  │          📄KT.png
    │      │  │          📄LG.png
    │      │  │          📄NC.png
    │      │  │          📄SSG.png
    │      │  │          📄두산.png
    │      │  │          📄롯데.png
    │      │  │          📄삼성.png
    │      │  │          📄키움.PNG
    │      │  │          📄한화.png
    │      │  └─📁js
    │      │         📄board.js
    │      │         📄boardEditor.js
    │      │         📄boardViewer.js
    │      │         📄divClick.js
    │      │         📄index_ajax.js
    │      │         📄user.js
    │      │
    │      └─📁templates
    │          │  📄admin.html
    │          │  📄board.html
    │          │  📄boardConditionList.html
    │          │  📄boardList.html
    │          │  📄edit.html
    │          │  📄gameResult.html
    │          │  📄index.html
    │          │  📄newBoard.html
    │          │  📄record.html
    │          │  📄schedule.html
    │          │
    │          ├─📁fragments
    │          │      📄config.html
    │          │      📄footer.html
    │          │      📄head.html
    │          │      📄header.html
    │          │
    │          ├─📁layout
    │          │      📄layout.html
    │          │
    │          ├─📁player
    │          │      📄info.html
    │          │
    │          ├─📁record
    │          │      📄ranking.html
    │          │
    │          ├─📁schedule
    │          │      📄daily.html
    │          │
    │          ├─📁teamRanking
    │                 📄detail.html
    │
    └─📁test
        └─📁java
            └─📁com
                └─📁estsoft
                    └─📁springproject
                            📄SpringProjectApplicationTests.java
```
