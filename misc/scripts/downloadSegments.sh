SEGMENTS_URL=https://brouter.de/brouter/segments4/ # https://bikerouter.de/segments/
LAT_FROM=0
LAT_TO=10
LON_FROM=0
LON_TO=10

cd segments4

for lat in `seq $LAT_FROM 5 $LAT_TO`
  for lon in `seq $LON_FROM 5 $LON_TO`
  do
    # -175 - 180
    # -90 - 85
    if (($lat < -175 || $lat > 180 || $lon < -90 || $lon > 85)) then
      continue
    fi

    if (($lat < 0)); then
      LAT_PRE=S
    else
      LAT_PRE=N
    fi

    if (($lon < 0)); then
      LON_PRE=W
    else
      LON_PRE=E
    fi
    LAT_ABS=${lat#-}
    LON_ABS=${lon#-}



#    echo "lat: $LAT_PRE $LAT_ABS, lon" $LON_PRE $LON_ABS
    MY_MESSAGE="$SEGMENTS_URL${LON_PRE}${LON_ABS}_${LAT_PRE}${LAT_ABS}.rd5"
    echo $MY_MESSAGE
    curl -O $MY_MESSAGE
  done


#E175 - W180
#S90 - N85

