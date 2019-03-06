Script.Load("lua/DigestMixin.lua")

local networkVars = { }

AddMixinNetworkVars(DigestMixin, networkVars)

local oldFunc = Veil.OnCreate

function Veil:OnCreate()
	oldFunc(self)
    InitMixin(self, DigestMixin)
    
end