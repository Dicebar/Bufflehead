local MOD = Bufflehead
local SHIM = MOD.SHIM
local UnitAura = UnitAura

-- C_Addons
function SHIM:LoadAddOn(name)
	if _G.C_AddOns.LoadAddOn ~= nil then
		return C_AddOns.LoadAddOn(name)
	end

	return LoadAddOn(name)
end

-- C_UnitAuras
function SHIM:UnitAura(unitToken, index, filter)
    if _G.C_UnitAuras.GetAuraDataByIndex ~= nil then
        local info = C_UnitAuras.GetAuraDataByIndex(unitToken, index, filter)

        if info == nil then
            return nil
        end

        return info.name,
            info.icon,
            info.applications,
            info.dispelName,
            info.duration,
            info.expirationTime
    end

    return UnitAura(unitToken, index, filter)
end
