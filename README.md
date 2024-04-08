
# 일사만루 - 프로야구 커뮤니티 

### 목차
- [프로젝트 소개](#프로젝트-소개)
- [프로젝트 목표](#프로젝트-목표)
- [프로젝트 진행기간](#프로젝트-진행-기간)

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
