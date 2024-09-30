# Runpoon

A nvim run helper based on the (Harpoon2)[https://github.com/ThePrimeagen/harpoon] of thePrimeagen.

# Mapping example

```lua
runpoon = {
  ["<leader>ar"] = { "<cmd> :lua require('runpoon.mark').add_file() <CR>", "add runpoon" },
  ["<C-S-e>"] = { "<cmd> :lua require('runpoon.ui').toggle_quick_menu() <CR>", "runpoon ui" },
}
```
