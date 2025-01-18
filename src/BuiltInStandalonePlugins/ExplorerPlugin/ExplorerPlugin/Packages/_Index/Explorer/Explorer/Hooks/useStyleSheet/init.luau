local l_StylingService_0 = game:GetService("StylingService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v2 = require(l_script_FirstAncestor_0.Parent.Framework);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Resources.Style);
local v5 = require(l_script_FirstAncestor_0.Components.Contexts.ThemeContext);
local l_createStudioDesign_0 = v2.Styling.createStudioDesign;
return function() --[[ Line: 12 ]] --[[ Name: useStyleSheet ]]
    -- upvalues: v3 (copy), v5 (copy), l_StylingService_0 (copy), l_createStudioDesign_0 (copy), v4 (copy), l_script_FirstAncestor_0 (copy)
    local v7 = v3.useContext(v5.Context);
    local v10 = v3.useMemo(function() --[[ Line: 20 ]]
        -- upvalues: l_StylingService_0 (ref), l_createStudioDesign_0 (ref)
        local l_StudioDesign_0 = l_StylingService_0:FindFirstChild("StudioDesign");
        if l_StudioDesign_0 == nil then
            local v9 = l_createStudioDesign_0();
            v9.Parent = l_StylingService_0;
            return v9;
        else
            return l_StudioDesign_0;
        end;
    end, {
        v7.theme
    });
    local v15 = v3.useMemo(function() --[[ Line: 32 ]]
        -- upvalues: v4 (ref), v7 (copy), l_script_FirstAncestor_0 (ref), v10 (copy), l_StylingService_0 (ref)
        local v11 = v4.Base:Clone();
        local v12 = if v7.theme == "Dark" then v4.Dark:Clone() else v4.Light:Clone();
        v12.Parent = v11;
        for _, v14 in l_script_FirstAncestor_0.Components:GetDescendants() do
            if v14:IsA("ModuleScript") and v14.Name:match("%.style$") then
                v11:InsertStyleRule(require(v14):Clone());
            end;
        end;
        v11:SetDerives({
            v10.Design, 
            v12
        });
        v11.Parent = l_StylingService_0;
        return v11;
    end, {
        v10, 
        v7.theme
    });
    v3.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: v15 (copy)
        return function() --[[ Line: 54 ]]
            -- upvalues: v15 (ref)
            v15:Destroy();
        end;
    end, {
        v15
    });
    return v15;
end;