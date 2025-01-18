local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v6 = require(l_Util_0.Images);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = v3.PureComponent:extend("CollaboratorThumbnail");
v9.init = function(v10) --[[ Line: 25 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v10.state = {
        backgroundColor = nil
    };
    local function v12() --[[ Line: 34 ]] --[[ Name: colorChanged ]]
        -- upvalues: v10 (copy)
        local l_current_0 = v10.ref.current;
        if l_current_0 == nil then
            return;
        else
            v10:setState({
                backgroundColor = l_current_0.Parent.BackgroundColor3
            });
            return;
        end;
    end;
    v10.parentChanged = function() --[[ Line: 44 ]]
        -- upvalues: v10 (copy), v12 (copy)
        local l_current_1 = v10.ref.current;
        if l_current_1 == nil then
            return;
        else
            if v10.colorChanged then
                v10.colorChanged:Disconnect();
                v10.colorChanged = nil;
            end;
            if l_current_1.Parent then
                v10.colorChanged = l_current_1.Parent:GetPropertyChangedSignal("BackgroundColor3"):Connect(v12);
                local l_current_2 = v10.ref.current;
                if l_current_2 == nil then
                    return;
                else
                    v10:setState({
                        backgroundColor = l_current_2.Parent.BackgroundColor3
                    });
                end;
            end;
            return;
        end;
    end;
    v10.ref = v3.createRef();
end;
v9.didMount = function(v15) --[[ Line: 65 ]] --[[ Name: didMount ]]
    v15.parentChangedSignal = v15.ref.current:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 71 ]]
        -- upvalues: v15 (copy)
        v15.parentChanged();
    end);
    v15.parentChanged();
end;
v9.willUnmount = function(v16) --[[ Line: 77 ]] --[[ Name: willUnmount ]]
    if v16.parentChangedSignal then
        v16.parentChangedSignal:Disconnect();
        v16.parentChangedSignal = nil;
    end;
    if v16.colorChanged then
        v16.colorChanged:Disconnect();
        v16.colorChanged = nil;
    end;
end;
v9.render = function(v17) --[[ Line: 89 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy), v6 (copy)
    local l_Stylizer_0 = v17.props.Stylizer;
    local v19 = v17.props.UseMask or false;
    local v20 = v17.props.IsLoadedThumbnail or false;
    local v21 = v2.Dictionary.join(v17.props, {
        UseMask = v2.None, 
        IsLoadedThumbnail = v2.None, 
        Stylizer = v2.None
    });
    return v3.createElement("ImageLabel", v2.Dictionary.join(v21, {
        [v3.Ref] = v17.ref, 
        ImageColor3 = v20 and Color3.new(1, 1, 1) or l_Stylizer_0.assetConfig.packagePermissions.subjectThumbnail.defaultImageColor, 
        ImageTransparency = 0, 
        BackgroundColor3 = l_Stylizer_0.assetConfig.packagePermissions.subjectThumbnail.backgroundColor, 
        BackgroundTransparency = v19 and 0 or 1, 
        BorderSizePixel = 0
    }), {
        Mask = v19 and v3.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Image = v6.AVATAR_MASK, 
            ImageColor3 = v17.state.backgroundColor
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));