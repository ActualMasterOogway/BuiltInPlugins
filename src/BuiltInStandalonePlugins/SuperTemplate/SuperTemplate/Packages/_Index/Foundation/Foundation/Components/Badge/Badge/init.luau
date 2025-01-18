local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Components.Icon);
local v6 = require(l_script_FirstAncestor_0.Components.View);
local v7 = require(l_script_FirstAncestor_0.Components.Text);
local v8 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v9 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v10 = require(script.Parent.useBadgeVariants);
local v11 = require(l_script_FirstAncestor_0.Enums.BadgeVariant);
local v12 = require(l_script_FirstAncestor_0.Enums.BadgeSize);
local v13 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v14 = require(l_script_FirstAncestor_0.Enums.IconPosition);
local v15 = {
    variant = v11.Primary, 
    size = v12.Medium
};
return v2.memo(v2.forwardRef(function(v16, v17) --[[ Line: 42 ]] --[[ Name: Badge ]]
    -- upvalues: v8 (copy), v15 (copy), v3 (copy), v2 (copy), v14 (copy), v10 (copy), v6 (copy), v9 (copy), v5 (copy), v13 (copy), v7 (copy)
    local v18 = v8(v16, v15);
    local v19 = v3();
    local v20 = v2.useMemo(function() --[[ Line: 47 ]]
        -- upvalues: v18 (copy), v14 (ref)
        if typeof(v18.icon) == "string" then
            return {
                name = v18.icon, 
                position = v14.Left
            };
        else
            return v18.icon;
        end;
    end, {
        v18.icon
    });
    local v21 = v20 ~= nil;
    local v22 = false;
    if v18.text ~= nil then
        v22 = #v18.text > 0;
    end;
    local v23, v24, v25, v26, v27 = v10(v18.variant, v18.size, v21, v22);
    return v2.createElement(v6, v9(v18, {
        GroupTransparency = v18.isDisabled and 0.5 or nil, 
        backgroundStyle = v23.backgroundStyle, 
        stroke = {
            Color = v19.Color.Surface.Surface_100.Color3, 
            Transparency = v19.Color.Surface.Surface_100.Transparency
        }, 
        sizeConstraint = v24, 
        tag = v26, 
        ref = v17
    }), {
        Icon = if v20 ~= nil then v2.createElement(v5, {
            name = v20.name, 
            size = v13.Small, 
            style = v23.contentStyle, 
            LayoutOrder = v20.position == v14.Left and 1 or 3
        }) else nil, 
        Text = if v22 then v2.createElement(v7, {
            Text = v18.text, 
            textStyle = v23.contentStyle, 
            fontStyle = {
                LineHeight = 1
            }, 
            RichText = true, 
            LayoutOrder = 2, 
            sizeConstraint = v25, 
            tag = v27
        }) else nil
    });
end));