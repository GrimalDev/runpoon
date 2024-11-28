# Runpoon

A nvim run helper based on the [Harpoon](https://github.com/ThePrimeagen/harpoon) of thePrimeagen.

# Mapping example

```lua
runpoon = {
  n = {
    {"<leader>ar", "<cmd> :lua require('runpoon.mark').add_file() <CR>", { desc = "add runpoon" } },
    {"<C-S-e>", "<cmd> :lua require('runpoon.ui').toggle_quick_menu() <CR>", { desc = "runpoon ui" } },
  
    {"<A-m>", "<cmd> :lua require('runpoon.ui').run_file(1) <CR>", { desc = "runpoon run file 1" } },
    {"<A-,>", "<cmd> :lua require('runpoon.ui').run_file(2) <CR>", { desc = "runpoon run file 2" } },
    {"<A-.>", "<cmd> :lua require('runpoon.ui').run_file(3) <CR>", { desc = "runpoon run file 3" } },
    {"<A-/>", "<cmd> :lua require('runpoon.ui').run_file(4) <CR>", { desc = "runpoon run file 4" } },
  }
}
```
