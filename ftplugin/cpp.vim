" Comments's settings
set comments=sl:/*,mb:\ *,elx:\ */

" Creatings new tags
" ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f <package_name> <package_include_dir>
" set tags+=~/.vim/tags/<package_name>
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/pleora
set tags+=~/.vim/tags/ros_indigo
set tags+=~/.vim/tags/socketio-client

" OmniCppComplete's settings
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

""""""""""""""
" Keybinding "
""""""""""""""

" Create tags for current project: Ctrl+F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR> 

" Switch between .hpp and .cpp: F4
map <F4> :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X,.cpp,<CR>

" Recreate tags: F5
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Create doxygen comment: F6
map <F6> :Dox<CR>

" Launch make: F7, +clean  S-F7
map <F7> :CMake<CR>
map <S-F7> :CMakeClean<CR>

" Start build : F8
map <F8> :!cd build && make && cd ..<CR>

" Run : F9
map <F9> :!./build/$(basename `pwd`)<CR>

" DoxygenToolkit's Settings
let g:DoxygenToolkit_authorName = "Jérémy Jarrié <jarrie.jeremy@gmail.com>"

