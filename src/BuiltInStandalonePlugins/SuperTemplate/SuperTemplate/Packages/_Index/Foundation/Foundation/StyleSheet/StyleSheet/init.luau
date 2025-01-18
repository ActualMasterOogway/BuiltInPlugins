local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_1 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_0.StyleRule);
local _ = require(l_Parent_0.generateRules);
local v6 = require(l_script_FirstAncestor_0.Utility.useGeneratedRules);
local _ = require(l_script_FirstAncestor_0.Enums.Theme);
local _ = require(l_script_FirstAncestor_0.Enums.Device);
local function v14(v9, v10, v11) --[[ Line: 22 ]] --[[ Name: insertRule ]]
    -- upvalues: v3 (copy), v4 (copy)
    local l_properties_0 = v10.properties;
    local v13 = ("." .. v11) .. (if v10.modifier ~= nil then ":" .. v10.modifier else "") .. if v10.pseudo ~= nil then " ::" .. v10.pseudo else "";
    table.insert(v9, (not (v11 ~= "gui-object-defaults" and v11 ~= "text-defaults" and v11 ~= "text-size-defaults") or v11 == "text-color-defaults") and 1 or #v9 + 1, v3.createElement(v4, {
        key = v13, 
        Selector = v13, 
        properties = l_properties_0
    }));
end;
local function v23(v15, v16) --[[ Line: 46 ]] --[[ Name: createRules ]]
    -- upvalues: v14 (copy)
    local v17 = {};
    for v18, _ in v16 do
        local v20 = v15[v18];
        if v20 ~= nil then
            v14(v17, v20, v18);
            if v20.children then
                for _, v22 in v20.children do
                    v14(v17, v22, v22.tag);
                end;
            end;
        end;
    end;
    return v17;
end;
return v3.memo(function(v24) --[[ Line: 76 ]] --[[ Name: StyleSheet ]]
    -- upvalues: v3 (copy), v6 (copy), v23 (copy)
    local v25 = v3.useRef(nil);
    local v26 = v6(v24.theme, v24.device, v24.DONOTUSE_colorUpdate == true);
    v3.useLayoutEffect(function() --[[ Line: 81 ]]
        -- upvalues: v25 (copy), v24 (copy)
        if v25.current then
            v25.current:SetDerives(v24.derives or {});
        end;
    end, {
        v24.derives
    });
    return v3.createElement(v3.Fragment, nil, {
        FoundationStyleSheet = v3.createElement("StyleSheet", {
            ref = v25
        }, (v23(v26, v24.tags))), 
        FoundationStyleLink = v3.createElement("StyleLink", {
            StyleSheet = v25
        })
    });
end);