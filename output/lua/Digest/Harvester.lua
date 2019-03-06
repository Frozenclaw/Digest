Script.Load("lua/DigestMixin.lua")

local networkVars = { }

AddMixinNetworkVars(DigestMixin, networkVars)

local oldFunc = Harvester.OnCreate

function Harvester:OnCreate()
	oldFunc(self)
    InitMixin(self, DigestMixin)
    
end