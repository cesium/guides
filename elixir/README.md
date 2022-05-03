# Elixir

- Avoid macros.
- Prefer pattern matching and guards in function definitions over conditionals
  in the function body.
- Order the dependencies of a module as: `use`, `import`, `alias`.
- Put an empty line between each type of dependency.
- Sort the dependencies in each section alphabetically.

## Formatter

Elixir ships with a code formatter that is capable of automatically formatting
our codebase according to a consistent style.

```
mix format
```

Use it on all elixir code projects. Learn more [here][mix-format].

## Linter

[Credo][credo] is a static code analysis tool for the Elixir language with a
focus on teaching and code consistency.

It can show you refactoring opportunities in your code, complex code fragments,
warn you about common mistakes, show inconsistencies in your naming scheme and,
if needed, help you enforce a desired coding style.

```
mix credo --strict --all
```

Use it on all elixir code projects. Learn more [here][hexdocs-credo].

[mix-format]: https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html#automatic-code-formatting
[credo]: https://credo-ci.org
[hexdocs-credo]: https://hexdocs.pm/credo/overview.html
