local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework).Util.LayoutOrderIterator.new();
local v3 = require(l_script_FirstAncestor_0.Src.Util.MappingsContext);
return v1.memo(function() --[[ Line: 14 ]] --[[ Name: MappingsDialog ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    local l_latestErrorMessage_0 = v1.useContext(v3).latestErrorMessage;
    local v5, v6 = v1.useState(false);
    local v7 = v1.useRef(nil);
    local v8 = v1.useCallback(function() --[[ Line: 20 ]]
        -- upvalues: v6 (copy)
        v6(false);
    end, {
        v6
    });
    local v9 = v1.useMemo(function() --[[ Line: 24 ]]
        -- upvalues: l_latestErrorMessage_0 (copy)
        return l_latestErrorMessage_0;
    end, {});
    v1.useEffect(function() --[[ Line: 27 ]]
        -- upvalues: l_latestErrorMessage_0 (copy), v9 (copy), v6 (copy), v7 (copy), v8 (copy)
        if l_latestErrorMessage_0 and l_latestErrorMessage_0 ~= v9 then
            v6(true);
            if v7.current ~= nil then
                task.cancel(v7.current);
                v7.current = nil;
            end;
            v7.current = task.delay(4, function() --[[ Line: 34 ]]
                -- upvalues: v8 (ref), v7 (ref)
                v8();
                v7.current = nil;
            end);
        end;
    end, {
        l_latestErrorMessage_0, 
        v8, 
        v6, 
        v7
    });
    if v5 then
        return (v1.createElement("Frame", {
            [v1.Tag] = "Component-MappingsCollisionsBanner CX-Invisible X-Fill", 
            LayoutOrder = v2:getNextOrder()
        }, {
            BannerContents = v1.createElement("Frame", {
                LayoutOrder = v2:getNextOrder()
            }, {
                WarningText = v1.createElement("TextLabel", {
                    Text = tostring(l_latestErrorMessage_0), 
                    LayoutOrder = v2:getNextOrder()
                })
            })
        }));
    else
        return nil;
    end;
end);