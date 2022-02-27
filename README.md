# vim plug

나만 쓰는 vim plugin 만들기

Plugfile 이 deprecated 되어 있는데 로컬로 쓰기엔 좋은 기능이다.
이 패키지만 추가로 로드하여 설정파일을 한 곳에서 관리하도록 하자.

## Prerequisite

install junegunn/vim-plug

## 확장 방법

Plugfile 내용 COPY

.vimrc
```vim
call plug#begin()

<PASTE Plugfile>

Plug 'mygithub/repository'

call plug#end()
```

## 설치

```
:PlugInstall
```

사실 종속성관리하는 것보다 플러그인은 직접 알고 쓰는게 중요하니 인정
근데 configuration 은 버전관리를 했으면 하고 분리했으면 좋겠어서 만듬
