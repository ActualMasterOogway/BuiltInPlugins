local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getFFlagMeshPartAccessoryPBRSupport);
return function(v2) --[[ Line: 6 ]] --[[ Name: createMeshPartAccessorySchema ]]
    -- upvalues: v1 (copy)
    assert(v2, "attachmentName cannot be nil");
    if v1() then
        return {
            ClassName = "Accessory", 
            _children = {
                {
                    Name = "ThumbnailConfiguration", 
                    ClassName = "Configuration", 
                    _optional = true, 
                    _children = {
                        {
                            Name = "ThumbnailCameraTarget", 
                            ClassName = "ObjectValue"
                        }, 
                        {
                            Name = "ThumbnailCameraValue", 
                            ClassName = "CFrameValue"
                        }
                    }
                }, 
                {
                    Name = "Handle", 
                    ClassName = "MeshPart", 
                    _children = {
                        {
                            Name = v2, 
                            ClassName = "Attachment"
                        }, 
                        {
                            ClassName = "SurfaceAppearance", 
                            Name = "SurfaceAppearance", 
                            _optional = true
                        }, 
                        {
                            ClassName = "StringValue", 
                            Name = "AvatarPartScaleType", 
                            _optional = true
                        }, 
                        {
                            ClassName = "TouchTransmitter", 
                            Name = "TouchInterest", 
                            _optional = true
                        }
                    }
                }
            }
        };
    else
        return {
            ClassName = "Accessory", 
            _children = {
                {
                    Name = "ThumbnailConfiguration", 
                    ClassName = "Configuration", 
                    _optional = true, 
                    _children = {
                        {
                            Name = "ThumbnailCameraTarget", 
                            ClassName = "ObjectValue"
                        }, 
                        {
                            Name = "ThumbnailCameraValue", 
                            ClassName = "CFrameValue"
                        }
                    }
                }, 
                {
                    Name = "Handle", 
                    ClassName = "MeshPart", 
                    _children = {
                        {
                            Name = v2, 
                            ClassName = "Attachment"
                        }, 
                        {
                            ClassName = "StringValue", 
                            Name = "AvatarPartScaleType", 
                            _optional = true
                        }, 
                        {
                            ClassName = "TouchTransmitter", 
                            Name = "TouchInterest", 
                            _optional = true
                        }
                    }
                }
            }
        };
    end;
end;