-- Instant Auto Repair: Ultra-lightweight auto-repair addon
-- Zero configuration, instant repair, maximum efficiency

local frame = CreateFrame("Frame")
frame:RegisterEvent("MERCHANT_SHOW")
frame:SetScript("OnEvent", function(self, event)
    if CanMerchantRepair() then
        local cost = GetRepairAllCost()
        if cost > 0 then
            if cost <= GetMoney() then
                RepairAllItems()
                DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00⚡|r Repaired for " .. GetCoinTextureString(cost))
            else
                DEFAULT_CHAT_FRAME:AddMessage("|cFF00FF00⚡|r |cFFFF0000Insufficient funds|r")
            end
        end
    end
end)
