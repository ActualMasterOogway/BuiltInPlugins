local l_script_FirstAncestor_0 = script:FindFirstAncestor("ViewportToolingFramework");
local v1 = require(l_script_FirstAncestor_0.Parent.Framework);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Components.DEPRECATED_AvoidFOUC);
local v4 = require(l_script_FirstAncestor_0.Components.Button);
local v5 = require(l_script_FirstAncestor_0.Components.Label);
local v6 = require(l_script_FirstAncestor_0.Components.Radio);
local v7 = require(l_script_FirstAncestor_0.Components.Separator);
local v8 = require(l_script_FirstAncestor_0.Components.Slider);
local v9 = require(l_script_FirstAncestor_0.Components.SplitButton);
local v10 = require(l_script_FirstAncestor_0.Components.TextButton);
local v11 = require(l_script_FirstAncestor_0.Util.ToolbarBaseContext);
local _ = require(l_script_FirstAncestor_0.Types);
local v13 = require(l_script_FirstAncestor_0.Util.getToolbarDirection);
local v14 = require(l_script_FirstAncestor_0.Util.getToolbarItems);
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local v16 = require(l_script_FirstAncestor_0.Flags.getFFlagViewportToolingFrameworkSplitButtons);
local v17 = {
    Button = v4, 
    Label = v5, 
    Radio = v6, 
    Separator = v7, 
    Slider = v8, 
    SplitButton = v9, 
    TextButton = v10
};
return function(v18) --[[ Line: 40 ]] --[[ Name: ToolbarBase ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v14 (copy), v17 (copy), v2 (copy), v13 (copy), v11 (copy), v16 (copy), v1 (copy), v3 (copy)
    local v19 = {};
    local v20 = l_LayoutOrderIterator_0.new();
    for _, v22 in v14(v18) do
        local v23 = v17[v22.Type];
        if v23 == nil then
            error((("Unimplemented type: %*"):format(v22.Type)));
        end;
        table.insert(v19, v2.createElement(v23, {
            Item = v22, 
            NextOrder = function() --[[ Line: 55 ]] --[[ Name: NextOrder ]]
                -- upvalues: v20 (copy)
                return v20:getNextOrder();
            end
        }));
    end;
    local v24 = {
        Direction = v13(v18)
    };
    return v2.createElement(v11.Provider, {
        value = v24
    }, {
        ToolbarBase = if v16() then v2.createElement("Frame", {
            [v2.Tag] = v1.Styling.joinTags("VPF-ToolbarBase", v13(v18) == "Horizontal" and "X-Middle VPF-ToolbarBase--Horizontal" or "X-Center VPF-ToolbarBase--Vertical")
        }, v19) else v2.createElement(v3, {}, v2.createElement("Frame", {
            [v2.Tag] = v1.Styling.joinTags("VPF-ToolbarBase", v13(v18) == "Horizontal" and "X-Middle VPF-ToolbarBase--Horizontal" or "X-Center VPF-ToolbarBase--Vertical")
        }, v19))
    });
end;