JOIN_NEWLINE ()
(
    __output=
    __string="$1"

    if [ -n "$__output" ]; then
        __output="$__output$__string\n"
    else
        __output="$__string"
    fi

    echo "$__output"
)
