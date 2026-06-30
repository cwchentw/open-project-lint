# open-project-lint

Lint open source projects to match common idioms.

## Rationale

`open-project-lint` is a lightweight utility that helps open source newcomers (and even experienced but forgetful maintainers) quickly check whether their projects follow recommended practices in structure and resources.

It’s designed as a fast checklist tool, not a strict rule enforcer.

## Project Status

This project is a proof-of-concept (PoC).  
It demonstrates three core ideas: plugin-based rules, blacklist mechanism, and functor-style abstraction.  
The prototype is complete and will not be extended with new features.  
There are no current plans to rewrite it, but a future reimplementation in a statically typed language such as OCaml or Rust is possible.

## Usage

```shell
$ open-project-lint path/to/project
```

## Note

Even the author’s own projects sometimes fail the checks.  
That’s intentional — `open-project-lint` is meant as guidance, not law.

## License

MIT License (c) 2026 ByteBard
