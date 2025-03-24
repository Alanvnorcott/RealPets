print("RealPets: Addon loaded!")
if not RealPetsDB then
    RealPetsDB = {}
end
local mainFrame = CreateFrame("Frame", "RealPetsMainFrame", UIParent, "BasicFrameTemplateWithInset")
local eventListenerFrame = CreateFrame("Frame", "RealPetsEventListenerFrame", UIParent)
mainFrame:SetSize(500, 350)
mainFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
mainFrame.TitleBg:SetHeight(30)
mainFrame.title = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
mainFrame.title = mainFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
mainFrame.title:SetPoint("TOPLEFT", mainFrame.TitleBg, "TOPLEFT", 5, -3)
mainFrame.title:SetText("Real Pets!")
mainFrame:Show()
mainFrame:EnableMouse(true)
mainFrame:SetMovable(true)
mainFrame:RegisterForDrag("LeftButton")
mainFrame:SetScript("OnDragStart", function(self)
	self:StartMoving()
end)
mainFrame:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing()
end)

mainFrame:SetScript("OnShow", function()
        PlaySound(808)
end)

mainFrame:SetScript("OnHide", function()
        PlaySound(808)
end)

SLASH_MYADDON1 = "/myaddon"
SlashCmdList["MYADDON"] = function()
    if mainFrame:IsShown() then
        mainFrame:Hide()
    else
        mainFrame:Show()
    end
end

local function eventHandler(self, event, ...)
    if event == "PLAYER_REGEN_ENABLED" then
        print("RealPets: " .. UnitName("pet") .. " has exited combat")
    end
end

eventListenerFrame:SetScript("OnEvent", eventHandler)
eventListenerFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
table.insert(UISpecialFrames, "RealPetsMainFrame")

mainFrame.petName = mainFrame.CreateFontString(nil, "OVERLAY", "GameFontNormal")
mainFrame.petName:SetPoint("TOPLEFT", mainFrame, "TOPLEFT", 15, -35)
mainFrame.petName:SetText("Bestfriend: " .. UnitName("pet") .." (Level " .. UnitLevel("pet") .. ")")