local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Dash);
local v4 = require(l_script_FirstAncestor_0.Components.View);
local v5 = require(l_script_FirstAncestor_0.Components.Text);
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local v7 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v8 = require(l_Parent_0.RbxDesignFoundations).Tokens.FoundationDark(1);
local l_Typography_0 = v8.Typography;
local l_NominalScale_0 = v8.Config.Text.NominalScale;
return {
    summary = "Text", 
    stories = {
        {
            name = "Typography", 
            story = function(v11) --[[ Line: 16 ]] --[[ Name: Story ]]
                -- upvalues: v7 (copy), l_NominalScale_0 (copy), v2 (copy), v4 (copy), v5 (copy)
                local l_typography_0 = v11.controls.typography;
                local v13 = v7();
                local v14 = v13.Typography[l_typography_0];
                local v15 = v14.FontSize / l_NominalScale_0;
                local v16 = v14.LineHeight * l_NominalScale_0;
                local v17 = v15 * v16;
                return v2.createElement(v4, {
                    tag = "auto-y size-full-0 col", 
                    layout = {
                        FillDirection = Enum.FillDirection.Vertical, 
                        Padding = UDim.new(0, v13.Margin.Medium)
                    }
                }, {
                    Metadata = v2.createElement(v4, {
                        LayoutOrder = 1, 
                        tag = "flex-between row auto-y size-full-0"
                    }, {
                        Title = v2.createElement(v5, {
                            Text = ("Typography.%*"):format(l_typography_0), 
                            tag = "content-default text-label-large auto-xy"
                        }), 
                        Size = v2.createElement(v5, {
                            Text = string.format("%dpx / %.1f (%dpx)", math.round(v15), v16, (math.round(v17))), 
                            tag = "content-default text-label-large auto-xy"
                        })
                    }), 
                    Inline = v2.createElement(v4, {
                        LayoutOrder = 2, 
                        tag = "col gap-small size-full-0 auto-y"
                    }, {
                        Title = v2.createElement(v5, {
                            Text = "Inline", 
                            tag = "content-emphasis text-caption-large auto-xy"
                        }), 
                        Paragraph = v2.createElement(v5, {
                            Text = v11.controls.inline, 
                            fontStyle = v14, 
                            tag = "content-emphasis text-truncate-end auto-xy text-align-x-left"
                        })
                    }), 
                    MultiLine = v2.createElement(v4, {
                        LayoutOrder = 3, 
                        tag = "col gap-small size-full-0 auto-y"
                    }, {
                        Title = v2.createElement(v5, {
                            Text = "Multi-line", 
                            tag = "content-emphasis text-caption-large auto-xy"
                        }), 
                        Paragraph = v2.createElement(v5, {
                            Text = v11.controls.multiline, 
                            fontStyle = v14, 
                            tag = "content-emphasis auto-xy text-wrap text-align-x-left"
                        })
                    })
                });
            end
        }
    }, 
    controls = {
        inline = "Let's prioritize the low-hanging fruit old boys club, performance review. Big data. let's unpack that later, but if you want to motivate these clowns, try less carrot and more stick.", 
        multiline = "Innovation is hot right now we need more paper, or please use \226\128\156solutionise\226\128\157 instead of solution ideas! Imagineer diversify KPIs. Put it on the parking lot we need to socialize the comms with the wider stakeholder community throughput. Let's circle back to that a tentative event rundown is attached for your reference, including other happenings on the day you are most welcome to join us beforehand for a light lunch we would also like to invite you to other activities on the day, including the interim and closing panel discussions on the intersection of businesses and social innovation. In this space make sure to include in your wheelhouse helicopter view. This proposal is a win-win situation which will cause a stellar paradigm shift, and produce a multi-fold increase in deliverables, conversational content; but let's not try to boil the ocean.", 
        typography = v3.keys(l_Typography_0)
    }
};