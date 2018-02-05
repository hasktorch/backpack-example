module Main where

import qualified Torch.Core.TensorFloat as F
import qualified Torch.Core.TensorLong as L
import qualified Torch.Class.Tensor.Copy as Copy

main :: IO ()
main = do
  floatTensor <- F.new
  longTensor <- L.new
  newFloat <- Copy.copy floatTensor
  newLong <- Copy.copy longTensor
  pure ()

