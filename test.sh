#!/bin/sh

ansicolors() {
	./ansicolors.sh "$@"
}

echo	ansicolors "%{RED}" "hello" "%{DEFAULT}" ' ' "%{BG_Blue}" wor "%{HI_BG_Blue}" ld "%{DEFAULT}" %{LF}
	ansicolors "%{RED}" "hello" "%{DEFAULT}" ' ' "%{BG_Blue}" wor "%{HI_BG_Blue}" ld "%{DEFAULT}" %{LF}

#echo	ansicolors %{raw} %{RED} hello %{DEFAULT} ' ' %{BG_Blue} wor %{HI_BG_Blue} ld %{DEFAULT} %{eval} %{LF}
#	printf "$(ansicolors %{raw} %{RED} hello %{DEFAULT} ' ' %{BG_Blue} wor %{HI_BG_Blue} ld %{DEFAULT} %{LF})"

ansicolors %{U_Yellow} U_Yellow %{DEFAULT} ' ' %{u_yellow} u_yellow %{DEFAULT} %{LF}
