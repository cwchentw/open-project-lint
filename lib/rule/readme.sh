lint ()
{
    ERROR_SUMMARY=
    ERROR_MESSAGE=
    EXIT_STATUS=0

    __project="$1"
    __no_readme=""
    __not_recommended=0
    for __readme in "$__project"/README*; do
        if ! [ -f "$__readme" ]; then continue; fi

        __no_readme="$(JOIN "$__no_readme" "$__readme" " ")"

        __basename="$(basename "$__readme")"
        case "$__basename" in
            README) __file_extension="";;
            *) __file_extension="${__basename##*.}";;
        esac

        case "$__file_extension" in
        md|markdown|mdown|mkdn) ;;
        rst) ;;
        asciidoc|adoc|asc) ;;
        mediawiki|wiki) ;;
        org) ;;
        textile) ;;
        txt)
            if [ -z "$__not_recommended" ]; then
                ERROR_SUMMARY="$(JOIN "$ERROR_SUMMARY" "README file format not recommended" "\n")"
                __not_recommended=1
            fi
            ERROR_MESSAGE="$(JOIN "$ERROR_MESSAGE" "README.txt is not recommended due to no syntax highlighting: $__readme" "\n")"
            EXIT_STATUS=1
            ;;
        "")
            if [ -z "$__not_recommended" ]; then
                ERROR_SUMMARY="$(JOIN "$ERROR_SUMMARY" "README file format not recommended" "\n")"
                __not_recommended=1
            fi
            ERROR_MESSAGE="$(JOIN "$ERROR_MESSAGE" "Plain README is not recommended due to no syntax highlighting: $__readme" "\n")"
            EXIT_STATUS=1
            ;;
        ?*)
            ERROR_SUMMARY="$(JOIN "$ERROR_SUMMARY" "Invalid README file format" "\n")"
            ERROR_MESSAGE="$(JOIN "$ERROR_MESSAGE" "Invalid README file extension: $__readme" "\n")"
            EXIT_STATUS=1
            ;;
        esac
    done

    if [ "$__no_readme" = "" ]; then
        ERROR_SUMMARY="No REAEME.md file"
        ERROR_MESSAGE="No README.md file: ${__project}/README.md"
        EXIT_STATUS=1
    fi

    if [ $(echo "$__no_readme" | wc -w) -gt 1 ]; then
        ERROR_SUMMARY="$(JOIN "$ERROR_SUMMARY" "Duplicated README files" "\n")"
        ERROR_MESSAGE="$(JOIN "$ERROR_MESSAGE" "Duplicated README files: $__no_readme" "\n")"
        EXIT_STATUS=1
    fi
}
