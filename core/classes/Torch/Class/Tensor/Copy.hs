module Torch.Class.Tensor.Copy where

import Foreign
import THTypes

class TensorCopy t where
  copy       :: t -> IO t
  copyLong   :: t -> IO (Ptr CTHLongTensor)
  copyFloat  :: t -> IO (Ptr CTHFloatTensor)

