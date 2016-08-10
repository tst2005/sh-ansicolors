#!/bin/sh

ansicolors() {
	local printf=printf
	while [ $# -gt 0 ]; do

		case "$1" in
		('%{raw}')		printf='printf %s'	;;
		('%{eval}')		printf='printf'		;;

		('%{NONE}')		printf ''		;;
		('%{BLACK}')		$printf '\033[0;30m'	;;
		('%{RED}')		$printf '\033[0;31m'	;;
		('%{GREEN}')		$printf '\033[0;32m'	;;
		('%{BROWN}')		$printf '\033[0;33m'	;;
		('%{BLUE}')		$printf '\033[0;34m'	;;
		('%{PURPLE}')		$printf '\033[0;35m'	;;
		('%{CYAN}')		$printf '\033[0;36m'	;;
		('%{LIGHT_GREY}')	$printf '\033[0;37m'	;;

		('%{DARK_GREY}')	$printf '\033[1;30m'	;;
		('%{LIGHT_RED}')	$printf '\033[1;31m'	;;

		('%{LIGHT_GREEN}')	$printf '\033[32m'	;;
		('%{YELLOW}')		$printf '\033[33m'	;;

		('%{LIGHT_GREY_BG_YELLOW}')	$printf '\033[43;30m'	;;

		('%{LIGHT_BLUE}')	$printf '\033[34m'	;;
		('%{LIGHT_PURPLE}')	$printf '\033[35m'	;;
		('%{LIGHT_CYAN}')	$printf '\033[36m'	;;
		('%{WHITE}')		$printf '\033[37m'	;;
		('%{DEFAULT}')		$printf '\033[0m'	;;

	# Reset
		('%{Color_Off}')	$printf '\033[0m'	;;

	# Regular Colors = 0
		('%{Black}')		$printf '\033[0;30m'	;;
		('%{Red}')		$printf '\033[0;31m'	;;
		('%{Green}')		$printf '\033[0;32m'	;;
		('%{Yellow}')		$printf '\033[0;33m'	;;
		('%{Blue}')		$printf '\033[0;34m'	;;
		('%{Purple}')		$printf '\033[0;35m'	;;
		('%{Cyan}')		$printf '\033[0;36m'	;;
		('%{White}')		$printf '\033[0;37m'	;;

	# Bold = 1
		('%{B_Black}')	$printf '\033[1;30m'	;;
		('%{B_Red}')	$printf '\033[1;31m'	;;
		('%{B_Green}')	$printf '\033[1;32m'	;;
		('%{B_Yellow}')	$printf '\033[1;33m'	;;
		('%{B_Blue}')	$printf '\033[1;34m'	;;
		('%{B_Purple}')	$printf '\033[1;35m'	;;
		('%{B_Cyan}')	$printf '\033[1;36m'	;;
		('%{B_White}')	$printf '\033[1;37m'	;;

	# Underline = 4
		('%{U_Black}')	$printf '\033[4;30m'	;;
		('%{U_Red}')	$printf '\033[4;31m'	;;
		('%{U_Green}')	$printf '\033[4;32m'	;;
		('%{U_Yellow}')	$printf '\033[4;33m'	;;

		('%{u_yellow}') $printf '\033[33;4m'    ;;

		('%{U_Blue}')	$printf '\033[4;34m'	;;
		('%{U_Purple}')	$printf '\033[4;35m'	;;
		('%{U_Cyan}')	$printf '\033[4;36m'	;;
		('%{U_White}')	$printf '\033[4;37m'	;;

	# Background = color+10
		('%{BG_Black}')	$printf '\033[40m'	;;
		('%{BG_Red}')	$printf '\033[41m'	;;
		('%{BG_Green}')	$printf '\033[42m'	;;
		('%{BG_Yellow}')	$printf '\033[43m'	;;
		('%{BG_Blue}')	$printf '\033[44m'	;;
		('%{BG_Purple}')	$printf '\033[45m'	;;
		('%{BG_Cyan}')	$printf '\033[46m'	;;
		('%{BG_White}')	$printf '\033[47m'	;;

	# Background Bold
		('%{BG_B_Black}')	$printf '\033[1;40m'	;;
		('%{BG_B_Red}')	$printf '\033[1;41m'	;;
		('%{BG_B_Green}')	$printf '\033[1;1;42m'	;;
		('%{BG_B_Yellow}')	$printf '\033[1;43m'	;;
		('%{BG_B_Blue}')	$printf '\033[1;44m'	;;
		('%{BG_B_Purple}')	$printf '\033[1;45m'	;;
		('%{BG_B_Cyan}')	$printf '\033[1;46m'	;;
		('%{BG_B_White}')	$printf '\033[1;47m'	;;

	# High Intensity = color+60
		('%{HI_Black}')	$printf '\033[0;90m'	;;
		('%{HI_Red}')	$printf '\033[0;91m'	;;
		('%{HI_Green}')	$printf '\033[0;92m'	;;
		('%{HI_Yellow}')	$printf '\033[0;93m'	;;
		('%{HI_Blue}')	$printf '\033[0;94m'	;;
		('%{HI_Purple}')	$printf '\033[0;95m'	;;
		('%{HI_Cyan}')	$printf '\033[0;96m'	;;
		('%{HI_White}')	$printf '\033[0;97m'	;;

	# Bold High Intensity
		('%{HI_B_Black}')	$printf '\033[1;90m'	;;
		('%{HI_B_Red}')	$printf '\033[1;91m'	;;
		('%{HI_B_Green}')	$printf '\033[1;92m'	;;
		('%{HI_B_Yellow}')	$printf '\033[1;93m'	;;
		('%{HI_B_Blue}')	$printf '\033[1;94m'	;;
		('%{HI_B_Purple}')	$printf '\033[1;95m'	;;
		('%{HI_B_Cyan}')	$printf '\033[1;96m'	;;
		('%{HI_B_White}')	$printf '\033[1;97m'	;;

	# High Intensity backgrounds = bg+60
		('%{HI_BG_Black}')	$printf '\033[0;100m'	;;
		('%{HI_BG_Red}')	$printf '\033[0;101m'	;;
		('%{HI_BG_Green}')	$printf '\033[0;102m'	;;
		('%{HI_BG_Yellow}')	$printf '\033[0;103m'	;;
		('%{HI_BG_Blue}')	$printf '\033[0;104m'	;;
		('%{HI_BG_Purple}')	$printf '\033[0;105m'	;;
		('%{HI_BG_Cyan}')	$printf '\033[0;106m'	;;
		('%{HI_BG_White}')	$printf '\033[0;107m'	;;

	# High Intensity Bold backgrounds
		('%{HI_BG_B_Black}')	$printf '\033[1;100m'	;;
		('%{HI_BG_B_Red}')	$printf '\033[1;101m'	;;
		('%{HI_BG_B_Green}')	$printf '\033[1;102m'	;;
		('%{HI_BG_B_Yellow}')	$printf '\033[1;103m'	;;
		('%{HI_BG_B_Blue}')	$printf '\033[1;104m'	;;
		('%{HI_BG_B_Purple}')	$printf '\033[1;105m'	;;
		('%{HI_BG_B_Cyan}')	$printf '\033[1;106m'	;;
		('%{HI_BG_B_White}')	$printf '\033[1;107m'	;;

		('%{LF}')		$printf '\n'	;;
		('%{CRLF}')		$printf '\r\n'	;;
		('%{CR}')		$printf '\r'	;;

		('%{'*'}')		echo >&2 "ERROR: syntax error: $1" ; return 1 ;;
		(*)		printf '%s' "$1"	;;
		esac
		shift
	done
}
ansicolors "$@"
