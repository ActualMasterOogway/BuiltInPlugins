local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v1.useState;
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_joinTags_0 = v3.Styling.joinTags;
local l_Localization_0 = v3.ContextServices.Localization;
local l_counter_0 = v3.Util.counter;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v8 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagAddTestModeDropDown)();
local v9 = UDim2.new(0, 73, 0, 28);
return function(v10) --[[ Line: 29 ]] --[[ Name: SegmentedButton ]]
    -- upvalues: l_useState_0 (copy), l_counter_0 (copy), l_Localization_0 (copy), v8 (copy), v1 (copy), v9 (copy), l_joinTags_0 (copy)
    local l_Items_0 = v10.Items;
    local v12, v13 = l_useState_0(v10.SelectedIndex);
    local v14, v15 = l_useState_0(-1);
    local v16 = {};
    local v17 = l_counter_0();
    local v18 = l_Localization_0:use();
    for v19, v20 in v10.Items do
        local v21 = typeof(v20) == "table";
        local v22 = if v21 then v20.Id else v20;
        local v23 = if v21 then if v8 then (not (v20.Text ~= nil) or v20.Text == "") and "" or v18:getText("Plugin", v20.Text) else v20.Text else v20;
        local v24 = v12 == v19;
        local v25 = v14 == v19;
        v16[v22] = v1.createElement("Frame", {
            LayoutOrder = v17(), 
            Size = v9, 
            [v1.Tag] = l_joinTags_0("X-Fit StateLayer", v25 and "State-Pressed" or nil)
        }, {
            Option = v1.createElement("TextButton", {
                [v1.Event.InputBegan] = function(_, v27) --[[ Line: 54 ]]
                    -- upvalues: v15 (copy), v19 (copy), v24 (copy), v10 (copy), v21 (copy), v20 (copy), v13 (copy)
                    if v27.UserInputType == Enum.UserInputType.MouseButton1 then
                        v15(v19);
                    end;
                    if not v24 and v27.UserInputType == Enum.UserInputType.MouseButton1 then
                        v10.OnItemActivated(if v21 then v20 else v19, v10.Uri);
                        v13(v19);
                    end;
                end, 
                [v1.Event.InputEnded] = function(_, v29) --[[ Line: 63 ]]
                    -- upvalues: v15 (copy)
                    if v29.UserInputType == Enum.UserInputType.MouseButton1 then
                        v15(-1);
                    end;
                end, 
                Text = v23, 
                Size = v9, 
                [v1.Tag] = l_joinTags_0("X-Fit", v24 and "State-Selected" or "State-Default")
            })
        });
        if v19 < #l_Items_0 then
            v16[v22 .. "Separator"] = v1.createElement("Frame", {
                LayoutOrder = v17(), 
                [v1.Tag] = "Role-Surface X-Fit Role-DividerV Small"
            }, {
                Divider = v1.createElement("Frame")
            });
        end;
    end;
    return v1.createElement("Frame", {
        [v1.Tag] = "Component-RibbonSegmentedButton X-Fit"
    }, {
        SegmentedButton = v1.createElement("CanvasGroup", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            [v1.Tag] = "X-Row"
        }, v16)
    });
end;