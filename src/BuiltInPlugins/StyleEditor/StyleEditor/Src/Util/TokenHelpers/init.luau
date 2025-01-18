local l_StylingService_0 = game:GetService("StylingService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Dash);
local l_assign_0 = v2.assign;
local l_includes_0 = v2.includes;
local l_omit_0 = v2.omit;
local l_reverse_0 = v2.reverse;
local v7 = require(l_Parent_0.Src.Enums.TokenValidationError);
local _ = require(l_Parent_0.Src.Types);
local v9 = {};
v9.getTokenValue = function(v10, v11) --[[ Line: 19 ]] --[[ Name: getTokenValue ]]
    -- upvalues: v9 (copy)
    local v12 = v9.getAllAttributes(v10);
    return v9.evaluateToken(v12, v11);
end;
v9.getDerivedAttributes = function(v13) --[[ Line: 24 ]] --[[ Name: getDerivedAttributes ]]
    -- upvalues: l_StylingService_0 (copy), l_assign_0 (copy), v9 (copy)
    local v14 = {};
    if not v13 then
        return v14;
    else
        assert(v13 ~= nil, "styleInstance cannot be invalid");
        if v13:IsA("StyleSheet") then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 32 ]]
                -- upvalues: l_StylingService_0 (ref), v13 (copy)
                return l_StylingService_0:GetStyleSheetDerivesChain(v13);
            end);
            if l_status_0 then
                for _, v18 in pairs(l_result_0) do
                    if v18 ~= v13 then
                        v14 = l_assign_0(v14, v18:GetAttributes());
                    end;
                end;
                return v14;
            end;
        elseif v13:IsA("StyleRule") then
            v14 = v9.getDerivedAttributes(v13.Parent);
        end;
        return v14;
    end;
end;
v9.getAllAttributes = function(v19) --[[ Line: 53 ]] --[[ Name: getAllAttributes ]]
    -- upvalues: v9 (copy), l_assign_0 (copy)
    if not v19 then
        return {};
    else
        assert(v19 ~= nil, "styleInstance cannot be invalid");
        local v20 = v9.getDerivedAttributes(v19);
        if v19:IsA("StyleBase") then
            v20 = l_assign_0(v20, v19:GetAttributes());
        end;
        return v20;
    end;
end;
v9.getTokenSourceStyleSheet = function(v21, v22) --[[ Line: 68 ]] --[[ Name: getTokenSourceStyleSheet ]]
    -- upvalues: v9 (copy), l_reverse_0 (copy), l_StylingService_0 (copy)
    local v23 = false;
    if typeof(v21) == "Instance" then
        v23 = v21:IsA("StyleBase");
    end;
    assert(v23, "expecting valid StyleBase");
    local v24 = v9.parseAttributeName(v22);
    if not v24 then
        return nil;
    else
        assert(v24 ~= nil, "invalid attribute name");
        v23 = if v21:IsA("StyleSheet") then v21 else v21:FindFirstAncestorWhichIsA("StyleSheet");
        if not v23 then
            return nil;
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 82 ]]
                -- upvalues: l_reverse_0 (ref), l_StylingService_0 (ref), v23 (copy)
                return l_reverse_0(l_StylingService_0:GetStyleSheetDerivesChain(v23));
            end);
            if not l_status_1 then
                return nil;
            else
                for _, v28 in l_result_1 do
                    if v28:GetAttribute(v24) then
                        return v28;
                    end;
                end;
                return nil;
            end;
        end;
    end;
end;
v9.parseAttributeName = function(v29) --[[ Line: 98 ]] --[[ Name: parseAttributeName ]]
    if not v29 or typeof(v29) ~= "string" then
        return nil;
    else
        return v29:match("^%s*%$([%a%d%-_]*)%s*$");
    end;
end;
v9.evaluateToken = function(v30, v31) --[[ Line: 106 ]] --[[ Name: evaluateToken ]]
    -- upvalues: v9 (copy), v7 (copy)
    local l_v31_0 = v31;
    local v33 = {};
    for _ = 1, 15 do
        local v35 = v9.parseAttributeName(l_v31_0);
        if v35 then
            if v33[l_v31_0] then
                return nil, v7.CyclicReference;
            else
                v33[l_v31_0] = true;
                l_v31_0 = v30[v35];
                if l_v31_0 == nil then
                    break;
                end;
            end;
        else
            break;
        end;
    end;
    if l_v31_0 == nil then
        return nil, v7.DoesNotExist;
    else
        return l_v31_0, v7.None;
    end;
end;
v9.validateToken = function(v36, v37, v38) --[[ Line: 137 ]] --[[ Name: validateToken ]]
    -- upvalues: v9 (copy), v7 (copy), l_includes_0 (copy)
    if not v9.parseAttributeName(v37) then
        return nil, v7.InvalidSyntax;
    else
        local v39, v40 = v9.evaluateToken(v36, v37);
        if v40 ~= v7.None then
            return v39, v40;
        elseif v38 and not l_includes_0(v38, (typeof(v39))) then
            return v39, v7.IncorrectType;
        else
            return v39, v7.None;
        end;
    end;
end;
v9.stripStyleEditorMetaAttributes = function(v41) --[[ Line: 158 ]] --[[ Name: stripStyleEditorMetaAttributes ]]
    -- upvalues: l_omit_0 (copy)
    assert(typeof(v41) == "table", "array expected");
    return l_omit_0(v41, {
        "StyleCategory"
    });
end;
return v9;