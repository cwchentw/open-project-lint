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

PARSE_PROJECTIGNORE ()
{
    __project="$1"
    __ignore_file="$__project/.projectignore"
    if [ -f "$__ignore_file" ]; then
        grep -v '^[[:space:]]*#' "$__ignore_file" | grep -v '^[[:space:]]*$'
    fi
}
