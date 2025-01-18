local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
return function(v2) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    local function v6(v3, v4) --[[ Line: 7 ]] --[[ Name: sendEvent ]]
        -- upvalues: v1 (ref), v2 (copy)
        local v5 = v4 or {};
        v5 = v1.Dictionary.join({
            studioSid = v2:GetSessionId(), 
            clientId = v2:GetClientId(), 
            placeId = game.PlaceId
        }, v5);
        v2:SendEventDeferred("studio", "RigGenerator", v3, v5);
    end;
    local function _(v7, v8) --[[ Line: 19 ]] --[[ Name: reportCounter ]]
        -- upvalues: v2 (copy)
        v8 = v8 or 1;
        v2:ReportCounter(v7, v8);
    end;
    return {
        rigInsert = function(v10, v11, v12) --[[ Line: 25 ]] --[[ Name: rigInsert ]]
            -- upvalues: v2 (copy), v6 (copy)
            local v13 = nil or 1;
            v2:ReportCounter("AvatarGeneratorRigInsert", v13);
            v6("Rig Generated", {
                rigName = v10, 
                rigType = v11.Name, 
                bodyShape = v12
            });
        end, 
        menuOpen = function() --[[ Line: 34 ]] --[[ Name: menuOpen ]]
            -- upvalues: v2 (copy)
            local v14 = nil or 1;
            v2:ReportCounter("AvatarGeneratorMenuOpen", v14);
        end, 
        menuClose = function() --[[ Line: 38 ]] --[[ Name: menuClose ]]
            -- upvalues: v2 (copy)
            local v15 = nil or 1;
            v2:ReportCounter("AvatarGeneratorMenuClose", v15);
        end, 
        menuCloseManual = function() --[[ Line: 42 ]] --[[ Name: menuCloseManual ]]
            -- upvalues: v2 (copy)
            local v16 = nil or 1;
            v2:ReportCounter("AvatarGeneratorMenuCloseManual", v16);
        end
    };
end;