local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Src.Types);
local v11 = {
    generate = function(v2) --[[ Line: 10 ]]
        -- upvalues: v1 (copy)
        math.randomseed(tick());
        local v3 = {};
        for v4 = 1, v2 do
            local v5 = nil;
            repeat
                v5 = math.random(1000, 1000000);
            until not v3[v5];
            local v6 = math.random(1, 5);
            local v7 = v1.getEnumAsList(v1.AssetType)[math.random(1, 5)];
            local v8 = v1.getEnumAsList(v1.ModerationStatus)[math.random(1, 3)];
            local v9 = math.random(1, 10);
            local v10 = if v4 == 1 then v1.Scope.User else v1.Scope.Group;
            v3[v5] = {
                AssetId = v5, 
                AssetType = v7, 
                DisplayName = ("Test %*"):format(v7), 
                VersionNumber = v9, 
                Created = DateTime.now(), 
                Modified = DateTime.now(), 
                ModerationStatus = v8, 
                Creator = {
                    Id = v6, 
                    Name = ("Creator %*"):format(v6), 
                    Scope = v10
                }
            };
        end;
        return v3;
    end
};
local v12 = {
    {
        AssetId = 1234567890, 
        AssetType = v1.AssetType.Model, 
        DisplayName = "Test Model", 
        Description = "This is a test model", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 1234567890, 
            Name = "TestUser", 
            Scope = v1.Scope.User
        }
    }, 
    {
        AssetId = 1234567891, 
        AssetType = v1.AssetType.Mesh, 
        DisplayName = "Test Mesh", 
        Description = "This is a test mesh", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 1234567892, 
            Name = "1234567892", 
            Scope = v1.Scope.Group
        }
    }, 
    {
        AssetId = 1234567892, 
        AssetType = v1.AssetType.Image, 
        DisplayName = "Test Image", 
        Description = "This is a test image", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 1234567893, 
            Name = "1234567893", 
            Scope = v1.Scope.Group
        }
    }, 
    {
        AssetId = 1234567893, 
        AssetType = v1.AssetType.Audio, 
        DisplayName = "Test Audio", 
        Description = "This is a test audio", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 1234567894, 
            Name = "1234567894", 
            Scope = v1.Scope.Group
        }
    }, 
    {
        AssetId = 1234567894, 
        AssetType = v1.AssetType.Video, 
        DisplayName = "Test Video", 
        Description = "This is a test video", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 1234567895, 
            Name = "1234567895", 
            Scope = v1.Scope.Group
        }
    }, 
    {
        AssetId = 1234567895, 
        AssetType = v1.AssetType.Image, 
        DisplayName = "Test Image", 
        Description = "This is a test image", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 1234567896, 
            Name = "1234567896", 
            Scope = v1.Scope.Group
        }
    }, 
    {
        AssetId = 1234567896, 
        AssetType = v1.AssetType.Video, 
        DisplayName = "Test Video", 
        Description = "This is a test video", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 1234567897, 
            Name = "1234567897", 
            Scope = v1.Scope.Group
        }
    }, 
    {
        AssetId = 1234567897, 
        AssetType = v1.AssetType.Animation, 
        DisplayName = "Test Animation", 
        Description = "This is a test animation", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 1234567898, 
            Name = "1234567898", 
            Scope = v1.Scope.Group
        }
    }, 
    {
        AssetId = 1234567898, 
        AssetType = v1.AssetType.Model, 
        DisplayName = "Mock Model", 
        Description = "This is a mock model", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 1234567899, 
            Name = "1234567899", 
            Scope = v1.Scope.Group
        }
    }, 
    {
        AssetId = 1234567899, 
        AssetType = v1.AssetType.Mesh, 
        DisplayName = "Mock Mesh", 
        Description = "This is a mock mesh", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 1234567900, 
            Name = "1234567900", 
            Scope = v1.Scope.Group
        }
    }, 
    {
        AssetId = 1234567900, 
        AssetType = v1.AssetType.Package, 
        DisplayName = "Mock Package", 
        Description = "This is a mock package", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 1234567901, 
            Name = "1234567901", 
            Scope = v1.Scope.Group
        }
    }, 
    {
        AssetId = 1234567901, 
        AssetType = v1.AssetType.Audio, 
        DisplayName = "Mock Audio", 
        Description = "This is a mock audio", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 1234567902, 
            Name = "1234567902", 
            Scope = v1.Scope.Group
        }
    }, 
    {
        AssetId = 1234567902, 
        AssetType = v1.AssetType.Mesh, 
        DisplayName = "Mock Mesh", 
        Description = "This is a mock mesh", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 1234567903, 
            Name = "1234567903", 
            Scope = v1.Scope.Group
        }
    }, 
    {
        AssetId = 1234567903, 
        AssetType = v1.AssetType.Image, 
        DisplayName = "Mock Image", 
        Description = "This is a mock image", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 1234567904, 
            Name = "1234567904", 
            Scope = v1.Scope.Group
        }
    }, 
    {
        AssetId = 1234567904, 
        AssetType = v1.AssetType.Video, 
        DisplayName = "Mock Video", 
        Description = "This is a mock video", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 1234567905, 
            Name = "1234567905", 
            Scope = v1.Scope.Group
        }
    }, 
    {
        AssetId = 1234567905, 
        AssetType = v1.AssetType.Animation, 
        DisplayName = "Mock Animation", 
        Description = "This is a mock animation", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 1234567906, 
            Name = "1234567906", 
            Scope = v1.Scope.Group
        }
    }
};
local v13 = {
    {
        AssetId = 1234, 
        AssetType = v1.AssetType.Mesh, 
        DisplayName = "Mock Mesh", 
        Description = "This is a mock mesh", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 987654321, 
            Name = "Group1", 
            Scope = v1.Scope.Group
        }
    }, 
    {
        AssetId = 1235, 
        AssetType = v1.AssetType.Decal, 
        DisplayName = "Mock Decal", 
        Description = "This is a mock decal", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 987654321, 
            Name = "Group1", 
            Scope = v1.Scope.Group
        }
    }, 
    {
        AssetId = 1236, 
        AssetType = v1.AssetType.Audio, 
        DisplayName = "Mock Audio", 
        Description = "This is a mock audio", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 987654321, 
            Name = "Group1", 
            Scope = v1.Scope.Group
        }
    }, 
    {
        AssetId = 1237, 
        AssetType = v1.AssetType.Mesh, 
        DisplayName = "Mock Mesh", 
        Description = "This is a mock mesh", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 987654321, 
            Name = "Group1", 
            Scope = v1.Scope.Group
        }
    }, 
    {
        AssetId = 1238, 
        AssetType = v1.AssetType.Image, 
        DisplayName = "Mock Image", 
        Description = "This is a mock image", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 987654321, 
            Name = "Group1", 
            Scope = v1.Scope.Group
        }
    }, 
    {
        AssetId = 1239, 
        AssetType = v1.AssetType.Video, 
        DisplayName = "Mock Video", 
        Description = "This is a mock video", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 987654321, 
            Name = "Group1", 
            Scope = v1.Scope.Group
        }
    }, 
    {
        AssetId = 12310, 
        AssetType = v1.AssetType.Animation, 
        DisplayName = "Mock Animation", 
        Description = "This is a mock animation", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 987654321, 
            Name = "Group1", 
            Scope = v1.Scope.Group
        }
    }
};
local v14 = {
    {
        AssetId = 8976, 
        AssetType = v1.AssetType.Mesh, 
        DisplayName = "Mock Mesh", 
        Description = "This is a mock mesh", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 87654321, 
            Name = "Group with a really long name", 
            Scope = v1.Scope.Group
        }
    }, 
    {
        AssetId = 7890, 
        AssetType = v1.AssetType.Decal, 
        DisplayName = "Mock Decal", 
        Description = "This is a mock decal", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v1.ModerationStatus.Approved, 
        Creator = {
            Id = 87654321, 
            Name = "Group with a really long name", 
            Scope = v1.Scope.Group
        }
    }
};
v11.UserId = 100000;
v11.UserName = "TestUser";
v11.GroupId1 = 987654321;
v11.GroupId2 = 87654321;
v11.GroupId3 = 7654321;
v11.Assets = {};
v11.Assets[v11.UserId] = v12;
v11.Assets[v11.GroupId1] = v13;
v11.Assets[v11.GroupId2] = v14;
v11.Groups = {
    data = {
        {
            Id = v11.GroupId1, 
            Name = "Group1", 
            Scope = v1.Scope.Group
        }, 
        {
            Id = v11.GroupId2, 
            Name = "Group with a really long name", 
            Scope = v1.Scope.Group
        }, 
        {
            Id = v11.GroupId3, 
            Name = "NoAssets :(", 
            Scope = v1.Scope.Group
        }
    }
};
return v11;