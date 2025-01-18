local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_omit_0 = v3.omit;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v4.UI;
local l_CaptureFocus_0 = l_UI_0.CaptureFocus;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local l_FakeLoadingBar_0 = l_UI_0.FakeLoadingBar;
local l_LoadingBar_0 = l_UI_0.LoadingBar;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local v15 = v1.PureComponent:extend("ProgressBar");
v15.renderFakeLoadingBar = function(v16, v17) --[[ Line: 31 ]] --[[ Name: renderFakeLoadingBar ]]
    -- upvalues: v2 (copy), l_omit_0 (copy), v1 (copy), l_FakeLoadingBar_0 (copy)
    local l_props_0 = v16.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_FakeLoadProps_0 = l_props_0.FakeLoadProps;
    local v21 = v2.Dictionary.join(l_omit_0(l_FakeLoadProps_0, "OnFakeLoadCompleted"), {
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.BarHeight), 
        LayoutOrder = v17
    });
    return v1.createElement(l_FakeLoadingBar_0, v21);
end;
v15.renderLoadingBar = function(v22, v23) --[[ Line: 44 ]] --[[ Name: renderLoadingBar ]]
    -- upvalues: v1 (copy), l_LoadingBar_0 (copy)
    local l_props_1 = v22.props;
    local l_Stylizer_1 = l_props_1.Stylizer;
    local l_Progress_0 = l_props_1.Progress;
    return v1.createElement(l_LoadingBar_0, {
        Size = UDim2.new(1, 0, 0, l_Stylizer_1.BarHeight), 
        LayoutOrder = v23, 
        Progress = l_Progress_0
    });
end;
v15.render = function(v27) --[[ Line: 56 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v1 (copy), l_CaptureFocus_0 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy)
    local l_props_2 = v27.props;
    local l_Text_0 = l_props_2.Text;
    local l_FakeLoadProps_1 = l_props_2.FakeLoadProps;
    local l_Stylizer_2 = l_props_2.Stylizer;
    local v32 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_CaptureFocus_0, {
        OnFocusLost = function() --[[ Line: 65 ]] --[[ Name: OnFocusLost ]]

        end
    }, {
        Pane = v1.createElement(l_Pane_0, {
            BackgroundColor3 = l_Stylizer_2.BackgroundColor, 
            BackgroundTransparency = l_Stylizer_2.BackgroundTransparency, 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            Padding = l_Stylizer_2.Padding
        }, {
            Text = v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                TextSize = l_Stylizer_2.TextSize, 
                Text = l_Text_0, 
                TextWrapped = true, 
                LayoutOrder = v32:getNextOrder()
            }), 
            ProgressBar = if l_FakeLoadProps_1 then v27:renderFakeLoadingBar(v32:getNextOrder()) else v27:renderLoadingBar(v32:getNextOrder())
        })
    });
end;
v15.didUpdate = function(v33, v34, _) --[[ Line: 91 ]] --[[ Name: didUpdate ]]
    local l_FakeLoadProps_2 = v34.FakeLoadProps;
    local l_FakeLoadProps_3 = v33.props.FakeLoadProps;
    if not l_FakeLoadProps_3 or not l_FakeLoadProps_3.Completed then
        return;
    else
        if (not l_FakeLoadProps_2 or l_FakeLoadProps_2.Completed ~= l_FakeLoadProps_3.Completed) and l_FakeLoadProps_3.OnFakeLoadCompleted then
            l_FakeLoadProps_3.OnFakeLoadCompleted();
        end;
        return;
    end;
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v15));