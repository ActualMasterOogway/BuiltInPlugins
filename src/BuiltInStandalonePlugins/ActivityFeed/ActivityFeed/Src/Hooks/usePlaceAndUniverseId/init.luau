local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = false;
local v3 = nil;
return function(v4) --[[ Line: 8 ]] --[[ Name: usePlaceAndUniverseId ]]
    -- upvalues: v2 (ref), v3 (ref), v1 (copy)
    if not v2 then
        v2 = true;
        v3 = Instance.new("BindableEvent");
        assert(v3);
        v4:OnInvoke("idsupdated", function() --[[ Line: 13 ]]
            -- upvalues: v3 (ref)
            v3:Fire();
        end);
    end;
    assert(v3);
    local v5, v6 = v1.useState(0);
    local v7, v8 = v1.useState(0);
    local function _() --[[ Line: 23 ]] --[[ Name: setIds ]]
        -- upvalues: v4 (copy), v6 (copy), v8 (copy)
        local l_v4_Item_0 = v4:GetItem("placeid");
        local l_v4_Item_1 = v4:GetItem("universeid");
        v6(l_v4_Item_0);
        v8(l_v4_Item_1);
    end;
    v1.useEffect(function() --[[ Line: 30 ]]
        -- upvalues: v4 (copy), v6 (copy), v8 (copy), v3 (ref)
        local l_v4_Item_2 = v4:GetItem("placeid");
        local l_v4_Item_3 = v4:GetItem("universeid");
        v6(l_v4_Item_2);
        v8(l_v4_Item_3);
        l_v4_Item_2 = v3.Event:Connect(function() --[[ Line: 32 ]]
            -- upvalues: v4 (ref), v6 (ref), v8 (ref)
            local l_v4_Item_4 = v4:GetItem("placeid");
            local l_v4_Item_5 = v4:GetItem("universeid");
            v6(l_v4_Item_4);
            v8(l_v4_Item_5);
        end);
        return function() --[[ Line: 35 ]]
            -- upvalues: l_v4_Item_2 (copy)
            l_v4_Item_2:Disconnect();
        end;
    end, {});
    return v5, v7;
end;