lint ()
{
    ERROR_SUMMARY=
    ERROR_MESSAGE=
    EXIT_STATUS=0

    __project="$1"
    for __directory in "$__project"/*; do
        if ! [ -d "$__directory" ]; then continue; fi

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
}
