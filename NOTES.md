## Table of contents

1. [Module attributes](#module-attributes)
2. [Difference between `def` and `defp`](#difference-between-`def`-and-`defp`)

### Module attributes

The module attributes are a sort of constants that work at the top level of the module (cannot be set inside a function).

To define an attribute just preceed the its name with `@` as below:

```elixir
defmodule MyModule do
    @version 1

    def version do
        @version
    end
end
```

The attributes can be definede multiple times and the order is guaranteed in terms of functions definition.

### Difference between `def` and `defp`

Inside a module, we can define functions with `def/2` and private functions with `defp/2`. 

A function defined with `def/2` can be invoked from other modules while a private function can only be invoked locally.

