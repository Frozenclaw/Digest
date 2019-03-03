-- ======= Copyright (c) 2003-2011, Unknown Worlds Entertainment, Inc. All rights reserved. =======
--
-- lua\Armory.lua
--
--    Created by:   Charlie Cleveland (charlie@unknownworlds.com)
--
-- ========= For more information, visit us at http://www.unknownworlds.com =====================



function Crag:GetTechButtons(techId)

    return { kTechId.HealWave, kTechId.Move, kTechId.CragHeal, kTechId.None,
             kTechId.None, kTechId.None, kTechId.None, kTechId.Digest }

end