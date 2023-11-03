module DevReload.Component
  ( Output
  , Query
  , Slot
  , component
  ) where

import Prelude
import Data.Const (Const)
import Effect.Aff.Class (class MonadAff)
import Halogen as H
import Halogen.HTML as HH

type Input = Unit

type Output = Void

type Query :: forall k. k -> Type
type Query = Const Void

type Slot = H.Slot Query Output

type State = Unit

type Action = Void

type HalogenM m = H.HalogenM State Action () Output m

type HTML m = H.ComponentHTML Action () m

component ::
  forall m.
  MonadAff m =>
  H.Component Query Input Output m
component =
  H.mkComponent
    { initialState
    , render
    , eval:
        H.mkEval
          $ H.defaultEval
              { handleAction = handleAction
              }
    }
  where
  initialState = identity

  render :: State -> HTML m
  render _ =
    HH.div_
      [ HH.text "Dev reload"
      ]

  handleAction :: Action -> HalogenM m Unit
  handleAction = absurd

