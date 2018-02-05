{-# LANGUAGE InstanceSigs #-}
module Torch.Core.Tensor
  ( Tensor(..)
  ) where

import GHC.ForeignPtr (ForeignPtr)
import Torch.Class.Tensor.Copy
import THTypes
import qualified TensorCopy as Sig

newtype Tensor = Tensor { tensor :: ForeignPtr CTensor }
  deriving (Show, Eq)

c_new :: IO (Ptr CTensor)
c_new = undefined

c_newLong :: IO (Ptr CTHLongTensor)
c_newLong = undefined

c_newFloat :: IO (Ptr CTHFloatTensor)
c_newFloat = undefined

p_free :: Ptr CTensor -> IO ()
p_free = undefined

p_freeLong :: Ptr CTHLongTensor -> IO ()
p_freeLong = undefined

p_freeFloat :: Ptr CTHFloatTensor -> IO ()
p_freeFloat = undefined

instance TensorCopy Tensor where
  copy :: Tensor -> IO Tensor
  copy t = do
    tar <- c_new
    withForeignPtr (tensor t) (\src -> Sig.c_copy src tar)
    Tensor <$> newForeignPtr p_free tar

  copyLong :: Tensor -> IO (Ptr CTHLongTensor)
  copyLong = do
    tar <- c_newLong
    withForeignPtr (tensor t) (\src -> Sig.c_copy src tar)
    pure tar

  copyFloat :: Tensor -> IO (Ptr CTHFloatTensor)
  copyFloat = do
    tar <- c_newFloat
    withForeignPtr (tensor t) (\src -> Sig.c_copy src tar)
    pure tar



