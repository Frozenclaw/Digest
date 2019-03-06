-- Used Tachi's Code from Two Channel Phase Gates
--Log("------------------TechTreeButtons Loaded-------------------")
local ns2_GetMaterialXYOffset = GetMaterialXYOffset
function GetMaterialXYOffset(techId)
    if techId == kTechId.Digest then
        techId = kTechId.Recycle
    end
    return ns2_GetMaterialXYOffset(techId)
end