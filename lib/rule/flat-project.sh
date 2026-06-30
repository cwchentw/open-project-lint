lint ()
{
    EXIT_STATUS=0
    __project="$1"
    __no_directory=1
    for __directory in "$__project"/*; do
        if ! [ -d "$__directory" ]; then continue; fi

        __no_directory=0
        break
    done

    if [ "$__no_directory" = 1 ]; then
        ERROR_MESSAGE="Flat project structure"
        ERROR_SUMMARY="Flat project structure"
        EXIT_STATUS=1
    fi
}
