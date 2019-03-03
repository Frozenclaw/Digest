-- Used Tachi's Code from Two Channel Phase Gates
local ns2_InitTechTree = AlienTeam.InitTechTree
function ns2_InitTechTree()
	ns2_InitTechTree(self)
	self.techTree.AddActivation(kTechId.Digest)
	self.techTree.SetComplete()
end 