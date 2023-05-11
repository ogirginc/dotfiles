--------------------------------------------------------------------------------
-- CONFIG
-- Main configuration options.
--------------------------------------------------------------------------------
local hyper = {"ctrl", "alt"}

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
-- SPOONS
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- WindowGrid
-- http://www.hammerspoon.org/docs/hs.grid.html#setMargins
-- http://www.hammerspoon.org/docs/hs.geometry.html#size
----------------------------------------
--------------------------------------------------------------------------------
SpoonInstall:andUse("WindowGrid", {
                               config = { gridGeometries = { { "6x4" } } },
     													 hotkeys = { show_grid = { hyper, "w" } },
     													 start = true,
     													--  hs.grid.ui.textSize = {10} -- Do not work
     													--  hs.grid.setMargins(hs.geometry.size(1000, 1000)) -- TODO
  														}
)



--------------------------------------------------------------------------------
-- A ShiftIt like Hammerspoon window management configuration.
-- https://github.com/peterklijn/hammerspoon-shiftit
--------------------------------------------------------------------------------
SpoonInstall.repos.ShiftIt = {
   url = "https://github.com/peterklijn/hammerspoon-shiftit",
   desc = "ShiftIt spoon repository",
   branch = "master",
}

SpoonInstall:andUse("ShiftIt", { repo = "ShiftIt" })
spoon.ShiftIt:bindHotkeys({})
