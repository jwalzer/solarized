#!/bin/bash


cat << EOT
!
! Modified Xresources that mixes Default Xterm-colors with solarized
!
!   mixing with $(( $1 / 10 ))%
!
! Solarized color scheme for the X Window System
!
! http://ethanschoonover.com/solarized


EOT


grep '#' color.table | \
	while read NAME SCOL _x _cn _xtn OC R
		do
			MCOL="$(./color_calc.bash "${SCOL#\#}" "${OC#\#}" "$1")"
			echo "$NAME: $SCOL: $OC -> #$MCOL" > /dev/stderr
			echo "#define S_${NAME} #${MCOL}"
		done


cat << EOT


! To only apply colors to your terminal, for example, prefix
! the color assignment statement with its name. Example:
!
! URxvt*background:            S_base03

*background:              S_base02
*foreground:              S_base0
*fading:                  40
*fadeColor:               S_base03
*cursorColor:             S_base1
*pointerColorBackground:  S_base01
*pointerColorForeground:  S_base1
*borderColor:			  S_base03
*scrollColor:			  S_base0
*troughColor:			  S_base02
*tintColor:				  S_base02


*cursorBlink:			  True
*cursorUnderline:		  True
*transparent:			  True
*blurRadius:			  128x1


*color0:                  S_base02
*color1:                  S_red
*color2:                  S_green
*color3:                  S_yellow
*color4:                  S_blue
*color5:                  S_magenta
*color6:                  S_cyan
*color7:                  S_base2
*color9:                  S_orange
*color8:                  S_base03
*color10:                 S_base01
*color11:                 S_base00
*color12:                 S_base0
*color13:                 S_violet
*color14:                 S_base1
*color15:                 S_base3

EOT