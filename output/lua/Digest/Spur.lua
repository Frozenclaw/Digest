Script.Load("lua/DigestMixin.lua")

local networkVars = { }

AddMixinNetworkVars(DigestMixin, networkVars)

local oldFunc = Spur.OnCreate

function Spur:OnCreate()
	oldFunc(self)
    InitMixin(self, DigestMixin)
    
end