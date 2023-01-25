---@meta

---@class ChadrcConfig
---@field ui? UIConfig
---@field plugins? NvPluginsTable If a `PluginName` is set to `false`, remove it from the plugin config
---@field mappings? MappingsConfig

---@class UIConfig
---@field hl_add? HLTable List of highlight groups to add. Should be highlights that is not a part of base46 definition. Check [base46 integrations](https://github.com/NvChad/base46/tree/master/lua/base46/integrations) for more information
---@field hl_override? HLTable List of highlight groups that will override the highlight inside each integration. Check [base46 integrations](https://github.com/NvChad/base46/tree/master/lua/base46/integrations) for more information
---@field theme_toggle? {[1]: string, [2]: string} the theme you want to toggle between. One of them has to be the same with the one set in `theme`
---@field transparency? boolean Whether to compiled with transparent background or not
---@field theme? string theme to use. List of theme can be find on [base46 Repo](https://github.com/NvChad/base46/tree/master/lua/base46/themes)
---@field cmp? NvCmpConfig options for UI of nvim-cmp popup menu
---@field statusline? NvStatusLineConfig options for NvChad custom statusline
---@field tabufline? NvTabufLineConfig options for NvChad custom tabline
---@field nvdash? NvDashConfig Options for NvChad custom dashboard menu
---@field cheatsheet? NvCheatSheetConfig Options for NvChad cheatsheet menu

---@alias HLTable table<string, Base46HLGroups>

---@class NvCmpConfig
---@field icons boolean Whether to add colors to icons in nvim-cmp popup menu
---@field lspkind_text boolean Whether to also have the lsp kind highlighted with the icons as well or not
---@field style '"default"'|'"flat_light"'|'"flat_dark"'|'"atom"'|'"atom_colored"' nvim-cmp style
---@field border_color string|Base30Colors Only has effects when the style is `default`
---@field selected_item_bg '"colored"'|'"simple"'

---@class NvStatusLineConfig
---@field theme '"default"'|'"vscode"'|'"vscode_colored"'|'"minimal"' statusline theme
---@field separator_style '"default"'|'"round"'|'"block"' As of now, `round` and `block` only works for minimal theme
---@field overriden_modules? fun(): table List of modules that you override. Check [UI Plugins](https://nvchad.com/config/nvchad_ui) for more information

---@class NvTabufLineConfig
---@field enabled boolean whether to enable custom tabufline or not
---@field lazyload boolean If true, will only load custom tabufline if there's two or more buffers/tabs
---@field overriden_modules? fun(): table List of modules that you override. Check [UI Plugins](https://nvchad.com/config/nvchad_ui) for more information

---@class NvDashConfig
---@field load_on_startup boolean If true, load in dashboard when opening nvim
---@field header string[] Your ascii art
---@field buttons NvDashButtonConfig[] List of buttons on the dashboard

---@class NvDashButtonConfig
---@field [1] string Description for the button
---@field [2] string sequence of keys to press to trigger the keybind
---@field [3] string|fun() A Vim Command/A Lua function to be triggered when pressing the keybind/pressing enter on the line with the description on the dashboard

---@class NvCheatSheetConfig
---@field theme '"grid"'|'"simple"' Cheat sheet theme


--- List of keymaps that is part of `core/mappings.lua` that will be removed
---@alias DisabledTable {[VimKeymapMode]: DisabledKeymaps}

---@alias DisabledKeymaps {[string]: '""'|false}

---@alias MappingsConfig {disabled: DisabledTable, [string]: MappingsTable}

---@alias MappingsTable {[VimKeymapMode]: table<lhs, KeymapConfig>}

---@alias lhs string

---@class KeymapConfig
---@field [1] string|fun() A Vimscript string or a Lua function. `rhs` of the keymap
---@field [2] string Description for the keymap
---@field [3] NvKeymapOpts? List of additional options for the keymap
