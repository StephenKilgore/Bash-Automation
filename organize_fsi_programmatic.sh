#!/bin/bash

###########################################################################################################################################
# This script organizes FSI course files into unit-based sub folders. Programmatic courses from the public FSI course site are bundled in #
# zip files with no organization. The files come as a mixture of pdf files for every unit with accompanying audio. This script iterates   #
# through the files and sorts them into unit folders based on the lesson number in the file names.                                        #
###########################################################################################################################################

# There are 25 units in each volume, set up for loop with range 1..25
for i in {1..25}; do
    # Units 1-9 are prefixed with a zero, account for that
    if (($i < 10)); then
        FILE_NAME_INT="0$i"
    else
        FILE_NAME_INT="$i"
    fi
    # make a directory for each unit
    mkdir unit$FILE_NAME_INT
    
    # move all files to their appropriate units based on the units in their filename
    mv `find unit$FILE_NAME_INT* -type f` unit$FILE_NAME_INT/

    # The PDF files have a slightly different naming convention, account for them
    mv *$FILE_NAME_INT.pdf unit$FILE_NAME_INT/
done
