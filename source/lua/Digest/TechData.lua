-- Used Tachi's Code from Two Channel Phase Gates
--Log("------------------TechData Loaded-------------------")
local ns2_BuildTechData = BuildTechData

local kDigestStrings = {}
kDigestStrings["DIGEST"] = "Digest"
kDigestStrings["DIGEST_TOOLTIP"] = "Like recycle, but for aliens"

local kDigestTime = kRecycleTime

function BuildTechData()

    local techData = ns2_BuildTechData()

    local digestTechData =
    
	{
		[kTechDataId] = kTechId.Digest,
		[kTechDataDisplayName] = kDigestStrings["DIGEST"],
		[kTechDataCostKey] = 0,
		[kTechIDShowEnables] = false,
		[kTechDataResearchTimeKey] = kDigestTime,
		[kTechDataMenuPriority] = 2,
		[kTechDataHotkey] = Move.V,
		[kTechDataTooltipInfo] = kDigestStrings["DIGEST_TOOLTIP"]
	}
    
   
    for i, k in pairs(digestTechData) do
        table.insert(techData, digestTechData)
    end

    return techData
end
     