module Main where

-- import Torch.Core.TensorFloat as F
-- import Torch.Core.TensorLong as L
import Torch.Core.Tensor as T
import Torch.Class.Tensor.Copy as Copy

main :: IO ()
main = do
  mixinTensor <- T.new
  newMixinTensor <- Copy.copy mixinTensor
  -- floatTensor <- L.new
  -- newFloat <- Copy.copy floatTensor
  -- longTensor <- L.new
  -- newLong <- Copy.copy longTensor

