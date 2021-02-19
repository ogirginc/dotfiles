--------------------------------------------------------------------------------
-- CONFIG
-- Main configuration options.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- SpoonInstall
--------------------------------------------------------------------------------
hs.loadSpoon("SpoonInstall")
SpoonInstall=spoon.SpoonInstall

----------------------------------------
-- ReloadConfiguration
----------------------------------------
SpoonInstall:andUse("ReloadConfiguration")
spoon.ReloadConfiguration:start()
hs.notify.new({title="Hammerspoon", informativeText="Config file is reloaded"}):send() 



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- A ShiftIt like Hammerspoon window management configuration.
-- https://github.com/peterklijn/hammerspoon-shiftit
--------------------------------------------------------------------------------
hs.loadSpoon("ShiftIt")
spoon.ShiftIt:bindHotkeys({})

--------------------------------------------------------------------------------
-- This lets you click on the menu bar item to toggle the mute state.
-- https://github.com/jpf/Zoom.spoon
--------------------------------------------------------------------------------
zoomStatusMenuBarItem = hs.menubar.new(nil)
zoomStatusMenuBarItem:setClickCallback(function()
    spoon.Zoom:toggleMute()
end)

updateZoomStatus = function(event)
  hs.printf("updateZoomStatus(%s)", event)
  if (event == "from-running-to-meeting") then
    zoomStatusMenuBarItem:returnToMenuBar()
  elseif (event == "muted") then
    zoomStatusMenuBarItem:setTitle("🔴")
  elseif (event == "unmuted") then
    zoomStatusMenuBarItem:setTitle("🟢")
  elseif (event == "from-meeting-to-running") or (event == "from-running-to-closed") then
    zoomStatusMenuBarItem:removeFromMenuBar()
  end
end

hs.loadSpoon("Zoom")
spoon.Zoom:setStatusCallback(updateZoomStatus)
spoon.Zoom:start()

-- Next up:
-- https://github.com/adamyonk/PushToTalk.spoon/blob/master/init.lua
hs.hotkey.bind('', 'f12', function()
  spoon.Zoom:toggleMute()
end)
