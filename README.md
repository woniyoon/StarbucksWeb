# StarbucksWeb
### 2020 Semi Project @ KH 종로

<img src="https://user-images.githubusercontent.com/33106403/92733135-496f9880-f3b2-11ea-9cb1-2f572db87be1.png" alt="project_main" width=900/>

<br><br>

## 목차
- [팀소개](#팀소개)
- [프로젝트 간단 소개](#프로젝트-간단-소개)
- [스택 아키텍처](#스택-아키텍처)
- [ERD/UML](#ERD-UML)
- [NOT NULL팀의 코딩 스타일 가이드라인](#코드-스타일-가이드)
- [구현 기능](#구현-기능)
- [기능 관련 회고](#기능-관련-회고)
- [마무리](#마무리)
___


<br><br>

# 팀소개
팀명 : NOT NULL <br>
팀원 : 곽지원, 김나리, 박보배, 윤재원, 주혜정

<br><br>

# 프로젝트 간단 소개 

개발자 워너비 5명이 힘을 모아 FE부터 BE까지! 🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️🏃‍♀️ 기능도 중요하지만 디자인도 놓치고 싶지 않은 NOT NULL팀. 즐겨마시는 커피☕️, 음료🍹와 관련된 웹사이트를 개발하기로 정하고, 여러 프랜차이즈 카페 사이트를 조사하다가 한국 스타벅스 사이트의 아름다운 디자인과 북미 스타벅스의 온라인 주문 기능이 합쳐져 심미성과 기능성 모두 겸비한 스타벅스 사이트를 만들어보기로 결심!

<br><br>

# 스택 아키텍처

<img alt="stack_architecture" src="https://user-images.githubusercontent.com/33106403/86994439-55d44b00-c1e1-11ea-9889-ccdffdb5c2b0.jpeg">



<br><br><br>


# ERD-UML

### ERD
<img alt="starbucks_web_erd" src="https://user-images.githubusercontent.com/33106403/86535291-440d5200-bf1a-11ea-88ce-00ac4f162b0b.png"> 
<br><br><br>

### UML
<img alt="starbucks_web_uml" src="https://user-images.githubusercontent.com/33106403/86535294-4a9bc980-bf1a-11ea-814c-c243bbec7e0f.jpeg">
<br><br><br>


# 코드 스타일 가이드 
팀프로젝트를 진행하기에 앞서, 코딩 스타일에 대해서 생각해봤습니다. 각자 다른 코딩 스타일을 깃허브를 사용하면서 최소 1번은 충돌은 난 적 있어도, 한 번도 나지 않은 적은 없다! 어차피 날 충돌이면 그 횟수를 최소화시키고자, 우리 팀만의 코딩 스타일을 작성했습니다. 덕분에 프로젝트를 진행하면서 충돌난 횟수가 적었습니다! 자세한 가이드를 보고 싶으면 [이곳](/coding_convention.md)으로 가주세요!

<br>- 참고 페이지 -<br>
[Airbnb JavaScript Style Guide](https://github.com/airbnb/javascript) <br>
[Google HTML/CSS Style Guide](https://google.github.io/styleguide/htmlcssguide.html) <br>
[레진 마크업 가이드](https://github.com/lezhin/markup-guide) <br>


<br><br><br>

# 기능 구현

### 장바구니
<img src="https://user-images.githubusercontent.com/33106403/92733203-60ae8600-f3b2-11ea-85f0-c2721ab8be68.png" alt="장바구니" width=900 />

- CSS의 속성 중 flex에 대해 배워보고 싶어서 적극적으로 사용하였습니다.
- 상단의 내비게이션 메뉴는 현재 페이지의 링크와 동일한 아이템에만 배경과 폰트 스타일을 적용합니다. 사용자는 현재 페이지를 쉽게 알 수 있습니다.
- DB에서 가져온 장바구니는 카드뷰로 보여지며, 아이템에 대한 커스텀을 할 수 있습니다. 오른쪽 상단에 있는 x표를 누르면 삭제됩니다.
- 커스텀 옵션에 따라 카드의 오른쪽 하단에 위치한 품목 가격을 업데이트해줍니다. 커스텀 옵션 가격은 페이지가 로딩될 때 DB에서 불러옵니다.
- 커스텀 완료 후 다음 버튼을 누르면 DB에 있는 장바구니 테이블이 품목 개수만큼 update 됩니다.

<br><br>
<img src="https://user-images.githubusercontent.com/33106403/92733207-62784980-f3b2-11ea-854d-02eff25dc59a.png" alt="결제페이지" width=900 />
- 결제를 진행하기 전 아이템을 선택 결제할 수 있습니다.
- AJAX로 해당 회원의 적립금을 확인 및 사용할 수 있습니다. 
- 결제 버튼을 누르면 결제창으로 넘어가고, 성공적으로 결제했을 때 DB에 insert가 두 번, update가 한 번 일어납니다.
- 첫 번째는 전표 테이블에 전표번호, 유저 아이디, 매장 아이디, 구매일을 insert 합니다.
- 위 과정을 성공적으로 마쳤을 때, 구매 상세 테이블에 품목 아이디, 전표 아이디, 사용자 아이디, 매장 아이디, 가격, 음료/푸드, 구매상세시퀀스를 insert 합니다. 구매한 품목 개수만큼 insert가 발생합니다. 마지막으로 해당 회원의 적립금을 결제 금액의 0.02%만큼 update합니다. 위 과정들이 문제없이 진행됐을 때 결제완료 페이지로 이동합니다.

<br><br>

### 관리자 페이지 
<img src="https://user-images.githubusercontent.com/33106403/92733193-5d1aff00-f3b2-11ea-9e53-9f77c85155f3.png" alt="관리자페이지" width=900 />

- 관리자 페이지에서는 매장/메뉴/회원 목록을 페이징 처리된 게시판 형태로 볼 수 있습니다.
- 매장목록에서는 매장별 매출액을 함께 볼 수 있습니다. 이때 매출액은 sum 그룹 함수를 이용해 가져옵니다.
- 메뉴목록에서는 음료/푸드 별로 등록되어있는 메뉴들을 확인할 수 있습니다.
- 회원목록에서는 정렬기능을 이용할 수 있습니다. 테이블 헤더에 있는 요소를 클릭하면 그 요소를 기준으로 오름차순으로 정렬하여 보여줍니다.


<br><br><br>
# 마무리

  이번 세미 프로젝트는 첫 번째 웹 프로젝트이자 처음으로 팀장을 맡게 된 프로젝트라 의미가 크다. 나 또한 배우는 입장이라 부족한 점이 많았을 텐데 나의 몇 가지 제안사항들을 잘 따라와 줘서 감사했다.
<br>
  1. 5분 스탠드 미팅<br>
세미 프로젝트를 통해 새로운 기술을 배우고, 취업 준비를 하겠지만, 궁극적인 목표는 ‘어떻게 사람들과 일하는지'를 익히는 것이다. 최대한 사람들의 의견을 반영해 파트를 나눴지만, 내 것만 챙기는 게 아니라, 다른 사람의 몫도 내 것처럼 신경 쓰고, 배워갔으면 했다. 이 때문에 매일 프로젝트 시작 전에 5분 스탠드 미팅 시간을 갖자고 제안했다. 이 시간 동안 우리는 각자 어디까지 끝냈고, 무엇을 하고 있고, 어떤 문제가 있는지 간단하게 공유했다. 진행과정 파악하는 데 도움이 됐고, 내가 가진 문제를 겪은 팀원이 있으면 그로부터 해결책 조언을 얻을 수 있어서 시간을 효율적으로 사용할 수 있었다.
  2. 협업툴 적극 사용<br>
이전에 프로젝트 경험이 있어서 몇 가지 협업툴을 사용해본 적이 있었는데, 다른 팀원들도 한번 사용해봤으면 해서 사용해보자고 제안했다. 우리가. 사용한 툴은 Slack과 Trello였다. Trello 보드에서 해야 할 일을 카드로 만들어 일정을 관리하고, Slack에서는 자료 공유, 소스코드 공유, 질문, 회의록 등을 작성하였다. 그러나 두 가지 모두 한글 버전이 없어서인지 사람들이 적용하는 데 어려움이 있었다. 또 카카오톡의 자료 공유 기능이 편리해서 뒤로 갈수록, Trello와 Slack보다 카카오톡 이용도가 높아졌다. Trello는 그래도 직관적인 편이라 다들 곧잘 익혔던 것 같은데, Slack은 상대적으로 학습곡선이 가파른 것 같다. 
  3. gitHub<br>
학습이 오래 걸리기 때문에 처음에는 사용을 고민했지만, 팀원 5명 중 나를 포함해 3명이 git을 사용해본 적이 있어서 시도했다. gitHub에 그나마. 제일 익숙한 내가 2시간 정도 미니 튜토리얼 시간을 가졌다. 나는 terminal을 이용해 git을 이용했는데, 경험 있는 두 사람은 github desktop이나 이클립스에서 제공하는 GUI 방식이 익숙해서 튜토리얼이 좀 더 오래 걸렸다. 그리고 모두 통일해서 github desktop을 사용하기로 했다. Gui 방식은 처음 이용해보는데, 확실히 그래픽으로 보니까 편하긴 했으나, 익숙하지 않아서 사람들이 물어볼 때마다 같이 검색하곤 했다.  이클립스 프로젝트를 만들고 원격 저장소에 올리는 게 어려워서 걱정을 많이 했으나, 사람들이 매번 조심스럽게 git을 사용해서인지 다른 조처럼 코드가 다 날아가는 것과 같은 큰 문제는 생기지 않았다.
<br>
  프로젝트 중 가장 아쉬웠던 점은 DB설계이다. 조별 회의와 강사님의 조언을 거쳐 음료/푸드 테이블을 따로 나누고, 이 두 테이블의 아이디 값이 영양 테이블의 아이디를 참조하는 것으로 설계했다. 후에 음료/푸드 아이디만으로는 어느 테이블에 가서 정보를 가져와야 할지 알 수 없다는 단점을 발견했다. 마침 음료/푸드 아이디가 d/f로 시작해서 첫 번째 글자만 substring으로 가져와 select 해야 하는 테이블을 정했다. 방법이 좋지 않았지만 프로젝트 마감일이 얼마 남지 않아 DB를 다시 설계하기엔 무리가 있었다. 돌이켜 생각해보면 음료/푸드를 모두 한 테이블에 저장하고, 컬럼으로 분류하면 더 좋았을 것 같다. 장바구니에서 커스텀하는 기능이 가장 힘들고, 시간이 많이 든 부분이었다. 사실 품목마다 커스텀할 수 있는 부분이 다른데, 이때도 이미 테이블 구조를 바꾸기에 너무 늦어서, 스타벅스의 커스텀 기능처럼 섬세하지 못해서 아쉬웠다. 또 아이템 개수만큼 커스텀이 생겨서 이를 controller로 전달하는 과정이 복잡하게 구현됐다. 실제 스타벅스에서는 커스텀을 어떻게 구현했는지 매우 궁금하다.
<br>
  이번 프로젝트는 모두가 처음이라, 강사님이 가르쳐주신 걸 최대한 활용하는 방향으로 진행했으나, 기회가 되면 파이널 때는 배운 거 외의 기술을 사용해보고 싶다. 기능 구현이 계획처럼 잘 되지 못해서 팀원들에게 미안하고, 아쉬운 마음이 커서 발표날까지 기분이 좋지 않았는데, 다들 우리 팀의 결과물과 협업도를 높이 평가한 것인지 투표 결과 네 팀중 2등이라는 결실을 이루어서 기쁜 마음으로 마무리할 수 있었다. 덧붙여 우리가 프로젝트를 진행한 방식이 틀리지 않았구나 싶어 다음 프로젝트는 더 자신 있게 임할 수 있을 것 같다.
