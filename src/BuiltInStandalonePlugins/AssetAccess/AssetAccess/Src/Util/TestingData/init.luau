local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetAccess");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = {
    AssetMetadata = {}
};
v2.AssetMetadata.PUBLIC = table.freeze({
    id = 123, 
    visibility = "Public", 
    name = "Asset1", 
    owner = "User1", 
    type = Enum.AssetType.Audio
});
v2.AssetMetadata.PRIVATE = table.freeze({
    id = 456, 
    visibility = "Private"
});
table.freeze(v2.AssetMetadata);
v2.AssetModel = {};
v2.AssetModel.LOADED_PUBLIC = table.freeze({
    state = "Loaded", 
    metadata = table.freeze(table.clone(v2.AssetMetadata.PUBLIC))
});
v2.AssetModel.LOADED_PRIVATE = table.freeze({
    state = "Loaded", 
    metadata = table.freeze(table.clone(v2.AssetMetadata.PRIVATE))
});
v2.AssetModel.LOADING = table.freeze({
    state = "Loading"
});
v2.AssetModel.FAILED = table.freeze({
    state = "Failed"
});
table.freeze(v2.AssetModel);
v2.INACCESSIBLE_ASSET_MODELS = table.freeze({
    [123] = table.freeze(table.clone(v2.AssetModel.LOADED_PUBLIC)), 
    [456] = table.freeze(table.clone(v2.AssetModel.LOADED_PRIVATE)), 
    [789] = table.freeze(table.clone(v2.AssetModel.LOADING)), 
    [101112] = table.freeze(table.clone(v2.AssetModel.FAILED))
});
v2.UNSHARABLE_ASSET_MODELS = {};
v2.INACCESSIBLE_ASSET_IDS = {};
v2.UNSHARABLE_ASSET_IDS = {};
for v3, v4 in v2.INACCESSIBLE_ASSET_MODELS do
    table.insert(v2.INACCESSIBLE_ASSET_IDS, v3);
    if v3 % 2 == 1 then
        table.insert(v2.UNSHARABLE_ASSET_IDS, v3);
        v2.UNSHARABLE_ASSET_MODELS[v3] = table.freeze(table.clone(v4));
    end;
end;
table.freeze(v2.UNSHARABLE_ASSET_MODELS);
table.freeze(v2.INACCESSIBLE_ASSET_IDS);
table.freeze(v2.UNSHARABLE_ASSET_IDS);
v2.ShareDialogModel = {};
v2.ShareDialogModel.INACTIVE = table.freeze({
    state = "Inactive"
});
v2.ShareDialogModel.PROMPT = table.freeze({
    state = "Prompt", 
    assetModels = table.freeze(table.clone(v2.INACCESSIBLE_ASSET_MODELS))
});
v2.ShareDialogModel.SHARING = table.freeze({
    state = "Sharing", 
    assetModels = table.freeze(table.clone(v2.INACCESSIBLE_ASSET_MODELS))
});
v2.ShareDialogModel.CANT_SHARE = table.freeze({
    state = "CantShare", 
    assetModels = table.freeze(table.clone(v2.UNSHARABLE_ASSET_MODELS))
});
v2.ShareDialogModel.UNEXPECTED_ERROR = table.freeze({
    state = "UnexpectedError"
});
table.freeze(v2.ShareDialogModel);
return table.freeze(v2);