local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Src.Util.Constants);
local _ = require(l_Parent_0.Src.Types);
local v4 = require(l_Parent_0.Src.Flags.getFFlagDebugAvatarPreviewerAvoidSerialization);
return function(v5, v6, v7, v8, v9) --[[ Line: 13 ]] --[[ Name: useSerializedEffect ]]
    -- upvalues: v1 (copy), v2 (copy), v4 (copy)
    local v10 = v1.useMemo(function() --[[ Line: 20 ]]
        -- upvalues: v7 (copy)
        return v7;
    end, {
        v6
    });
    local v11 = v2.ATTRIBUTE_PREFIX .. v6;
    local v12 = v1.useRef(v7);
    local v13 = v1.useRef(false);
    local v14 = v1.useCallback(function() --[[ Line: 29 ]]
        -- upvalues: v4 (ref), v5 (copy), v11 (copy), v9 (copy), v12 (copy)
        if v4() then
            return;
        else
            v5:SetAttribute(v11, if v9 and v12.current ~= nil then v9.serialize(v12.current) else v12.current);
            return;
        end;
    end, {
        v11, 
        v9, 
        v5
    });
    v1.useEffect(function() --[[ Line: 40 ]]
        -- upvalues: v4 (ref), v5 (copy), v11 (copy), v8 (copy), v10 (copy), v9 (copy), v13 (copy), v14 (copy)
        local v15 = if v4() then nil else v5:GetAttribute(v11);
        if v15 == nil then
            v8(v10);
        else
            v8(if v9 then v9.deserialize(v15) else v15);
        end;
        v13.current = true;
        return v14;
    end, {
        v5, 
        v11, 
        v8, 
        v9, 
        v10, 
        v14
    });
    v1.useEffect(function() --[[ Line: 56 ]]
        -- upvalues: v13 (copy), v12 (copy), v7 (copy), v14 (copy)
        if not v13.current then
            return;
        else
            v12.current = v7;
            v14();
            return;
        end;
    end, {
        v7
    });
end;