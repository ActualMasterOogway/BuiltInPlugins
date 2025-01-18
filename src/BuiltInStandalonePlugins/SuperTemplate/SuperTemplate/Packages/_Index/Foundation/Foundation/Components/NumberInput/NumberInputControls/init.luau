local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Providers.Cursor.useCursor);
local v4 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local v6 = require(l_Components_0.View);
local v7 = require(l_Components_0.Image);
local function v12(v8) --[[ Line: 24 ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy), v6 (copy)
    local v9 = v4();
    local v10 = UDim.new(0, v9.Radius.Medium);
    local v11 = v3({
        radius = v10, 
        borderWidth = v9.Stroke.Thicker
    });
    return v2.createElement(v6, {
        onActivated = v8.onActivated, 
        Size = v8.size, 
        isDisabled = v8.isDisabled, 
        selection = {
            Selectable = not v8.isDisabled, 
            SelectionImageObject = v11
        }, 
        padding = v8.padding, 
        cornerRadius = v10, 
        tag = v8.tag
    }, v8.children);
end;
return function(v13) --[[ Line: 46 ]] --[[ Name: NumberInputControls ]]
    -- upvalues: v4 (copy), v2 (copy), v6 (copy), v12 (copy), v7 (copy)
    local v14 = v4();
    local v15 = (v14.Size.Size_800 - v14.Size.Size_150) / 2;
    return v2.createElement(v6, {
        tag = "size-800-full col", 
        LayoutOrder = v13.LayoutOrder
    }, {
        ControlUp = v2.createElement(v12, {
            onActivated = v13.up.onClick, 
            isDisabled = v13.up.isDisabled, 
            padding = {
                left = UDim.new(0, v15), 
                right = UDim.new(0, v15)
            }, 
            tag = "size-full fill padding-top-medium padding-bottom-xsmall"
        }, {
            Icon = v2.createElement(v7, {
                Image = "component_assets/triangleUp_16", 
                tag = "size-150-100 content-default"
            })
        }), 
        ControlDown = v2.createElement(v12, {
            tag = "size-full fill padding-top-xsmall", 
            onActivated = v13.down.onClick, 
            isDisabled = v13.down.isDisabled, 
            padding = {
                left = UDim.new(0, v15), 
                right = UDim.new(0, v15)
            }
        }, {
            Icon = v2.createElement(v7, {
                Image = "component_assets/triangleDown_16", 
                tag = "size-150-100 content-default"
            })
        })
    });
end;