local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".History", {}, {
    l_createStyleRule_0("::UIPadding", {
        PaddingLeft = UDim.new(0, 15), 
        PaddingRight = UDim.new(0, 15)
    }), 
    l_createStyleRule_0("> #Title", {
        Size = UDim2.new(1, -50, 0, 32)
    }, {
        l_createStyleRule_0("> #FieldName", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            AutomaticSize = Enum.AutomaticSize.X
        })
    }), 
    l_createStyleRule_0("> #Graph", {
        Size = UDim2.new(1, 0, 1, -64), 
        Position = UDim2.fromOffset(0, 32), 
        BackgroundColor3 = "$BackgroundPaper", 
        BackgroundTransparency = 0
    }, {
        l_createStyleRule_0("> #Border", {
            Size = UDim2.new(1, -50, 1, 0), 
            BorderSizePixel = 1, 
            BorderColor3 = "$TextPrimary", 
            BackgroundColor3 = "$BackgroundPaper", 
            BackgroundTransparency = 0
        }), 
        l_createStyleRule_0("> #Rulers", {
            Size = UDim2.new(1, -51, 1, -2), 
            Position = UDim2.fromOffset(1, 1), 
            ClipsDescendants = true
        }, {
            l_createStyleRule_0("> .Ruler", {
                BackgroundColor3 = "$TextDisabled", 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0
            }), 
            l_createStyleRule_0("> .Axis", {
                BackgroundColor3 = "$TextPrimary"
            })
        }), 
        l_createStyleRule_0("> #Scale", {
            Size = UDim2.new(0, 50, 1, -2), 
            Position = UDim2.new(1, -48, 0, 1), 
            BackgroundTransparency = 1
        }, {}), 
        l_createStyleRule_0("> #Canvas", {
            Size = UDim2.new(1, -51, 1, -2), 
            Position = UDim2.fromOffset(1, 1), 
            BackgroundTransparency = 1
        }, {
            l_createStyleRule_0("> #NoHistoryData", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        })
    }), 
    l_createStyleRule_0("> #LegendBar", {
        AnchorPoint = Vector2.new(0, 1), 
        Size = UDim2.new(1, -50, 0, 32), 
        Position = UDim2.fromScale(0, 1)
    }, {}), 
    l_createStyleRule_0(">> .GraphColor", {
        BackgroundColor3 = "$PrimaryMain"
    }), 
    l_createStyleRule_0(">> .GraphColor1", {
        BackgroundColor3 = "$HistoryLegend1"
    }), 
    l_createStyleRule_0(">> .GraphColor2", {
        BackgroundColor3 = "$HistoryLegend2"
    }), 
    l_createStyleRule_0(">> .GraphColor3", {
        BackgroundColor3 = "$HistoryLegend3"
    }), 
    l_createStyleRule_0(">> .LegendColor1", {
        TextColor3 = "$HistoryLegend1"
    }), 
    l_createStyleRule_0(">> .LegendColor2", {
        TextColor3 = "$HistoryLegend2"
    }), 
    l_createStyleRule_0(">> .LegendColor3", {
        TextColor3 = "$HistoryLegend3"
    })
});