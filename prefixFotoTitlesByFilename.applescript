tell application "Photos"
	activate
	set imageSel to (get selection)
	set currentfilename to ""
	if imageSel is {} then
		error "Please select an image."
	else
		repeat with im in imageSel
			
			tell media item im
				set newtitle to the filename of im
				set oldtitle to the name of im
				if (exists (oldtitle)) then
					set newtitle to newtitle & " - " & oldtitle
				end if
				set the name of im to newtitle
			end tell
		end repeat
	end if
	return currentfilename
end tell