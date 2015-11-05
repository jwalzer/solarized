#!/bin/bash
if [ -z "$3" ]
	then
		cat << EOT

$0 SRC DST MIX
  mix 2 colors, given as hex values

  SRC - Source-Color
  DST - Dest-Color
  MIX - Mix-Value (Default Range is 0-1000: 0 -> SRC, 1000 -> DST)

  does not do any boundary-checks!
EOT
	exit
fi

S="$1";
D="$2";
F="$3";

NUM="$((\
			((((( ( 16#$S >> 16 ) % 256 ) * ( 1000 - $F )) + (( (16#$D >> 16) % 256) *  $F )) / 1000) << 16 ) \
		+	((((( ( 16#$S >>  8 ) % 256 ) * ( 1000 - $F )) + (( (16#$D >>  8) % 256) *  $F )) / 1000) <<  8 ) \
		+	((((( ( 16#$S >>  0 ) % 256 ) * ( 1000 - $F )) + (( (16#$D >>  0) % 256) *  $F )) / 1000) <<  0 )  \
		))"

OUT="$(printf "%0.6x" $NUM)"

echo "$OUT"