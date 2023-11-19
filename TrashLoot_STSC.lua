DEFAULT_CHAT_FRAME:AddMessage("TrashLoot Strat-Scholo Edition is Active", 1, 0, 1);
TrashLoot_STSC = CreateFrame("Frame")
TrashLoot_STSC:RegisterEvent("START_LOOT_ROLL") 
TrashLoot_STSC:RegisterEvent("LOOT_BIND_CONFIRM")
TrashLoot_STSC:RegisterEvent("ZONE_CHANGED_NEW_AREA")
TrashLoot_STSC:SetScript("OnEvent", function()
    if event == "START_LOOT_ROLL" then
        local rollID, rollTime, rollItemLink, rollQuantity, rollPlayer = arg1, arg2, arg3, arg4, arg5
		local texture, name, count, quality = GetLootRollItemInfo(rollID)
        if GetZoneText() == "Stratholme" and (name == "Corruptor's Scourgestone" or name == "Essence of Undeath" or name == "Righteous Orb") then
        	RollOnLoot(rollID, 1)
			for i=1,STATICPOPUP_NUMDIALOGS do -- for i=1 to (I think this is always 4 - STATICPOPUP_NUMDIALOGS)
				local frame = getglobal("StaticPopup"..i)  -- set frame to be = StaticPopup1, StaticPopup2 etc
				if frame:IsShown() and frame.which == "CONFIRM_LOOT_ROLL" then -- what is the StaticPopup for 
					getglobal("StaticPopup"..i.."Button1"):Click(); --click StaticPopup..i..Button1:Click()
				end
	end
        elseif name == "Frayed Abomination Stitching" and GetZoneText() == "Stratholme" then
            RollOnLoot(rollID, 0)
	end
        elseif GetZoneText() == "Scholomance" and  (name == "Corruptor's Scourgestone" or name = "Essence of Undeath" or name == "Dark Rune") then
        	RollOnLoot(rollID, 1)
			for i=1,STATICPOPUP_NUMDIALOGS do -- for i=1 to (I think this is always 4 - STATICPOPUP_NUMDIALOGS)
				local frame = getglobal("StaticPopup"..i)  -- set frame to be = StaticPopup1, StaticPopup2 etc
				if frame:IsShown() and frame.which == "CONFIRM_LOOT_ROLL" then -- what is the StaticPopup for 
					getglobal("StaticPopup"..i.."Button1"):Click(); --click StaticPopup..i..Button1:Click()
				end
	end
        elseif name == "Skin of Shadow" and GetZoneText() == "Scholomance" then
            RollOnLoot(rollID, 0)
        end
	elseif event == "ZONE_CHANGED_NEW_AREA" then
		if GetRealZoneText() == "Stratholme" then
			DEFAULT_CHAT_FRAME:AddMessage("You have entered "..GetRealZoneText().." auto-needing on Corruptor's Scourgestones, Righteous Orbs, and Essences of Undeath. Auto-passing on Frayed Abomination Stitching.")
		end
		elseif GetRealZoneText() == "Scholomance" then
			DEFAULT_CHAT_FRAME:AddMessage("You have entered "..GetRealZoneText().." auto-needing on Corruptor's Scourgestones, Essences of Undeath, and Dark Runes. Auto-passing on Skin of Shadow.")
		end
	end
end)
