Script.Load("lua/DigestMixin.lua")

local networkVars = { }

AddMixinNetworkVars(DigestMixin, networkVars)

local oldFunc = Shell.OnCreate

function Shell:OnCreate()
	oldFunc(self)
    InitMixin(self, DigestMixin)
    
end