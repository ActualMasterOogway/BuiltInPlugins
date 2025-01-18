local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Controllers_0 = l_Parent_0.Src.Controllers;
local v7 = require(l_Controllers_0.ImportAssetHandler);
local v8 = require(l_Controllers_0.GeneralServiceController);
local v9 = require(l_Parent_0.Src.Components.MaterialBrowser.MaterialEditor.LabeledElement);
local v10 = require(l_Parent_0.Src.Components.PromptSelectorWithPreview);
local v11 = require(l_Parent_0.Src.Resources.Constants.getErrorTypes)();
local v12 = v1.PureComponent:extend("TextureMapSelector");
v12.init = function(v13) --[[ Line: 41 ]] --[[ Name: init ]]
    v13.state = {
        importAsset = {}, 
        uploading = false
    };
    v13.errorMessage = nil;
    v13.checkIsMounted = function() --[[ Line: 48 ]]
        -- upvalues: v13 (copy)
        return v13._isMounted;
    end;
    v13.setImportAsset = function(v14, v15) --[[ Line: 52 ]]
        -- upvalues: v13 (copy)
        if not v13.checkIsMounted() then
            return;
        elseif v14 and v15 and (not v13.errorMessage or v13.errorMessage == "") then
            v13:setState({
                importAsset = {
                    file = v14, 
                    tempId = v15
                }
            });
            return;
        else
            v13:setState({
                importAsset = {}
            });
            return;
        end;
    end;
    v13.clearTextureMap = function() --[[ Line: 70 ]]
        -- upvalues: v13 (copy)
        local l_props_0 = v13.props;
        local l_PBRMaterial_0 = l_props_0.PBRMaterial;
        l_props_0.GeneralServiceController:setTextureMap(l_PBRMaterial_0, l_props_0.MapType, "");
        v13.setImportAsset(nil);
    end;
    v13.setUploading = function(v18) --[[ Line: 78 ]]
        -- upvalues: v13 (copy)
        if not v13.checkIsMounted() then
            return;
        else
            v13:setState({
                uploading = v18
            });
            return;
        end;
    end;
    v13.updateTextureMap = function(v19, v20, v21) --[[ Line: 87 ]]
        -- upvalues: v13 (copy)
        local l_props_1 = v13.props;
        local l_PBRMaterial_1 = l_props_1.PBRMaterial;
        l_props_1.GeneralServiceController:setTextureMap(l_PBRMaterial_1, l_props_1.MapType, v19);
        l_props_1.Analytics:report(v20);
        v13.errorMessage = v21;
        v13.setImportAsset(nil);
        v13.setUploading(false);
    end;
    v13.promptSelection = function() --[[ Line: 98 ]]
        -- upvalues: v13 (copy)
        local l_props_2 = v13.props;
        local l_ImportAssetHandler_0 = l_props_2.ImportAssetHandler;
        l_props_2.GeneralServiceController:setTextureMapFromFile(l_props_2.PBRMaterial, l_props_2.MapType, l_ImportAssetHandler_0, v13.setUploading, v13.setImportAsset, v13.updateTextureMap);
    end;
    v13.onFocusLost = function(v26, v27) --[[ Line: 112 ]]
        -- upvalues: v13 (copy)
        local l_props_3 = v13.props;
        local l_Text_0 = v27.Text;
        if not v26 then
            return;
        elseif not l_Text_0 or l_Text_0 == "" then
            v13.clearTextureMap();
            return;
        else
            l_props_3.GeneralServiceController:setTextureMapFromURL(l_props_3.PBRMaterial, l_props_3.MapType, l_Text_0, v13.checkIsMounted, v13.updateTextureMap);
            return;
        end;
    end;
end;
v12.didMount = function(v30) --[[ Line: 133 ]] --[[ Name: didMount ]]
    v30._isMounted = true;
end;
v12.willUnmount = function(v31) --[[ Line: 137 ]] --[[ Name: willUnmount ]]
    v31._isMounted = false;
end;
v12.didUpdate = function(v32, v33) --[[ Line: 141 ]] --[[ Name: didUpdate ]]
    if v33.PBRMaterial ~= v32.props.PBRMaterial then
        v32:setState({
            importAsset = {}, 
            uploading = false
        });
        v32.errorMessage = nil;
    end;
end;
v12.render = function(v34) --[[ Line: 151 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v1 (copy), v9 (copy), v10 (copy)
    local l_props_4 = v34.props;
    local l_state_0 = v34.state;
    local l_Localization_1 = l_props_4.Localization;
    local v38 = "";
    local v39 = "";
    local v40 = false;
    local l_PBRMaterial_2 = l_props_4.PBRMaterial;
    if l_state_0.importAsset and l_state_0.importAsset.tempId or l_PBRMaterial_2[l_props_4.MapType] ~= "" then
        v38 = if l_state_0.importAsset.file then l_state_0.importAsset.file.Name else l_PBRMaterial_2[l_props_4.MapType];
        if l_state_0.uploading == true and l_state_0.importAsset and l_state_0.importAsset.tempId then
            v39 = l_state_0.importAsset.tempId;
            v40 = true;
        else
            v39 = l_PBRMaterial_2[l_props_4.MapType];
            v40 = false;
        end;
    end;
    local v42 = nil;
    local v43 = nil;
    if l_PBRMaterial_2[l_props_4.MapType] == "" then
        if v34.errorMessage and v34.errorMessage ~= "" and v34.errorMessage ~= v11.FailedToInsertAssetManager then
            v42 = Enum.PropertyStatus.Error;
            v43 = l_Localization_1:getText("CreateDialog", v34.errorMessage);
        end;
    elseif v34.errorMessage == v11.FailedToInsertAssetManager then
        v42 = Enum.PropertyStatus.Warning;
        v43 = l_Localization_1:getText("CreateDialog", v34.errorMessage);
    else
        v42 = Enum.PropertyStatus.Ok;
        v34.errorMessage = nil;
    end;
    return v1.createElement(v9, {
        FillDirection = Enum.FillDirection.Vertical, 
        LayoutOrder = l_props_4.LayoutOrder, 
        LabelColumnWidth = l_props_4.LabelColumnWidth, 
        Text = l_props_4.Text, 
        StatusText = v43, 
        Status = v42
    }, {
        v1.createElement(v10, {
            SelectionName = v38, 
            PreviewTitle = l_props_4.PreviewTitle, 
            IsTempId = v40, 
            ImageId = v39, 
            LabelWidth = l_props_4.LabelWidth, 
            PromptSelection = v34.promptSelection, 
            SearchUrl = l_PBRMaterial_2[l_props_4.MapType], 
            ClearSelection = v34.clearTextureMap, 
            OnFocusLost = v34.onFocusLost, 
            ColumnWidth = l_props_4.ColumnWidth
        })
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    GeneralServiceController = v8, 
    Localization = l_Localization_0, 
    ImportAssetHandler = v7
})(v12));