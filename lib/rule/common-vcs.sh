lint ()
{
    ERROR_SUMMARY=
    ERROR_MESSAGE=
    EXIT_STATUS=0

    __project="$1"
    __no_vcs=1
    for __vcs_sub_directory in .git .hg .svn; do
        __vcs_directory="$__project/$__vcs_sub_directory"

        if [ -d "$__vcs_directory" ]; then
            __no_vcs=0
            break
        fi
    done

    if [ "$__no_vcs" -ne 0 ]; then
        ERROR_MESSAGE="No version source control detected. Git is recommended"
        ERROR_SUMMARY="No version source control"
        EXIT_STATUS=1
    fi
}
