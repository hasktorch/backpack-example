module Torch.Class.Tensor.Copy where

import Foreign
import THTypes

class TensorCopy t where
  copy       :: t -> IO t
  copyLong   :: t -> Ptr CTHLongTensor -> IO ()
  copyFloat  :: t -> Ptr CTHFloatTensor -> IO ()

