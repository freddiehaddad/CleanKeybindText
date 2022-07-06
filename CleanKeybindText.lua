local buttons = {}

for i = 1, 12 do
  tinsert(buttons, _G["ActionButton"..i])
  tinsert(buttons, _G["MultiBarBottomLeftButton"..i])
  tinsert(buttons, _G["MultiBarBottomRightButton"..i])
  tinsert(buttons, _G["MultiBarLeftButton"..i])
  tinsert(buttons, _G["MultiBarRightButton"..i])
end

-- hide macro names
for _, button in pairs(buttons) do
  button.Name:Hide()
end

-- shorten long keybinds
local function updateHotkeys(self)
  local hotkey = self.HotKey
  local text = hotkey:GetText()

  text = gsub(text, "(s%-)", "S")
  text = gsub(text, "(a%-)", "A")
  text = gsub(text, "(c%-)", "C")
  text = gsub(text, "(st%-)", "C")

  for i = 1, 30 do
    text = gsub(text, _G["KEY_BUTTON"..i], "M"..i)
  end

  for i = 1, 9 do
    text = gsub(text, _G["KEY_NUMPAD"..i], "Nu"..i)
  end

  text = gsub(text, KEY_NUMPADDECIMAL, "Nu.")
  text = gsub(text, KEY_NUMPADDIVIDE, "Nu/")
  text = gsub(text, KEY_NUMPADMINUS, "Nu-")
  text = gsub(text, KEY_NUMPADMULTIPLY, "Nu*")
  text = gsub(text, KEY_NUMPADPLUS, "Nu+")

  text = gsub(text, KEY_MOUSEWHEELUP, "WU")
  text = gsub(text, KEY_MOUSEWHEELDOWN, "WD")
  text = gsub(text, KEY_NUMLOCK, "NuL")
  text = gsub(text, KEY_PAGEUP, "PU")
  text = gsub(text, KEY_PAGEDOWN, "PD")
  text = gsub(text, KEY_SPACE, "Sp")
  text = gsub(text, KEY_INSERT, "Ins")
  text = gsub(text, KEY_HOME, "Hm")
  text = gsub(text, KEY_DELETE, "Del")
  text = gsub(text, "Capslock", "Caps")

  hotkey:SetText(text)
end

for _, button in pairs(buttons) do
  hooksecurefunc(button, "UpdateHotkeys", updateHotkeys)
end
