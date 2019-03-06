--Log("------------------ConcedeSequence Loaded-------------------")
if Server then
    
    
    local function KillAppropriately(ent)
        
        -- Don't kill things that are being recycled.
        if HasMixin(ent, "Digest") and ent:GetIsDigested() then
            return
        end
        
        
    end

end 