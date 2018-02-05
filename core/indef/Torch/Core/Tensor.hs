{-# LANGUAGE InstanceSigs #-}
module Torch.Core.Tensor
  ( Tensor(..)
  , new
  ) where

import Foreign hiding (new)
import GHC.ForeignPtr (ForeignPtr)
import Torch.Class.Tensor.Copy
import TensorCopy
import THTypes
import qualified TensorCopy as Sig

newtype Tensor = Tensor { tensor :: ForeignPtr CTensor }
  deriving (Show, Eq)

-- should come from a Torch.Class.Tensor
new :: IO Tensor
new = undefined

-- should be taken from the Tensor sig
c_new :: IO (Ptr CTensor)
c_new = undefined

c_newLong :: IO (Ptr CTHLongTensor)
c_newLong = undefined

c_newFloat :: IO (Ptr CTHFloatTensor)
c_newFloat = undefined

p_free :: FunPtr (Ptr CTensor -> IO ())
p_free = undefined

p_freeLong :: FunPtr (Ptr CTHLongTensor -> IO ())
p_freeLong = undefined

p_freeFloat :: FunPtr (Ptr CTHFloatTensor -> IO ())
p_freeFloat = undefined

instance TensorCopy Tensor where
  copy :: Tensor -> IO Tensor
  copy t = do
    tar <- c_new
    withForeignPtr (tensor t) (\src -> Sig.c_copy src tar)
    Tensor <$> newForeignPtr p_free tar

  copyLong :: Tensor -> IO (Ptr CTHLongTensor)
  copyLong t = do
    tar <- c_newLong
    withForeignPtr (tensor t) (\src -> Sig.c_copyLong src tar)
    pure tar

  copyFloat :: Tensor -> IO (Ptr CTHFloatTensor)
  copyFloat t = do
    tar <- c_newFloat
    withForeignPtr (tensor t) (\src -> Sig.c_copyFloat src tar)
    pure tar



