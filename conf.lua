-- Tuto install Love2D debug in Visual Studio Code
-- https://docs.google.com/document/d/1hZqSSqOEJS-4kyO12SfvIw3GI1DKtF5ho2UXVPn4j1c/edit#

-- SHORTCUTS IN Visual Studio Code
-- Run : ALT + L
-- Run with debugger : F5

-- debbuger in Visual Studio Code
if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
  require("lldebugger").start()
end

-- display traces in the console during the execution
io.stdout:setvbuf("no")

-- debug step by step in ZeroBrane Studio
if arg[#arg] == "-debug" then require("mobdebug").start() end