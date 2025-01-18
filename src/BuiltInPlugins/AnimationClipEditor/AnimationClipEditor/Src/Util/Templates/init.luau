local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local l_HttpService_0 = game:GetService("HttpService");
local _ = require(l_script_FirstAncestor_0.Src.Types);
return {
    animationData = function() --[[ Line: 12 ]] --[[ Name: animationData ]]
        -- upvalues: l_HttpService_0 (copy)
        return {
            Metadata = {
                Name = "", 
                StartTick = 0, 
                EndTick = 0, 
                Looping = false, 
                Priority = Enum.AnimationPriority.Core, 
                FrameRate = 30, 
                Guid = l_HttpService_0:GenerateGUID()
            }, 
            Events = {
                NamedKeyframes = {}, 
                Keyframes = {}, 
                Data = {}
            }, 
            Instances = {
                Root = {
                    Type = nil, 
                    Tracks = {}
                }
            }
        };
    end, 
    instance = function() --[[ Line: 40 ]] --[[ Name: instance ]]
        return {
            Type = nil, 
            Tracks = {}
        };
    end, 
    track = function(v3) --[[ Line: 47 ]] --[[ Name: track ]]
        return {
            Type = v3, 
            IsCurveTrack = false
        };
    end, 
    trackListEntry = function(v4) --[[ Line: 54 ]] --[[ Name: trackListEntry ]]
        return {
            Name = "", 
            Depth = 0, 
            Expanded = false, 
            Selected = false, 
            Type = v4
        };
    end, 
    keyframe = function() --[[ Line: 64 ]] --[[ Name: keyframe ]]
        return {
            Value = nil, 
            EasingStyle = nil, 
            EasingDirection = nil, 
            InterpolationMode = nil, 
            LeftSlope = nil, 
            RightSlope = nil
        };
    end
};