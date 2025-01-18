local l_PlayerEmulatorService_0 = game:GetService("PlayerEmulatorService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Util.Constants);
local v4 = require(l_Parent_0.Src.Actions.UpdatePolicySettingStatus);
local v5 = require(l_Parent_0.Src.Actions.LoadAllPolicyValues);
local function _(v6) --[[ Line: 9 ]] --[[ Name: firstToUpper ]]
    return (v6:gsub("^%l", string.upper));
end;
return function(v8, v9, v10) --[[ Line: 13 ]]
    -- upvalues: v3 (copy), v2 (copy), v5 (copy), l_PlayerEmulatorService_0 (copy), v4 (copy)
    return function(v11) --[[ Line: 14 ]]
        -- upvalues: v10 (copy), v3 (ref), v8 (copy), v9 (copy), v2 (ref), v5 (ref), l_PlayerEmulatorService_0 (ref), v4 (ref)
        local v12 = {};
        local v13 = {};
        local v14 = v10:GetSetting(v3.POLICY_SETTING_KEY) or {};
        for v15, v16 in pairs(v8) do
            if type(v16) == "table" then
                table.sort(v16);
            end;
            v12[v15:gsub("^%l", string.upper)] = v16;
            if v14[v15:gsub("^%l", string.upper)] ~= nil then
                v13[v15:gsub("^%l", string.upper)] = v14[v15:gsub("^%l", string.upper)];
            elseif v9[v15] ~= nil then
                v13[v15:gsub("^%l", string.upper)] = v9[v15];
            else
                v13[v15:gsub("^%l", string.upper)] = v16;
            end;
        end;
        local v17 = v2.Dictionary.keys(v12);
        table.sort(v17);
        v11:dispatch(v5(v12, v17));
        l_PlayerEmulatorService_0:SetEmulatedPolicyInfo(v13);
        v11:dispatch(v4(v13));
    end;
end;