# 2조 NOT_NULL 

- 세상에 다양한 사람들이 있는 만큼 코드를 쓰는 방식도 다양합니다. 누군가는 들여쓰기는 tab키, 속성값은 작은 따옴표('')를 사용하지만, 누군가는 space키로 들여쓰고 큰 따옴표("")로 속성값을 줄 수 있습니다. 이 중에 정답은 없습니다. 그러나 다른 코딩 스타일은 팀 프로젝트를 할 때 지장을 줄 수 있습니다. 팀프로젝트인 이상 우리 모두 서로의 코드를 읽고 수정해야하는데, 각기 다른 방식으로 코드를 짰다면 통일성을 잃고 가독성이 떨어지기 때문에 하기 싫어지기 때문입니다.(ㅋㅋㅋ) 다음의 코드를 한 번 봐주세요.


*** 1번 예시 ***

```CSS
    b#a {position: fixed; bottom: 150px; right: 50px; width: 80px; height: 80px;background-color: green; border-radius: 40%; font-size: 15pt; color: white; border-style: none; box-shadow: 0 8px 16px 0 #0000005a, 0 6px 20px 0 rgba(0, 0, 0, 0.337); transition: opacity 0.1s ease-in-out;
}
``` 

- 혹시 이 코드를 한 번에 이해하셨나요? 그렇다고 하시면 할 말은 없네요... 저는 첫 줄부터 읽기를 포기했습니다 ^^
저처럼 이해못하신 분들을 위해 위의 코드를 보기 쉽게 바꿔보겠습니다.

*** 2번 예시 ***

```CSS
    button#add {
        position: fixed;
        bottom: 150px;
        right: 50px;
        width: 80px;
        height: 80px;
        background-color: green;
        border-radius: 40%;
        font-size: 15pt;
        color: white;
        border-style: none;
        box-shadow: 0 8px 16px 0 #0000005a, 0 6px 20px 0 rgba(0, 0, 0, 0.337);
        transition: opacity 0.1s ease-in-out;
}
```

- 한결 보기 편하죠? css스타일이 어떤 요소를 위한 스타일 값이고, 어떤 속성과 값들을 가지고 있는지 쉽게 파악할 수 있습니다. 위의 코드는 아이템을 추가하기 위한 용도의 버튼으로, add라는 아이디값을 가집니다. 코드를 실행하면 오른쪽 하단에 쉐도우가 있으며, 모서리가 둥근 초록색 버튼을 만들어줍니다. 여러분의 팀원들의 코드를 검토하고 수정해야하는데, 파일을 열자마자 1번 예시처럼 작성되있다고 상상해보세요. 너무 끔찍하죠? 그런 상황을 기피하기 위해서 개발팀원들은 합의하여 코드 스타일을 정합니다. 그런 이유로 저희 NOT NULL팀을 위한 코드 스타일(주로 문법 위주) 가이드를 레진마크업에 기반하며 정해보겠습니다.

- 아래는 각각 에어비앤비/구글/레진에서 작성한 코드 스타일 가이드입니다. 참고로 레진 마크업 가이드만 한글로 작성되있지만, 전세계 개발자들의 만국공통어인 프로그래밍 언어이므로 영문 사이트도 문제없이 읽을 수 있으니 심심하면 한 번 보는 걸 추천드립니다.

[Airbnb JavaScript Style Guide](https://github.com/airbnb/javascript)
[Google HTML/CSS Style Guide](https://google.github.io/styleguide/htmlcssguide.html)
[레진 마크업 가이드](https://github.com/lezhin/markup-guide/blob/master/README.md#basic)

## HTML

1. 들여쓰기는 공백문자 4자(=tab키)로 합니다.

```HTML
<!-- Bad HTML -->
<body>
  <header></header>
</body>

<!-- Good HTML -->
<body>
    <header></header>
</body>
```

2. 단일 태그에서는 슬래시(/)를 사용하지 않습니다.
3. 속성값에는 큰 따옴표("")를 사용합니다.

```HTML
<!-- Bad HTML -->
<body>
    <div>
        <img src='logo.png' alt='this is a logo'>
        <h1 class='hello-world'>Hello, world!</h1>
    </div>
</body>

<!-- Good HTML -->
<body>
    <div>
        <img src="logo.png" alt="this is a logo">
        <h1 class="hello-world">Hello, world!</h1>
    </div>
</body>
```

HTML 태그 속성은 가독성을 위해 아래 순서대로 작성합니다.

4. 선택자로 사용하는 class, id 속성은 가장 앞에 선언합니다.
5. 콘텐츠를 설명하는 alt, title, role, aria-* 속성은 가장 뒤에 선언합니다.

```HTML
<a class="..." id="..." href="#">Example link</a>
<input class="form-control" type="text">
<img src="..." alt="..." title="...">
```

6. 가급적 div 태그 사용을 자제하고, 의미있는 태그(= semantic tag)를 사용합니다.

```HTML
<!-- Bad HTML -->
<body>
    <h1>동물</h1>
    <div>
        <h1>포유류</h1>
        <div>
            <h1>고래</h1>
        </div>
    </div>
</body>

<!-- Good HTML -->
<body>
    <h1>동물<h1>
    <article>
        <h2>포유류<h2>
        <section>
            <h3>고래<h3>
        </section>
    </article>
</body>

<!-- Bad HTML -->
<div onclick="goToRecommendations();">All recommendations</div>

<!-- Good HTML -->
<a href="recommendations/">All recommendations</a>
```

7. 속성값이 많으면 한 줄로 쓰지 않습니다.

```HTML
<!-- Bad HTML -->
<md-progress-circular md-mode="indeterminate" class="md-accent" ng-show="ctrl.loading" md-diameter="35">
</md-progress-circular>

<!-- Good HTML -->
<md-progress-circular
    md-mode="indeterminate"
    class="md-accent"
    ng-show="ctrl.loading"
    md-diameter="35">
</md-progress-circular>
```


## CSS

1. 들여쓰기는 tab키를 사용합니다.

```css
{
    property: value;
    property: value;
}  
```

2. 선택자를 그룹핑하는 경우 콤마뒤에서 줄바꿈합니다.

```css
/* X */
.selector1, .selector2 { ... }

/* O */
.selector1,
.selector2 { ... }
```

3. 속성값을 줄 때 큰 따옴표("")를 사용합니다.

```css
/* X */
{ background: url('ex.png'); }

/* O */
{ background: url("ex.png"); }
```

4. 속성이 하나든 하나 이상이든 언제나 줄바꿈을 합니다.

```css
/* X */
.selector {property: value;}

/* O */
.selector {
    property: value;
}

.selector2 {
    property: value;
    property: value;
}
```

5. 속성명과 속성값 사이에 띄어쓰기를 합니다.

```CSS
/* X */
h3 {
    font-weight:bold;
}

/* O */
h3 {
    font-weight: bold;
}
```

6. CSS 스타일은 가급적 HTML 태그가 있는 순서대로 주도록 하고, 레이아웃 태그에 대한 속성들 단위로 주석을 써줍니다.

```CSS
/* X */
footer {
    property: value;
}
header {
    property: value;
}
title {
    property: value;
}
body {
    property: value;
}
header > nav_menu {
    property: value;
}

/* O */

header {
    property: value;
}
header > nav_menu {
    property: value;
}                           /* 헤더 끝 */
body {
    property: value;
}
title {
    property: value;
}                           /* 바디 끝 */
footer {
    property: value;
}                           /* 푸터 끝 */
```

7. 속성 선언 순서는 포지션 → 박스모델 → 폰트 → 배경 → 보더 → 기타 순으로 합니다.

```CSS
{
/* Positioning */
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 100;
/* Box-model */
    display: block;
    float: right;
    flex: 1;
    width: 100px;
    height: 100px;
/* Typography */
    font: normal 13px "Helvetica Neue", sans-serif;
    line-height: 1.5;
    color: #333;
    text-align: center;
/* Background */
    background-color: #f5f5f5;
/* Border */
    border: 1px solid #e5e5e5;
    border-radius: 3px;
/* etc */
    opacity: 1;
}
```

8. 타입 선택자를 같이 표기해줍니다.

```CSS
/* X */
.tweet { ... }
.tweet_header,

/* O */
section.tweet > header { ... }
section.tweet > header.tweet_header { ... }
```

9. 클래스 이름은 영문 소문자, 숫자, 언더스코어(_)만 사용합니다.
짧고 간결하게 작성하되 축약하지 않습니다. .btn과 같이 쉽게 의미를 유추 할 수 있는 축약은 괜찮지만 .bn와 같이 의미를 파악하기 어려운 축약은 사용하지 않습니다. 시각적 표현 대신 의미, 구조, 목적을 담아 작명합니다.

```CSS
button.block_name { ... } 
div.block_name2 { ... }
```

10. 약식 속성을 최대한 활용한다.

```CSS
/* X */
div {
    margin-top: -10px;
    margin-left: 10px;
    padding-top: 5px;
    padding-right: 10px;
    padding-bottom: 20px;
    padding-left: 10px;
}

/* O */
div {
    margin: -10px 0 0 10px;
    padding: 5px 10px 20px;
}

```