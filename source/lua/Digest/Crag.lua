--Log("------------------Crag Loaded-------------------")

Script.Load("lua/DigestMixin.lua")

local networkVars =
{
    -- For client animations
    healingActive = "boolean",
    healWaveActive = "boolean",
    
    moving = "boolean"
}

AddMixinNetworkVars(DigestMixin, networkVars)

local oldFunc = Crag.OnCreate

function Crag:OnCreate()
	oldFunc(self)
    InitMixin(self, DigestMixin)
    
end
