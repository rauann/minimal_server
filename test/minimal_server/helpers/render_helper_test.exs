defmodule Helpers.RenderHelperTest do
  use ExUnit.Case

  test "return encoded json" do
    defmodule Foo do
      use Helpers.RenderHelper
    end

    assert Foo.render(%{foo: "bar"}) == "{\"foo\":\"bar\"}"
  end
end
