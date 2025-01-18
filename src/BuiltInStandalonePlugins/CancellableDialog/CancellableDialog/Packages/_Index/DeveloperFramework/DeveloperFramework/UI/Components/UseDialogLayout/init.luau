local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Util.React);
local v2 = require(l_Parent_0.Util.counter);
local v3 = require(l_Parent_0.Styling.joinTags);
local v4 = require(l_Parent_0.Styling.supportsStyleSheets);
local v5 = require(l_Parent_0.TestHelpers.isTestEnvironment);
local v6 = require(script.styles);
local v7 = v6:GetAttribute("IconSize").X.Offset + v6:GetAttribute("IconToContentPadding").Offset;
local v8 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkMakeBodyOptionalForUseDialogLayout);
local v9 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkFixUseDialogLayoutResizing);
return function(v10) --[[ Line: 40 ]] --[[ Name: Layout ]]
    -- upvalues: v4 (copy), v5 (copy), v1 (copy), v2 (copy), v9 (copy), v3 (copy), v7 (copy), v8 (copy)
    assert(v4 or v5(), "UseDialogLayout requires StyleSheets support");
    local l_children_0 = v10.children;
    local v12 = v10[v1.Tag];
    local v13 = v2();
    return v1.createElement("Frame", {
        Size = if v9() then UDim2.fromOffset(v10.Width, 1) else UDim2.fromOffset(v10.Width, 0), 
        [v1.Tag] = v3(v12, "Component-UseDialogLayout X-Row X-FitY"), 
        [v1.Change.AbsoluteSize] = function(v14) --[[ Line: 52 ]]
            -- upvalues: v10 (copy)
            v10.OnSizeChanged(v14.AbsoluteSize);
        end
    }, {
        Icon = v1.createElement("ImageLabel", {
            LayoutOrder = v13()
        }), 
        Content = v1.createElement("Frame", {
            LayoutOrder = v13(), 
            Size = UDim2.new(1, -v7, 0, 0), 
            [v1.Tag] = "X-Column X-FitY"
        }, {
            Text = v1.createElement("Frame", {
                LayoutOrder = v13(), 
                [v1.Tag] = "X-Column X-FitY"
            }, {
                Heading = v1.createElement("TextLabel", {
                    LayoutOrder = v13(), 
                    Text = v10.Heading, 
                    [v1.Tag] = "X-FitY"
                }), 
                Body = if v8() then v10.Body and v1.createElement("TextLabel", {
                    LayoutOrder = v13(), 
                    Text = v10.Body, 
                    [v1.Tag] = "X-FitY"
                }) else v1.createElement("TextLabel", {
                    LayoutOrder = v13(), 
                    Text = v10.Body, 
                    [v1.Tag] = "X-FitY"
                })
            }), 
            Children = if v1.Children.count(l_children_0) > 0 then v1.createElement("Frame", {
                LayoutOrder = v13(), 
                [v1.Tag] = "X-Column X-FitY"
            }, l_children_0) else nil, 
            Buttons = v1.createElement("Frame", {
                LayoutOrder = v13(), 
                [v1.Tag] = "X-FitY"
            }, {
                Tertiary = if v10.ActionTertiary then v1.createElement("TextButton", {
                    Text = v10.ActionTertiary.Label, 
                    [v1.Tag] = v3("Tertiary X-Corner X-Fit", v10.ActionTertiary.Enabled and "Enabled" or "Disabled"), 
                    [v1.Event.Activated] = if v10.ActionTertiary.Enabled then v10.ActionTertiary.OnActivated else nil
                }) else nil, 
                RightAnchoredButtons = v1.createElement("Frame", {
                    [v1.Tag] = "X-Row X-FitY"
                }, {
                    Secondary = if v10.ActionSecondary then v1.createElement("TextButton", {
                        LayoutOrder = v13(), 
                        Text = v10.ActionSecondary.Label, 
                        [v1.Tag] = v3("Secondary X-Corner X-Fit", v10.ActionSecondary.Enabled and "Enabled" or "Disabled"), 
                        [v1.Event.Activated] = if v10.ActionSecondary.Enabled then v10.ActionSecondary.OnActivated else nil
                    }) else nil, 
                    Primary = if v10.ActionPrimary then v1.createElement("TextButton", {
                        LayoutOrder = v13(), 
                        Text = v10.ActionPrimary.Label, 
                        [v1.Tag] = v3("Primary X-Corner X-Fit", v10.ActionPrimary.Enabled and "Enabled" or "Disabled"), 
                        [v1.Event.Activated] = if v10.ActionPrimary.Enabled then v10.ActionPrimary.OnActivated else nil
                    }) else nil
                })
            })
        })
    });
end;