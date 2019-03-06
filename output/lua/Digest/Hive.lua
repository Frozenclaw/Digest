Script.Load("lua/DigestMixin.lua")

local networkVars =
{
    extendAmount = "float (0 to 1 by 0.01)",
    bioMassLevel = "integer (0 to 6)",
    evochamberid = "entityid"
}

AddMixinNetworkVars(DigestMixin, networkVars)

local oldFunc = Hive.OnCreate

function Hive:OnCreate()
	oldFunc(self)
    InitMixin(self, DigestMixin)
    
end

function Hive:GetCanDigestOverride()
    return not self:GetIsOccupied()
end

local ns2Func = Hive.GetTechAllowed

function Hive:GetTechAllowed(techId, techNode, player)

    local allowed, canAfford = CommandStructure.GetTechAllowed(self, techId, techNode, player)

    if techId == kTechId.Digest then
        allowed = allowed and not self:GetIsOccupied()
    end
    
    return allowed, canAfford
    
end