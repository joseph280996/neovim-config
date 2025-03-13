#!/usr/bin/fish
# This script is used to let the SumatraPDF open the pdf after path conversion

# Create arguments array
set new_arg
set idxMntOccur 0

for arg in $argv
    echo arg
    if string match -q "/mnt*" "$arg"
        # Convert to windows style path
        set idxMntOccur (math $idxMntOccur + 1)
        set winPath (wslpath -m $arg)
        set -a new_arg $winPath
        
        if test $idxMntOccur -eq 1
            # Convert the path in .syntex to windows style
            # Run only when "/mnt/d" like path is detected
            find $PWD -maxdepth 1 -name "*.synctex.gz" -execdir \
                bash -c 'cat "{}" | gunzip | sed --expression="s@/mnt/\(.\)/@\1:/@g" | gzip > "{}.tmp" && mv "{}.tmp" "{}"' \;
        end
    else
        set -a new_arg $arg
    end
end

sumatrapdf.exe $new_arg
