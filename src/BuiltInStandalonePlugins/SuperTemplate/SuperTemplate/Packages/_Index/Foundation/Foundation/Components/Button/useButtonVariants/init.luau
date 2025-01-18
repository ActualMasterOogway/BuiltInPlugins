local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.ButtonSize);
local v2 = require(l_script_FirstAncestor_0.Enums.ButtonVariant);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_script_FirstAncestor_0.Utility.composeStyleVariant);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v6 = require(l_script_FirstAncestor_0.Enums.IconSize);
local v7 = require(l_script_FirstAncestor_0.Providers.Style.VariantsContext);
local function _(v8) --[[ Line: 43 ]] --[[ Name: toStroke ]]
    return {
        Color = v8.Color3, 
        Transparency = v8.Transparency
    };
end;
local function v18(v10) --[[ Line: 50 ]]
    -- upvalues: v6 (copy), v1 (copy), v2 (copy)
    local v11 = {
        container = {
            tag = "row gap-xsmall align-y-center align-x-center clip"
        }, 
        icon = {
            size = v6.Medium
        }, 
        text = {
            tag = "size-0-full auto-x text-title-large text-truncate-end shrink"
        }
    };
    local v12 = {
        [v1.XSmall] = {
            container = {
                tag = "padding-small radius-small", 
                height = v10.Size.Size_700
            }
        }, 
        [v1.Small] = {
            container = {
                tag = "padding-small radius-medium", 
                height = v10.Size.Size_900
            }
        }, 
        [v1.Medium] = {
            container = {
                tag = "padding-medium radius-medium", 
                height = v10.Size.Size_1200
            }
        }
    };
    local v13 = {};
    local l_Emphasis_0 = v2.Emphasis;
    local v15 = {};
    local v16 = {
        tag = "bg-action-emphasis"
    };
    local l_Border_0 = v10.Color.ActionEmphasis.Border;
    v16.stroke = {
        Color = l_Border_0.Color3, 
        Transparency = l_Border_0.Transparency
    };
    v15.container = v16;
    v15.text = {
        tag = "content-action-emphasis"
    };
    v15.icon = {
        style = v10.Color.ActionEmphasis.Foreground
    };
    v13[l_Emphasis_0] = v15;
    l_Emphasis_0 = v2.SubEmphasis;
    v15 = {};
    v16 = {
        tag = "bg-action-sub-emphasis"
    };
    l_Border_0 = v10.Color.ActionSubEmphasis.Border;
    v16.stroke = {
        Color = l_Border_0.Color3, 
        Transparency = l_Border_0.Transparency
    };
    v15.container = v16;
    v15.text = {
        tag = "content-action-sub-emphasis"
    };
    v15.icon = {
        style = v10.Color.ActionSubEmphasis.Foreground
    };
    v13[l_Emphasis_0] = v15;
    l_Emphasis_0 = v2.Standard;
    v15 = {};
    v16 = {
        tag = "bg-action-standard"
    };
    l_Border_0 = v10.Color.ActionStandard.Border;
    v16.stroke = {
        Color = l_Border_0.Color3, 
        Transparency = l_Border_0.Transparency
    };
    v15.container = v16;
    v15.text = {
        tag = "content-action-standard"
    };
    v15.icon = {
        style = v10.Color.ActionStandard.Foreground
    };
    v13[l_Emphasis_0] = v15;
    l_Emphasis_0 = v2.Subtle;
    v15 = {};
    v16 = {
        tag = "bg-action-subtle"
    };
    l_Border_0 = v10.Color.ActionSubtle.Border;
    v16.stroke = {
        Color = l_Border_0.Color3, 
        Transparency = l_Border_0.Transparency
    };
    v15.container = v16;
    v15.text = {
        tag = "content-action-subtle"
    };
    v15.icon = {
        style = v10.Color.ActionSubtle.Foreground
    };
    v13[l_Emphasis_0] = v15;
    l_Emphasis_0 = v2.Alert;
    v15 = {};
    v16 = {
        tag = "bg-action-alert"
    };
    l_Border_0 = v10.Color.ActionAlert.Border;
    v16.stroke = {
        Color = l_Border_0.Color3, 
        Transparency = l_Border_0.Transparency
    };
    v15.container = v16;
    v15.text = {
        tag = "content-action-alert"
    };
    v15.icon = {
        style = v10.Color.ActionAlert.Foreground
    };
    v13[l_Emphasis_0] = v15;
    v13[v2.Text] = {
        text = {
            tag = "content-emphasis"
        }, 
        icon = {
            style = v10.Color.Content.Emphasis
        }
    };
    v13[v2.Link] = {
        text = {
            tag = "content-link"
        }, 
        icon = {
            style = v10.Color.Content.Link
        }
    };
    return {
        common = v11, 
        sizes = v12, 
        types = v13
    };
end;
return function(v19, v20, v21) --[[ Line: 166 ]]
    -- upvalues: v7 (copy), v18 (copy), v4 (copy)
    local v22 = v7.useVariants("Button", v18, v19);
    return v4(v22.common, v22.sizes[v20], v22.types[v21]);
end;