local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework).RobloxAPI.Url.new();
return {
    EXPERIENCES_SEARCH_URL = {
        Prefix = v1.APIS_URL, 
        Url = function() --[[ Line: 16 ]] --[[ Name: Url ]]
            return "universes/v1/search";
        end
    }, 
    TEMPLATES_SEARCH_URL = {
        Prefix = v1.DEVELOP_URL, 
        Url = function() --[[ Line: 23 ]] --[[ Name: Url ]]
            return "v1/gametemplates";
        end
    }, 
    PLACES_SEARCH_URL = {
        Prefix = v1.DEVELOP_URL, 
        Url = function(v2) --[[ Line: 30 ]] --[[ Name: Url ]]
            return (("v2/universes/%*/places"):format(v2));
        end
    }, 
    GROUPS_SEARCH_URL = {
        Prefix = v1.DEVELOP_URL, 
        Url = function() --[[ Line: 37 ]] --[[ Name: Url ]]
            return "v1/user/groups/canmanage";
        end
    }, 
    EXPERIENCES_ICON_URL = {
        Prefix = v1.THUMBNAILS_URL, 
        Url = function() --[[ Line: 44 ]] --[[ Name: Url ]]
            return "/v1/games/icons";
        end
    }, 
    TEAM_CREATE_ACTIVE_SESSION_MEMBERS_URL = {
        Prefix = v1.APIS_URL, 
        Url = function() --[[ Line: 51 ]] --[[ Name: Url ]]
            return "teamcreate/v1/MultiGetUniversesActiveSessionMembers";
        end
    }, 
    AVATAR_ICON_URL = {
        Prefix = v1.THUMBNAILS_URL, 
        Url = function() --[[ Line: 58 ]] --[[ Name: Url ]]
            return "v1/users/avatar-headshot";
        end
    }, 
    MULTI_AGE_RECOMMENDATION = {
        Prefix = v1.APIS_URL, 
        Url = function() --[[ Line: 65 ]] --[[ Name: Url ]]
            return "experience-guidelines-service/v1beta1/multi-age-recommendation";
        end
    }, 
    MULTI_CREATOR_ELIGIBILITY = {
        Prefix = v1.APIS_URL, 
        Url = function() --[[ Line: 72 ]] --[[ Name: Url ]]
            return "experience-guidelines-service/v1beta1/multi-creator-eligibility";
        end
    }, 
    MULTI_TEAM_CREATE_STATUS = {
        Prefix = v1.DEVELOP_URL, 
        Url = function() --[[ Line: 79 ]] --[[ Name: Url ]]
            return "v1/universes/multiget/teamcreate";
        end
    }, 
    ACTIVATE_UNIVERSE = {
        Prefix = v1.DEVELOP_URL, 
        Url = function(v3) --[[ Line: 86 ]] --[[ Name: Url ]]
            return (("v1/universes/%*/activate"):format(v3));
        end
    }, 
    DEACTIVATE_UNIVERSE = {
        Prefix = v1.DEVELOP_URL, 
        Url = function(v4) --[[ Line: 93 ]] --[[ Name: Url ]]
            return (("v1/universes/%*/deactivate"):format(v4));
        end
    }, 
    UNIVERSE_CONFIGURATION = {
        Prefix = v1.DEVELOP_URL, 
        Url = function(v5) --[[ Line: 100 ]] --[[ Name: Url ]]
            return (("v1/universes/%*/configuration"):format(v5));
        end
    }, 
    UNIVERSE_DATA = {
        Prefix = v1.DEVELOP_URL, 
        Url = function() --[[ Line: 107 ]] --[[ Name: Url ]]
            return "v1/universes/multiget";
        end
    }, 
    TEAMCREATE_MEMBERSHIPS = {
        Prefix = v1.DEVELOP_URL, 
        Url = function(v6) --[[ Line: 114 ]] --[[ Name: Url ]]
            return (("v1/universes/%*/teamcreate/memberships"):format(v6));
        end
    }, 
    MULTIGET_PLACES = {
        Prefix = v1.GAMES_URL, 
        Url = function() --[[ Line: 121 ]] --[[ Name: Url ]]
            return "v1/games/multiget-place-details";
        end
    }, 
    TEST_TEMPLATES = {
        Prefix = v1.APIS_URL, 
        Url = function() --[[ Line: 128 ]] --[[ Name: Url ]]
            return "studio-test-templates-service/v1/test-templates";
        end
    }
};