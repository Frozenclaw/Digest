--Log("------------------AlienStructureEffects Loaded-------------------")
local kAlienStructureEffects =
{ 
	digest_start =
    {
        digestStartEffects =
        {
            {sound = "sound/NS2.fev/marine/structures/recycle"},
        },        
    },

    digest_end =
    {
        digestEndEffects =
        {
            {cinematic = "cinematics/marine/structures/recycle.cinematic"},
        },        
    }
	
}

GetEffectManager():AddEffectData("AlienStructureEffects", kAlienStructureEffects)