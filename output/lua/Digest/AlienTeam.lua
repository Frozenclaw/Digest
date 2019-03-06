-- Used Tachi's Code from Two Channel Phase Gates
local ns2_InitTechTree = AlienTeam.InitTechTree
function AlienTeam:InitTechTree()
    ns2_InitTechTree(self)
    self.techTree:AddUpgradeNode(kTechId.Digest)
    self.techTree:SetComplete()
end
