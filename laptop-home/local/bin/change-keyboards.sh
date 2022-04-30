current_keyboard=$(setxkbmap -query | grep layout | xargs)

if [[ $current_keyboard == "layout: us,ru" ]]; then
	$(setxkbmap -model pc105 -layout am -variant phonetic-alt)
else
	$(setxkbmap -model pc105 -layout us,ru -option grp:win_space_toggle)
fi
