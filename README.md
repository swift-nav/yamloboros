# yamloboros

[![Build Status](https://travis-ci.com/swift-nav/y2jj2y.svg?token=Usmy93JBkW76XB4WJAjb&branch=master)](https://travis-ci.com/swift-nav/y2jj2y)

Extremely simple yaml2json and json2yaml CLI tools.

<a href="https://id.wikipedia.org/wiki/Ouroboros"><img src="./img/ouroboros.png" height="150px" /></a>

## Installation

```
cargo install --git ssh://git@github.com/swift-nav/yamloboros.git --bins
```

Or see the releases page:
- https://github.com/swift-nav/yamloboros/releases

## yaml2json

```bash
yaml2json <<EOF
>
> foo:
>   - 1
>   - 2
>   - abc
> bar:
>   baz: quux
>
> EOF

# Output: {"foo":[1,2,"abc"],"bar":{"baz":"quux"}}
```

## json2yaml

```bash
json2yaml <<EOF
>
> {"foo":[1,2,"abc"],"bar":{"baz":"quux"}}
>
> EOF

# Output:
#   ---
#   bar:
#     baz: quux
#   foo:
#   - 1
#   - 2
#   - abc
```
