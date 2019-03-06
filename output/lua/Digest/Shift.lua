Script.Load("lua/DigestMixin.lua")

local networkVars =
{
    hydraInRange = "boolean",
    whipInRange = "boolean",
    tunnelInRange = "boolean",
    cragInRange = "boolean",
    shadeInRange = "boolean",
    shiftInRange = "boolean",
    veilInRange = "boolean",
    spurInRange = "boolean",
    shellInRange = "boolean",
    hiveInRange = "boolean",
    eggInRange = "boolean",
    harvesterInRange = "boolean",
    echoActive = "boolean",
    
    moving = "boolean"
}

AddMixinNetworkVars(DigestMixin, networkVars)

local oldFunc = Shift.OnCreate

function Shift:OnCreate()
	oldFunc(self)
    InitMixin(self, DigestMixin)
    
end