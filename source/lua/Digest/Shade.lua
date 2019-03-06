Script.Load("lua/DigestMixin.lua")
Script.Load("lua/ResearchMixin.lua")

local networkVars = { 
    moving = "boolean"
}

AddMixinNetworkVars(DigestMixin, networkVars)
AddMixinNetworkVars(ResearchMixin, networkVars)

local oldFunc = Shade.OnCreate

function Shade:OnCreate()
	oldFunc(self)
    InitMixin(self, DigestMixin)
    
end