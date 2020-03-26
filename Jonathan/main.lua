-- fungerar
local function colour(statusbar, unit)
    local _, class, c
        if UnitIsPlayer(unit) and UnitIsConnected(unit) and unit == statusbar.unit and UnitClass(unit) then
            _, class = UnitClass(unit)
            c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
            statusbar:SetStatusBarColor(c.r, c.g, c.b)
        end
    end
    
    hooksecurefunc("UnitFrameHealthBar_Update", colour)
    hooksecurefunc("HealthBar_OnValueChanged", function(self)
        colour(self, self.unit)
    end)
    
    local frame = CreateFrame("FRAME")
    frame:RegisterEvent("GROUP_ROSTER_UPDATE")
    frame:RegisterEvent("PLAYER_TARGET_CHANGED")
    frame:RegisterEvent("PLAYER_FOCUS_CHANGED")
    frame:RegisterEvent("UNIT_FACTION")
    
    local function eventHandler(self, event, ...)
        if UnitIsPlayer("target") then
            c = RAID_CLASS_COLORS[select(2, UnitClass("target"))]
            TargetFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
        end
        if UnitIsPlayer("focus") then
            c = RAID_CLASS_COLORS[select(2, UnitClass("focus"))]
            FocusFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
        end
        if PlayerFrame:IsShown() and not PlayerFrame.bg then
            c = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
            bg=PlayerFrame:CreateTexture()
            bg:SetPoint("TOPLEFT",PlayerFrameBackground)
            bg:SetPoint("BOTTOMRIGHT",PlayerFrameBackground,0,22)
            bg:SetTexture(TargetFrameNameBackground:GetTexture())
            bg:SetVertexColor(c.r,c.g,c.b)
            PlayerFrame.bg=true
        end
    end
    
    frame:SetScript("OnEvent", eventHandler)
    
    for _, BarTextures in pairs({TargetFrameNameBackground, FocusFrameNameBackground}) do
        BarTextures:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
    end

   
    local t="Interface\\TargetingFrame\\UI-TargetingFrame-rare"PlayerFrameTexture:SetTexture(t)hooksecurefunc("TargetFrame_Update",function(f)if UnitIsPlayer(f.unit)then _G[f:GetName().."TextureFrameTexture"]:SetTexture(t)end end)
ToggleMinimap();
StanceButton1:ClearAllPoints()
StanceButton1:SetPoint("cENTER",-6000,0)
StanceButton1.SetPoint = function() end
MultiBarBottomLeftButton1:ClearAllPoints();
MultiBarBottomLeftButton1:SetPoint("CENTER",-232,0);
MultiBarBottomLeftButton1.SetPoint = function() end;
MainMenuBarArtFrame.LeftEndCap:Hide(); MainMenuBarArtFrame.RightEndCap:Hide();MainMenuBarArtFrameBackground:Hide()
ActionBarUpButton:Hide();ActionBarDownButton:Hide();MainMenuBarArtFrame.PageNumber:Hide();
MicroButtonAndBagsBar:Hide();
MicroButton:Hide();
AzeriteBarMixin:ShouldBeVisible();

--
