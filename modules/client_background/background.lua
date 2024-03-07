-- private variables
local background
local infoWindow

local accesAccountLink = "http://127.0.0.1"
local websiteLink = "http://127.0.0.1"

local infoTexts = {
 [1] = "NptOld Online",
 [2] = "Version 7.72",
 [3] = "Copyright (C) 2019",
 [4] = "",
 [5] = "All rights reserved.",
 [6] = "Official Website",
 [7] = "http://127.0.0.1",
}

-- public functions
function init()
  background = g_ui.displayUI('background')
  background:lower()

  infoWindow = background:getChildById('infoBox')
  infoWindow:hide()
  
  connect(g_game, { onGameStart = hide })
  connect(g_game, { onGameEnd = show })
  
  setClientInfo()
    modules.client_topmenu.getTopMenu():setHeight(0)
end

function terminate()
  disconnect(g_game, { onGameStart = hide })
  disconnect(g_game, { onGameEnd = show })

  infoWindow:destroy()
  background:destroy()
  Background = nil
end

function hide()
  background:hide()
end

function show()
  background:show()
end

function infoShow()
  if not infoWindow:isVisible() then
     infoWindow:setVisible(true)
  end
end

function infoHide()
  if infoWindow:isVisible() then
    infoWindow:setVisible(false)
  end
end

function accesAccount()
   g_platform.openUrl(accesAccountLink)
end

function openWebsite()
   g_platform.openUrl(websiteLink)
end

function setClientInfo()
  for label, text in pairs(infoTexts) do 
    local label = infoWindow:getChildById('infoLabel' .. label)
    label:setText(text)
  end
end
