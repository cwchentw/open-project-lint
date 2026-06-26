lint ()
{
    EXIT_STATUS=0
    __project="$1"
    __no_directory=1
    ERROR_MESSAGE=
    for __directory in "$__project"/*; do
        if ! [ -d "$__directory" ]; then continue; fi

        __no_directory=0

        case "$__directory" in
            */bin|*/libexec) ;;
            */lib|*/src) ;;
            */share) ;;
            */examples) ;;
            */docs) ;;
            */tools|*/scripts) ;;
            */node_modules|*/local) ;;
            *)
                ERROR_MESSAGE="$(JOIN "$ERROR_MESSAGE" "Not a recommended directory: $__directory" "\n")"
                EXIT_STATUS=1
                ;;
        esac
    done

    if [ "$EXIT_STATUS" = 1 ]; then
        ERROR_SUMMARY="Not a recommended project structure"
    fi

    if [ "$__no_directory" = 1 ]; then
        ERROR_MESSAGE="Flat project structure"
        ERROR_SUMMARY="Flat project structure"
        EXIT_STATUS=1
    fi
}
