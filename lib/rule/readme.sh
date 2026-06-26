lint ()
{
    EXIT_STATUS=0
    __project="$1"
    __no_readme=""
    for __readme in "$__project"/README*; do
        if ! [ -f "$__readme" ]; then continue; fi

        __no_readme="$__no_readme $__readme"

        __file_extension="${__readme##*.}"

        case "$__file_extension" in
        md|markdown|mdown|mkdn) ;;
        rst) ;;
        asciidoc|adoc|asc) ;;
        mediawiki|wiki) ;;
        org) ;;
        textile) ;;
        txt)
            ERROR_SUMMARY="README file format not recommended"
            ERROR_MESSAGE=$(JOIN_NEWLINE "README.txt is not recommended due to no syntax highlighting: $__readme")
            EXIT_STATUS=1;;
        "")
            ERROR_SUMMARY="README file format not recommended"
            ERROR_MESSAGE=$(JOIN_NEWLINE "Plain README is not recommended due to no syntax highlighting: $__readme")
            EXIT_STATUS=1;;
        *)
            ERROR_SUMMARY=$(JOIN_NEWLINE "Invalid README file format" "\n")
            ERROR_MESSAGE=$(JOIN_NEWLINE "Invalid README file extension: $__readme")
            EXIT_STATUS=1;;
        esac
    done

    if [ "$__no_readme" = "" ]; then
        ERROR_SUMMARY="No REAEME.md file"
        ERROR_MESSAGE="No README.md file: ${__project}/README.md"
        EXIT_STATUS=1
    fi

    if [ $(echo "$__no_readme" | wc -w) -gt 1 ]; then
        ERROR_SUMMARY=$(JOIN_NEWLINE "Duplicated README files")
        ERROR_MESSAGE=$(JOIN_NEWLINE "Duplicated README files: $__no_readme")
        EXIT_STATUS=1
    fi
}
