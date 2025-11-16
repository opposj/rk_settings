Settings RKWS is using.

*Currently including:*
1. The GDB settings.
2. The Vim settings.
3. A modified pdbp debuger.

*How to use:*
1. git clone --recursive --shallow-submodules --depth 1 https://github.com/opposj/rk_settings.git
2. mv rk_settings/.vim ~/
3. mv rk_settings/.vimrc ~/
4. mv rk_settings/.gdb_helper ~/
5. cat ~/.gdb_helper/gdb.init >> ~/.gdbinit
6. python ~/.vim/pack/vendor/opt/vimspector/install_gadget.py --enable-python
7. mv ~/.vimspector_config ~/.vim/pack/vendor/opt/vimspector/configurations/linux/_all/vimspector.json
8. vim -c "helptags ~/.vim/pack/vendor/opt/jedi-vim/doc" -c "q"
9. vim -c "helptags ~/.vim/pack/vendor/opt/vimspector/doc" -c "q"
10. rm -rf rk_settings
