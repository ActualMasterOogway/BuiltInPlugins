local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.React);
local v2 = require(l_Parent_0.Styling.supportsStyleSheets);
local v3 = require(l_Parent_0.UI.Components.Breadcrumb);
local v4 = v1.PureComponent:extend("BreadcrumbStory");
v4.init = function(v5) --[[ Line: 9 ]] --[[ Name: init ]]
    v5.state = {
        Editing = false, 
        Text = v5.props.InitialText
    };
    v5.onEdited = function(v6) --[[ Line: 14 ]]
        -- upvalues: v5 (copy)
        v5:setState({
            Editing = false, 
            Text = v6
        });
    end;
    v5.onPressed = function() --[[ Line: 20 ]]
        -- upvalues: v5 (copy)
        if v5.props.Editable then
            v5:setState({
                Editing = true
            });
        end;
    end;
end;
v4.render = function(v7) --[[ Line: 29 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy)
    local l_props_0 = v7.props;
    return v1.createElement(v3, {
        Delimiters = {
            "%.%.", 
            "%."
        }, 
        Editing = v7.state.Editing, 
        GetImageProps = if l_props_0.Images then v3.GetSelectorIcon else nil, 
        OnPressed = v7.onPressed, 
        OnEdited = if l_props_0.Editable then v7.onEdited else nil, 
        Text = v7.state.Text, 
        Size = UDim2.fromOffset(300, 24), 
        [v1.Tag] = l_props_0[v1.Tag]
    });
end;
return {
    stories = {
        {
            name = "Single Element", 
            story = function() --[[ Line: 47 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v4 (copy)
                return v1.createElement(v4, {
                    InitialText = "Image"
                });
            end
        }, 
        {
            name = "Multiple Elements", 
            story = function() --[[ Line: 55 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v4 (copy)
                return v1.createElement(v4, {
                    InitialText = "Frame.Contents.0.Image"
                });
            end
        }, 
        {
            name = "Images", 
            story = function() --[[ Line: 63 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v4 (copy)
                return v1.createElement(v4, {
                    InitialText = "Frame $Dialog .. TextButton $Main . ImageLabel", 
                    Images = true
                });
            end
        }, 
        {
            name = "Editable", 
            story = function() --[[ Line: 72 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v4 (copy)
                return v1.createElement(v4, {
                    InitialText = "Frame $Dialog .. TextButton $Main . ImageLabel", 
                    Images = true, 
                    Editable = true
                });
            end
        }, 
        {
            name = "PropertyCellError", 
            story = function() --[[ Line: 82 ]] --[[ Name: story ]]
                -- upvalues: v2 (copy), v1 (copy), v4 (copy)
                if v2 then
                    return (v1.createElement(v4, {
                        InitialText = "Frame $Dialog .. TextButton $Main . ImageLabel", 
                        Images = true, 
                        Editable = true, 
                        [v1.Tag] = "PropertyCellError"
                    }));
                else
                    return nil;
                end;
            end
        }
    }
};