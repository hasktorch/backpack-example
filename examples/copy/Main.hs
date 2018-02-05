module Main where

import Torch.Core.TensorFloat as F
import Torch.Core.TensorLong as L
import Torch.Class.Tensor.Copy as Copy

main :: IO ()
main = do
  floatTensor <- F.new
  longTensor <- L.new
  newFloat <- Copy.copy floatTensor
  newLong <- Copy.copy longTensor

