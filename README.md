# backpack-example

Basically the workflow would look like this:
+ in raw:
  - have codegen automate anything in raw/generated
  - manually write out the backpack signatures in raw-signatures
  - hard-code types in raw-types (this is just what we already do to get things to compile)
+ in core:
  - add a bunch of high-level typeclasses in core/classes (this is just because I'm currently running into a wall -- this might be mergable with the following)
  - instantiate one indefinite package (ie, code that requires mixins)
  - have a bunch of empty libraries in hasktorch-core.cabal which reexport satisfied requirements from the mixins, which also satisfy the typeclasses
  - bundle everything into one top-level hasktorch-core package.
+ in example:
  - business as usual. Basically it looks like a lot of `Tensor<Type>`s were created (instead of a bunch of C-THTensor pointer-types) and they all satisfy a simple surface of typeclasses which only need to be written once.
