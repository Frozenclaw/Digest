--Log("------------------Digest Loaded-------------------")
DigestMixin = CreateMixin(DigestMixin)
DigestMixin.type = "Digest"

local kDigestEffectDuration = 2

DigestMixin.expectedCallback =
{
}

DigestMixin.optionalCallbacks =
{
	GetCanDigestOverride = "Return custom restrictions for recycling."
}

DigestMixin.expectedMixins = 
{
	Research = "Required for recycle progress / cancellation."
}

DigestMixin.networkVars =
{
	digested = "boolean"
}

function DigestMixin:__initmixin()
	self.digested = false
end 

function DigestMixin:GetDigestActive()
	return self.researchingId == kTechId.Digest
end

function DigestMixin:OnDigested()
end

function DigestMixin:GetCanDigest()

	local canDigest = true
	
	if self.GetCanDigestOverride then
		canDigest = self:GetCanDigestOverride()
	end
	
	return canDigest and not self:GetDigestActive()
	
end

function DigestMixin:OnResearchComplete(researchId)

	if researchId == kTechId.Digest then
		
		if GetConcedeSequenceActive() then
			return
		end 
	
	
		self:TriggerEffects("digest_end")
	
		local team = self:GetTeam()
		local deathMessageTable = team:GetDeathMessage(team:GetCommander(), kDeathMessageIcon.Recycled, self)
		team:ForEachPlayer(function(player) Server.SendNetworkMessage(player:GetClient(), "DeathMessage", deathMessageTable, true) end)
    
		self.digested = true
		self.timeDigested = Shared.GetTime()
	
		self:OnDigested()
		
	end
	
end

function DigestMixin:GetIsDigested()
	return self.digested
end

function DigestMixin:GetIsDigesting()
	return self.researchingId == kTechId.Digest
end

function DigestMixin:OnResearch(researchId)

	if researchId == kTechId.Digest then
		self:TriggerEffects("digest_start")
		if self.MarkBlipDirty then
			self:MarkBlipDirty()
		end
	end
	
end

function DigestMixin:OnResearchCancel(researchId)

	if researchId == kTechId.Digest then
		if self.MarkBlipDirty then
			self:MarkBlipDirty()
		end
	end
	
end

function DigestMixin:OnUpdateRender()

	PROFILE("DigestMixin:OnUpdateRender")
	
	if self.digested ~= self.clientDigested then
	
		self.clientDigested = self.digested
		self:SetOpacity(1, "digestAmount")
		
		if self.digested then
			self.clientTimeDigestStarted = Shared.GetTime()
		else
			self.clientTimeDigestStarted = nil
		end
		
	end
	
	if self.clientTimeDigestStarted then
	
		local digestAmount = 1 - Clamp((Shared.GetTime() - self.clientTimeDigestStarted) / kDigestEffectDuration, 0, 1)
        self:SetOpacity(digestAmount, "digestAmount")
		
	end
	
end

local function SharedUpdate(self, deltaTime)

    if Server then
    
        if self.timeDigested then
        
            if self.timeDigested + kDigestEffectDuration + 1 < Shared.GetTime() then
                DestroyEntity(self)
            end
        
        elseif self.researchingId == kTechId.Digest then
            self:UpdateResearch(deltaTime)
        end
        

    end
    
end

function DigestMixin:OnUpdateAnimationInput(modelMixin)

    PROFILE("DigestMixin:OnUpdateAnimationInput")
    modelMixin:SetAnimationInput("digesting", self:GetDigestActive())
    
end

function DigestMixin:OnUpdate(deltaTime)
    SharedUpdate(self, deltaTime)
end

function DigestMixin:OnProcessMove(input)
    SharedUpdate(self, input.time)
end

	