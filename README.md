# yamloboros

![CI](https://github.com/swift-nav/yamloboros/workflows/CI/badge.svg)

Extremely simple yaml2json and json2yaml CLI tools.  Basically just CLI wrappers around [serde_yaml](https://docs.serde.rs/serde_yaml/index.html) and [serde_json](https://docs.serde.rs/serde_json/).

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

## Copyright

```
Copyright (C) 2020 Swift Navigation Inc.
Contact: Swift Navigation <dev@swiftnav.com>

This source is subject to the license found in the file 'LICENSE' which must be
be distributed together with this source. All other rights reserved.

THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.
```

## Logo

Logo declared "public domain" per [wikimedia](https://commons.wikimedia.org/wiki/File:Ouroboros-simple.svg).
