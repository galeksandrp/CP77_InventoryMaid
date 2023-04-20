attachments = {}

local slotNames = {
    "AttachmentSlots.Scope",
    "AttachmentSlots.ScopeRail",
    "AttachmentSlots.PowerModule",
    "AttachmentSlots.GenericWeaponMod1",
    "AttachmentSlots.GenericWeaponMod2",
    "AttachmentSlots.GenericWeaponMod3",
    "AttachmentSlots.GenericWeaponMod4",
    "AttachmentSlots.MeleeWeaponMod1",
    "AttachmentSlots.MeleeWeaponMod2",
    "AttachmentSlots.MeleeWeaponMod3",
    "AttachmentSlots.HeadFabricEnhancer1",
    "AttachmentSlots.HeadFabricEnhancer2",
    "AttachmentSlots.HeadFabricEnhancer3",
    "AttachmentSlots.HeadFabricEnhancer4",
    "AttachmentSlots.FaceFabricEnhancer1",
    "AttachmentSlots.FaceFabricEnhancer2",
    "AttachmentSlots.FaceFabricEnhancer3",
    "AttachmentSlots.FaceFabricEnhancer4",
    "AttachmentSlots.InnerChestFabricEnhancer1",
    "AttachmentSlots.InnerChestFabricEnhancer2",
    "AttachmentSlots.InnerChestFabricEnhancer3",
    "AttachmentSlots.InnerChestFabricEnhancer4",
    "AttachmentSlots.OuterChestFabricEnhancer1",
    "AttachmentSlots.OuterChestFabricEnhancer2",
    "AttachmentSlots.OuterChestFabricEnhancer3",
    "AttachmentSlots.OuterChestFabricEnhancer4",
    "AttachmentSlots.LegsFabricEnhancer1",
    "AttachmentSlots.LegsFabricEnhancer2",
    "AttachmentSlots.LegsFabricEnhancer3",
    "AttachmentSlots.LegsFabricEnhancer4",
    "AttachmentSlots.FootFabricEnhancer1",
    "AttachmentSlots.FootFabricEnhancer2",
    "AttachmentSlots.FootFabricEnhancer3",
    "AttachmentSlots.FootFabricEnhancer4"
}

local attachmentSlot = { }

function attachments.removeAll(itemID)
    if next(attachmentSlot) == nil then
        for _, slotName in ipairs(slotNames) do
            attachmentSlot[tostring(TweakDBID.new(slotName))] = string.sub(slotName, -1)
        end
    end

    local itemParts = Game.GetScriptableSystemsContainer():Get("ItemModificationSystem").GetAllSlots(Game.GetPlayer(), itemID)
    for _, part in pairs(itemParts) do
        -- must be an attachment or mod slot with an attachment or mod equipped
        if attachmentSlot[tostring(part.slotID)] ~= nil and part.installedPart.tdbid.hash ~= 0 then
            Game.GetScriptableSystemsContainer():Get("ItemModificationSystem"):RemoveItemPart(Game.GetPlayer(), itemID, part.slotID, true)
        end
    end
end

return attachments