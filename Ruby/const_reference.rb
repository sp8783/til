CONST = 'Object'

class Foo
  CONST = 'Foo'
end

class Bar
  p CONST               # => "Object"      トップレベルの定数

  CONST = 'Bar'

  class Baz < Foo
    p CONST             # => "Bar"      継承上位の定数

    CONST = 'Baz'
    p CONST             # => "Baz"      自クラスの定数

    # この場合、親クラスの定数は明示的に指定しなければ見えない
    p Foo::CONST        # => "Foo"
    p ::CONST           # => "Object"

  end
end
