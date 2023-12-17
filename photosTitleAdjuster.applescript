tell application "Photos"
    -- step-by-step plan for the updated AppleScript:
        --Start the AppleScript.
        -- Define variables for the old prefix, new prefix, suffix, minimum number, maximum number, and subtract value for easy adjustability.
        -- Tell the Photos application to get the selection of photos.
        -- Loop through each photo in the selection.
        -- Get the filename of the current photo.
        -- Check if the filename starts with the old prefix.
        -- If the filename starts with the old prefix, extract the number part from the filename. The number part is the text between the old prefix and the suffix.
        -- Convert the extracted number part to an integer.
        -- Check if the number is within the defined minimum and maximum range.
        -- If the number is within the range, subtract the defined subtract value from the number.
        -- Format the subtracted number to always have 4 digits.
        -- Construct a new title with the new prefix, the formatted number, and the suffix.
        -- Set the title of the current photo to the new title.
        -- Log a message indicating that the title of the photo has been changed, showing the old filename and the new title.
        -- End the loop.
        -- End the AppleScript.

    -- Define variables for easy adjustability
    set oldPrefix to "Hochzeit_Denise&amp;Andreas-"
    set newPrefix to "NewPrefix-"
    set suffix to ".jpg"
    set minNumber to 684
    set maxNumber to 1049
    set subtractValue to 683

    set selectedPhotos to selection
    repeat with aPhoto in selectedPhotos
        set oldFilename to the filename of aPhoto
        if oldFilename starts with oldPrefix then
            set numberPart to text ((length of oldPrefix) + 1) thru -((length of suffix) + 1) of oldFilename as integer
            if numberPart ³ minNumber and numberPart ² maxNumber then
                set newNumber to numberPart - subtractValue
                set formattedNumber to text -4 thru -1 of ("0000" & newNumber) -- format the number to have 4 digits
                set newTitle to newPrefix & formattedNumber & suffix
                set the name of aPhoto to newTitle
                log "Changed title of photo from " & oldFilename & " to " & newTitle
            end if
        end if
    end repeat
end tell