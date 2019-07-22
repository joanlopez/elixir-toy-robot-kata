## Module attributes

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