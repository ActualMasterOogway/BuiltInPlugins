local v0 = require(script.Parent.isAssetIdLike);
local v1 = require(script.Parent.normalizeAssetId);
local v2 = require(script.Parent.findAssetIdsInSource);
local v3 = {
    game:GetService("Workspace"), 
    game:GetService("ReplicatedFirst"), 
    game:GetService("ReplicatedStorage"), 
    game:GetService("ServerStorage"), 
    game:GetService("ServerScriptService"), 
    game:GetService("Lighting"), 
    game:GetService("StarterGui"), 
    game:GetService("StarterPack"), 
    game:GetService("StarterPlayer"), 
    game:GetService("SoundService"), 
    game:GetService("Teams")
};
local _ = require(script.Parent.Parent.Types);
local v13 = {
    Sound = function(v5) --[[ Line: 28 ]] --[[ Name: Sound ]]
        -- upvalues: v1 (copy)
        local l_SoundId_0 = v5.SoundId;
        if l_SoundId_0 == "" or l_SoundId_0 == "0" or l_SoundId_0 == " " then
            return nil;
        else
            local v7 = v1(l_SoundId_0);
            if v7 then
                return {
                    v7
                };
            else
                return nil;
            end;
        end;
    end, 
    LuaSourceContainer = function(v8) --[[ Line: 43 ]] --[[ Name: LuaSourceContainer ]]
        -- upvalues: v2 (copy)
        if v8.Parent.Name:lower() == "boombox" then
            return nil;
        else
            return v2(v8.Source);
        end;
    end, 
    StringValue = function(v9) --[[ Line: 51 ]] --[[ Name: StringValue ]]
        -- upvalues: v1 (copy), v0 (copy)
        local v10 = v1(v9.Value);
        if v10 and v0(v10) then
            return {
                v10
            };
        else
            return nil;
        end;
    end, 
    IntValue = function(v11) --[[ Line: 58 ]] --[[ Name: IntValue ]]
        -- upvalues: v0 (copy)
        local v12 = tostring(v11.Value);
        if v0(v12) then
            return {
                v12
            };
        else
            return nil;
        end;
    end
};
local v14 = {};
local function v19(v15) --[[ Line: 71 ]] --[[ Name: getHandlerFunc ]]
    -- upvalues: v14 (copy), v13 (copy)
    local v16 = v14[v15.ClassName];
    if not v16 then
        for v17, _ in pairs(v13) do
            if v15:IsA(v17) then
                v16 = v17;
            end;
        end;
        if not v16 then
            v16 = "Instance";
        end;
        v14[v15.ClassName] = v16;
    end;
    return v13[v16];
end;
return function() --[[ Line: 90 ]] --[[ Name: findAllAssetIds ]]
    -- upvalues: v3 (copy), v19 (copy)
    local v20 = {};
    local v21 = 0;
    for _, v23 in ipairs(v3) do
        for _, v25 in ipairs(v23:GetDescendants()) do
            local v26 = v19(v25);
            if v26 then
                local v27 = v26(v25);
                if v27 then
                    for _, v29 in ipairs(v27) do
                        local v30 = v20[v29];
                        if v30 then
                            table.insert(v30, v25);
                        else
                            v20[v29] = {
                                v25
                            };
                            v21 = v21 + 1;
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v20;
end;