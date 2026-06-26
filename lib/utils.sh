HELP_INFO ()
{
    echo "Usage: $0 path/to/project"
}

JOIN ()
(
    __output="$1"
    __string="$2"
    __sep="$3"

    if [ -n "$__output" ]; then
        __output="$__output$__sep$__string"
    else
        __output="$__string"
    fi

    echo "$__output"
)
