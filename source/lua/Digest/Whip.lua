Script.Load("lua/DigestMixin.lua")

local networkVars =
    {
        attackYaw = "interpolated integer (0 to 360)",
        
        slapping = "boolean", -- true if we have started a slap attack
        bombarding = "boolean", -- true if we have started a bombard attack
        lastAttackStart = "compensated time", -- Time of the last attack start
        
        rooted = "boolean",
        move_speed = "float", -- used for animation speed
        
        -- used for rooting/unrooting
        unblockTime = "time",
    }

AddMixinNetworkVars(DigestMixin, networkVars)

local oldFunc = Whip.OnCreate

function Whip:OnCreate()
	oldFunc(self)
    InitMixin(self, DigestMixin)
    
end