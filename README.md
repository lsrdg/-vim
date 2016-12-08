# vim-nvim

## Small tricks
Things that weren't that obvious at first. Any ideas to improve these are appreciated.

### Automatically comment </div> tags with classes names:

`map <leader>t yi"%A <!--^R"-->^[^o`

![macro](/gifs/macro.gif)

Place the cursor on the div's class, press `\t` (or whatever key your leader is mapped to).
This map will:

`yi"`  --> yank (copy) inside the duble quotes

`%`    --> find the next item in this line after or under the cursor and jump to its match (in this case the `</div>` matching tag)

`A`    --> Append text at the end of the line

`<!--` --> open the HTML comment

`^R"`  --> paste the yanked text (the classes)

`^[`   --> end insert mode, go back to normal mode

`^o`   --> jump back to the original position (so we don't get lost)

### Toogle text width
Couldn't find a way to toogle text width off (probably because it is not a boolean option).

```
nmap <leader>tw :set tw=80 <CR>
nmap <leader>twt :set tw=0 <CR>
```
`\tw` will set the text width to 80 characters.
`\twt` will set it to 0 (the default).

### Toogle relative and normal line numbers
The `set` below makes it show line numbers and relative numbers by default.
`\n`  --> will turn line numbers on/off.
`\nn` --> will turn relative line numbers on/off.
The `!` makes it possible to toogle on and off.

```
set number 
set relativenumber 
map <leader>n :set number! <CR>
map <leader>nn :set rnu! <CR>
```

### Netrw as the best file browser I have ever used
Mapping `<leader>`+`ff` to open Netrw into a vertical (and compact) split, on the left side and at the current directory:

```
nmap <leader>ff :20Lexplore<CR>
let g:netrw_altv = 1
```
Tree style listing:
```
let g:netrw_liststyle = 3
```
Remove the banner (`I` if you wanna see it again):
```
let g:netrw_banner = 0
``` 
Open files on the previous window (where you were before calling Netrw):
```
let g:netrw_browse_split = 4
```
With this setup Netrw will still appear in the buffer list, and it makes possible to delete a buffer without loosing windows setup:

### Delete a buffer, keep the splits as they were
`F6` will move to the previous buffer and then close the alternate buffer (the one that should be deleted).
```
nmap <F6> :bp<CR>:bd#<CR>
```
### Open ViFm in Neovim's terminal
Mapping `<leader>`+`fv` to create a vertical split, open the terminal emulator and open Vifm:
```
nmap <leader>f :50vs<CR>:terminal vifm<CR>
```
