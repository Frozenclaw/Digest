Log("--------------Digest Loaded----------------")
Script.Load("lua/CommAbilities/CommanderAbility.lua")

class 'Digest' (CommanderAbility)

Digest.kMapName = "digest"

Digest.kDigestEffect = PrecacheAsset("cinematics/alien/shift/echo_target.cinematic")

Digest.kType = CommanderAbility.kType.OverTime
Digest.kLifeSpan = 0.5

local networkVars =
{
	digestId = "entityid"
}

if Server then

	function Digest:SetDigestId(digestId)
		self.digestId = digestId
	end
	
	function Digest:Perform()
		
		if GetConcedeSequenceActive() then
			return
		end
		
		self:TriggerEffects("recycle_end")
		
		local team = self:GetTeam()
        local deathMessageTable = team:GetDeathMessage(team:GetCommander(), kDeathMessageIcon.Recycled, self)
        team:ForEachPlayer(function(player) Server.SendNetworkMessage(player:GetClient(), "DeathMessage", deathMessageTable, true) end)
        
        self.digested = true
		DestroyEntity(self)
	end
	
end 

function Digest:GetStartCinematic()
	return Digest.kShiftEchoEffect
end

function Digest:GetType()
	return Digest.kType
end

function Digest:GetLifeSpan()
	return Digest.klifeSpan
end

Shared.LinkClassToMap("Digest", Digest.kMapName, networkVars)