local utils = require 'mp.utils'

function get_system_theme()
    -- Detect GNOME system theme on Linux as example
    local command = { "gsettings", "get", "org.gnome.desktop.interface", "color-scheme" }
    local result = utils.subprocess({ args = command })
    if result.status == 0 then
        if result.stdout:find("dark") then
            return "dark"
        else
            return "light"
        end
    end
    return "dark" -- default fallback
end

function apply_theme()
    local theme = get_system_theme()
    if theme == "light" then
        mp.set_property("sub-color", "0.0/0.0/0.0/1.0")
    else
        mp.set_property("sub-color", "1.0/1.0/1.0/1.0")
    end
end

apply_theme()

