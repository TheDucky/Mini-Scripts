#! /bin/bash

dbusPauseTrack() {
	dbus-send \
    --print-reply \
    --dest=org.mpris.MediaPlayer2.spotify \
    /org/mpris/MediaPlayer2 \
    org.mpris.MediaPlayer2.Player.PlayPause
}

TIME=$(whiptail --title "Spotify Sleep Timer" \
		--radiolist "Choose sleep time:" 20 60 8 \
		"5 mins"  "      " OFF \
		"10 mins" "      " OFF \
		"15 mins" "      " OFF \
		"30 mins" "      " OFF \
		"1 hour"  "      " OFF 3>&1 1>&2 2>&3)

if [[ $TIME == "5 mins" ]]; then
	TIMEINSECONDS=300
elif [[ $TIME == "10 mins" ]]; then
	TIMEINSECONDS=600
elif [[ $TIME == "15 mins" ]]; then
	TIMEINSECONDS=900
elif [[ $TIME == "30 mins" ]]; then
	TIMEINSECONDS=1800
elif [[ $TIME == "1 hour" ]]; then
	TIMEINSECONDS=3600
else
	exit 1
fi

STARTTIME=$TIMEINSECONDS

{
	while [[ $TIMEINSECONDS -gt 0 ]]; do
		sleep 1
		TIMEINSECONDS=$(($TIMEINSECONDS-1))
		ELAPSEDPERCENTAGE=$((100*$TIMEINSECONDS/$STARTTIME))
		echo $ELAPSEDPERCENTAGE
	done
} | whiptail --title "Spotify Sleep Timer" --gauge "Sleep Timer set to $TIME" 8 60 0

dbusPauseTrack > /dev/null 2>&1

whiptail --title "Spotify Sleep Timer" --msgbox "Sleep tight ^_^" 8 60