-- Used Tachi's Code from Two Channel Phase Gates
Log("------------------TechData Loaded-------------------")
local ns2_BuildTechData = BuildTechData

function BuildTechData()

    local techData = ns2_BuildTechData()

    local digestData =
    
	{
		[kTechDataId] = kTechId.Digest,
		[kTechDataDisplayName] = "Digest",
		[kTechDataCostKey] = 0,
		[kTechIDShowEnables] = false,
		[kTechDataResearchTimeKey] = kDigestTime,
		[kTechDataMenuPriority] = 2,
		[kTechDataHotkey] = Move.V,
		[kTechDataTooltipInfo] = "Like recycle, but for aliens"
	}
    
   
    for i, k in pairs(digestData) do
        table.insert(techData, digestData)
    end

    return techData
end
     