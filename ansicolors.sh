#!/bin/sh

ansicolors() {
	local noerror=false
	local printf=printf
	local fmt=''
	while [ $# -gt 0 ]; do
		case "$1" in
			('%{'*'}') ;;
			(*) printf '%s' "$1"; shift; continue ;;
		esac

		local list="${1#%{}"; list="${list%\}}"		# Remove the prefix '%{' and suffix '}'
		local codes=''
		local trailing=''
		local bg=false hi=false				# Background and High Intensity
		local fgc=''					# Foreground color code
		local bgc=''					# Background color code
		local s0='' s1='' s2='' s3='' s4='' s5='' s6=''	# all Styles
			
		IFS="${IFS}+_"					# Split the list using spaces or '+' separators
		for x in $list; do
			local c=''				# tmp color code
			case "$x" in
				('raw')		fmt='%s' ;;
				('eval')	fmt=''   ;;

				('color=no'|'color=never')	printf=':'	;;
				('color=yes'|'color=always')	printf='printf' ;;
				('color=auto'|'color')
					[ -t 1 ] && printf='printf' || printf=':'
				;;

				('noerror')		noerror=true ;;
				('error')		noerror=false ;;

				('bg')			bg=true ;;
				('hi')			hi=true ;;

				('black')		c=30	;;
				('red')			c=31	;;
				('green')		c=32	;;
				('yellow')		c=33	;;
				('blue')		c=34	;;
				('purple')		c=35	;;
				('cyan')		c=36	;;
				('white')		c=37	;;

			#	('none')		exit 1		;;
			#	('reset')		codes='0' ; break ;;
				('-'|''|'normal')	s0=true		;;
				('default')		s0=true		;;
				('b'|'bold')		s1=true		;;
				('s1')			s1=true		;;
				('s2')			s2=true		;;
				('s3')			s3=true		;;
				('u'|'underline')	s4=true	;;
				('s4')			s4=true		;;
				('s5')			s5=true		;;
				('s6')			s6=true		;;
				('lf'|'\n')		trailing='\n'	;;
				('cr'|'\r')		trailing='\r'	;;
				('crlf'|'\r\n')		trailing='\r\n' ;;
				(*)
					if ${noerror:-false}; then
						continue
					fi
					echo >&2 "ERROR: instruction not supported: $x"
					return 1
				;;
			esac
			if [ -n "$c" ]; then
				# Regular                   = color       [30-37]
				# Background                = color+10    [40-47]
				# High Intensity            = color+60    [90-97]
				# Background High Intensity = color+60+10 [100-107]
				if ${hi}; then
					c=$(( $c + 60 ))
				fi
				if $bg; then
					bgc="$(( $c + 10 ))"
				else
					fgc="$c"
				fi
				bg=false
				hi=false
				c=''
			fi
		done
		if [ -z "$codes" ]; then # if codes exists use it as is (useful to force a returned code value)
			codes="${s0:+;0}${s1:+;1}${s2:+;2}${s3:+;3}${s4:+;4}${s5:+;5}${s6:+;6}${fgc:+;$fgc}${bgc:+;$bgc}" # got something like ';0;1;4;37;43'
			codes="${codes#;}" # remove the first ';' and got '0;1;4;37;43'
		fi
		if [ -n "$codes" ]; then
			$printf $fmt '\033['"$codes"'m'
		fi
		if [ -n "$trailing" ]; then
			$printf $fmt "$trailing"
		fi
		shift
	done
}
ansicolors "$@"
