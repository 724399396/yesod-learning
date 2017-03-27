{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE QuasiQuotes          #-}
{-# LANGUAGE TemplateHaskell      #-}
{-# LANGUAGE TypeFamilies         #-}
import Yesod

data App = App

mkYesod "App" [parseRoutes|
/ HomeR GET
|]

instance Yesod App where

getHomeR :: Handler Html
getHomeR = defaultLayout $ do
  setTitle "toWidgetHead and toWidgetBody"
  toWidgetBody
    [hamlet|<script src=/include-in-body.js>|]
  toWidgetHead
    [hamlet|<script src=/inclide-in-head.js>|]

main :: IO ()
main = warp 3001 App
