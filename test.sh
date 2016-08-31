#!/bin/sh

ansicolors() {
	./ansicolors.sh "$@"
}

#ansicolors %{raw} '%{red bold}' ;echo
#ansicolors %{color=yes} %{hi+red+bold} hello %{default} ' ' %{_+yellow} world %{LF}
#ansicolors %{u+red} toto1234 ;echo
#echo '               '
#ansicolors %{regular+red} toto1234 ;echo

ansicolors '%{s1+s2+bg+hi+red}' hello '%{}' ' ' %{blue} world %{eval} %{LF}
echo


exit 0

echo	ansicolors "%{RED}" "hello" "%{DEFAULT}" ' ' "%{BG_Blue}" wor "%{HI_BG_Blue}" ld "%{DEFAULT}" %{LF}
	ansicolors "%{RED}" "hello" "%{DEFAULT}" ' ' "%{BG_Blue}" wor "%{HI_BG_Blue}" ld "%{DEFAULT}" %{LF}

#echo	ansicolors %{raw} %{RED} hello %{DEFAULT} ' ' %{BG_Blue} wor %{HI_BG_Blue} ld %{DEFAULT} %{eval} %{LF}
#	printf "$(ansicolors %{raw} %{RED} hello %{DEFAULT} ' ' %{BG_Blue} wor %{HI_BG_Blue} ld %{DEFAULT} %{LF})"

ansicolors %{U_Yellow} U_Yellow %{DEFAULT} ' ' %{u_yellow} u_yellow %{DEFAULT} %{LF}

ansicolors %{color=no} %{U_Yellow} U_Yellow %{DEFAULT} ' ' %{u_yellow} u_yellow %{DEFAULT} %{LF}

#ansicolors_line '%{red}bb%{-} %{bg_blue}dd%%%{-}%{lf}'       

