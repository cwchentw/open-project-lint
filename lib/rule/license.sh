lint ()
{
    ERROR_SUMMARY=
    ERROR_MESSAGE=
    EXIT_STATUS=0

    __project="$1"
    __license="$__project/LICENSE"
    if ! [ -f "$__license" ]; then
        ERROR_SUMMERY="No LICENSE file"
        ERROR_MESSAGE="No LICENSE file: $__license"
        EXIT_STATUS=1
    fi
}
