
local fs = require "nixio.fs"
local uci = require "luci.model.uci"
local ngx = require "ngx"

local ezwrt_config = ngx.shared.ezwrt_config

-- ngx start: read current state from config.
local function init_config_from_uci(cnfname, shmd_cnf)
    local _uci = uci.cursor()

    shmd_cnf:set("guide", '0')

    local _guide = _uci.get(cnfname, 'sysconfig', 'webguide')

    shmd_cnf:set("guide", _guide or '1')

end

init_config_from_uci("ezwrt", ezwrt_config)

