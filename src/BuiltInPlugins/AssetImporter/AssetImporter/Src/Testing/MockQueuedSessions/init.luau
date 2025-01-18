local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
return {
    Empty = v1.new(), 
    Cube = v1.new({
        assetName = "Cube", 
        enabled = true, 
        filepath = "my/path/Cube", 
        timestamp = DateTime.now(), 
        validSession = true
    }), 
    Sphere = v1.new({
        assetName = "Sphere", 
        enabled = true, 
        filepath = "my/path/Sphere", 
        timestamp = DateTime.now(), 
        validSession = true
    }), 
    Octahedron = v1.new({
        assetName = "Octahedron", 
        enabled = true, 
        filepath = "my/path/Octahedron", 
        timestamp = DateTime.now(), 
        validSession = true
    }), 
    Dodecahedron = v1.new({
        assetName = "Dodecahedron", 
        enabled = true, 
        filepath = "my/path/Dodecahedron", 
        timestamp = DateTime.now(), 
        validSession = true
    }), 
    Rhombicosidodecahedron = v1.new({
        assetName = "Rhombicosidodecahedron", 
        enabled = true, 
        filepath = "my/path/Rhombicosidodecahedron", 
        timestamp = DateTime.now(), 
        validSession = true
    }), 
    RigAsset = v1.new({
        assetName = "RigAsset", 
        enabled = true, 
        filepath = "my/path/RigAsset", 
        timestamp = DateTime.now(), 
        validSession = true
    }), 
    EnvironmentalAsset = v1.new({
        assetName = "EnvironmentalAsset", 
        enabled = false, 
        filepath = "my/path/EnvironmentalAsset", 
        timestamp = DateTime.now(), 
        validSession = true
    }), 
    InvalidAsset = v1.new({
        assetName = "InvalidAsset", 
        enabled = false, 
        filepath = "my/path/InvalidAsset", 
        timestamp = DateTime.now(), 
        validSession = false
    }), 
    HasImportDataError = v1.new({
        assetName = "HasImportDataError", 
        enabled = true, 
        filepath = "my/path/HasImportDataError", 
        timestamp = DateTime.now(), 
        validSession = true, 
        importDataError = true
    }), 
    EnabledInvalidAsset = v1.new({
        assetName = "EnabledInvalidAsset", 
        enabled = true, 
        filepath = "my/path/EnabledInvalidAsset", 
        timestamp = DateTime.now(), 
        validSession = false
    }), 
    UploadedAsset = v1.new({
        assetName = "UploadedAsset", 
        enabled = false, 
        filepath = "my/path/UploadedAsset", 
        timestamp = DateTime.now(), 
        validSession = false, 
        uploaded = true
    })
};